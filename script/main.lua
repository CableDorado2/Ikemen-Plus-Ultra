
math.randomseed(os.time())
package.path = package.path..';./script/ltn12.lua'
ltn12 = require('ltn12')

--;===========================================================
--; SCREENPACK DEFINITION
--;===========================================================
--Create global space (accessing variables between modules)
data = require('script.data')

--Load saved variables
assert(loadfile('script/data_sav.lua'))()
assert(loadfile('script/unlocks_sav.lua'))()

--Assign Lifebar
loadLifebar(data.lifebar) --path to lifebar stored in 'script/data_sav.lua', also adjustable from options

--Debug stuff
loadDebugFont('font/font2.fnt')
setDebugScript('script/debug.lua')

--SFF
sysSff = sffNew('data/system.sff')
fadeSff = sffNew('data/fade.sff')
stageSff = sffNew('data/stages.sff')

--SND
sysSnd = sndNew('data/system.snd')

--Fonts
jgFnt = fontNew('font/JG.fnt')
font1 = fontNew('font/f-4x6.fnt')
font2 = fontNew('font/f-6x9.fnt')
survBarsFnt = fontNew('font/survival_bars.fnt')
survNumFnt = fontNew('font/survival_nums.fnt')

--Music
bgmTitle = 'sound/Title.mp3'
bgmSelect = 'sound/Select.mp3'
bgmSelectBoss = 'sound/Select Boss.mp3'
bgmVS = 'sound/VS.mp3'
bgmVSFinal = 'sound/VS Final.mp3'
bgmVictory = 'sound/Victory.mp3'
bgmResults = 'sound/Results.mp3'
bgmNothing = 'Nothing.mp3'

--Random Versus Music
function f_bgmrandomVS()
local randomTrack = {"sound/Random VS/Song 1.mp3", "sound/Random VS/Song 2.mp3"}
playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Random Menu Music
function f_bgmrandomMenu()
local randomTrack = {"sound/Menu 1.mp3", "sound/Menu 2.mp3"}
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
	elseif data.menuSong == 'Random' then
		f_bgmrandomMenu()
	end
end	

--Video
--videoOpening = "video/Opening.wmv"
--videoHowToPlay = "video/How To Play.wmv"

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
	commandAdd(c, 's', 's')
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
	if commandGetState(cmd, 's') then return 1 + s end --start button	
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
	local toFile = toFile or 'debug/table_print.txt'
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
	local toFile = toFile or 'debug/var_print.txt'
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

txt_loading = createTextImg(font1, 0, -1, 'LOADING...', 310, 230)

--;===========================================================
--; LOAD ADDITIONAL SCRIPTS
--;===========================================================
require('script.randomtest')
assert(loadfile('script/parser.lua'))()
require('script.options')
require('script.select')
require('script.continue')
require('script.storyboard')

--;===========================================================
--; TITLE BACKGROUND DEFINITION
--;===========================================================
--Buttons Background
titleBG0 = animNew(sysSff, [[
5,1, 0,145, -1
]])
animAddPos(titleBG0, 160, 0)
animSetTile(titleBG0, 1, 1)
animSetWindow(titleBG0, 0, 145, 320, 75)
--parallax is not supported in ikemen
--type  = parallax
--width = 400, 1200
--yscalestart = 100
--yscaledelta = 1

--Buttons Background (fade)
titleBG1 = animNew(sysSff, [[
5,2, -160,145, -1, 0, s
]])
animAddPos(titleBG1, 160, 0)
animUpdate(titleBG1)

--Background Top
titleBG2 = animNew(sysSff, [[
5,0, 0,10, -1
]])
animAddPos(titleBG2, 160, 0)
animSetTile(titleBG2, 1, 2)

--Hardcore Background Top
titleHardBG2 = animNew(sysSff, [[
6,0, 0,10, -1
]])
animAddPos(titleHardBG2, 160, 0)
animSetTile(titleHardBG2, 1, 2)

--Logo
titleBG3 = animNew(sysSff, [[
0,0, 0,40, -1, 0, a
]])
animAddPos(titleBG3, 160, 0)
animUpdate(titleBG3)

--Background Middle (black text cover)
titleBG4 = animNew(sysSff, [[
5,1, 0,145, -1
]])
animAddPos(titleBG4, 160, 0)
animSetTile(titleBG4, 1, 1)
animSetWindow(titleBG4, 0, 138, 320, 7)
animSetAlpha(titleBG4, 0, 0)
animUpdate(titleBG4)

--Hardcore Background Middle (black text cover)
titleHardBG4 = animNew(sysSff, [[
6,1, 0,145, -1
]])
animAddPos(titleHardBG4, 160, 0)
animSetTile(titleHardBG4, 1, 1)
animSetWindow(titleHardBG4, 0, 138, 320, 7)
animSetAlpha(titleHardBG4, 0, 0)
animUpdate(titleHardBG4)

--Background Bottom (black text cover)
titleBG5 = animNew(sysSff, [[
5,1, 0,145, -1
]])
animAddPos(titleBG5, 160, 0)
animSetTile(titleBG5, 1, 1)
animSetWindow(titleBG5, 0, 223, 320, 20)
animSetAlpha(titleBG5, 0, 0)
animUpdate(titleBG5)

--Hardcore Background Bottom (black text cover)
titleHardBG5 = animNew(sysSff, [[
6,1, 0,145, -1
]])
animAddPos(titleHardBG5, 160, 0)
animSetTile(titleHardBG5, 1, 1)
animSetWindow(titleHardBG5, 0, 223, 320, 20)
animSetAlpha(titleHardBG5, 0, 0)
animUpdate(titleHardBG5)

--Background Footer
titleBG6 = animNew(sysSff, [[
300,0, 0,233, -1
]])
animAddPos(titleBG6, 160, 0)
animSetTile(titleBG6, 1, 0)
animUpdate(titleBG6)

--Cursor Box
cursorBox = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(cursorBox, 1, 1)

--Online Background
wirelessBG = animNew(sysSff, [[
400,0, 0,0, 18
400,1, 0,0, 18
400,2, 0,0, 18
400,3, 0,0, 18
400,4, 0,0, 18
400,5, 0,0, 18
400,6, 0,0, 18
]])
animAddPos(wirelessBG, -2, 0)
animUpdate(wirelessBG)
animSetScale(wirelessBG, 1.2, 1)

--Down Menu Arrows
arrowsD = animNew(sysSff, [[
222,0, 0,0, 10
222,1, 0,0, 10
222,2, 0,0, 10
222,3, 0,0, 10
222,4, 0,0, 10
222,3, 0,0, 10
222,2, 0,0, 10
222,1, 0,0, 10
222,0, 0,0, 10
]])
animAddPos(arrowsD, 50, 170)
animUpdate(arrowsD)
animSetScale(arrowsD, 2, 2)

--Up Menu Arrows
arrowsU = animNew(sysSff, [[
222,5, 0,0, 10
222,6, 0,0, 10
222,7, 0,0, 10
222,8, 0,0, 10
222,9, 0,0, 10
222,8, 0,0, 10
222,7, 0,0, 10
222,6, 0,0, 10
222,5, 0,0, 10
]])
animAddPos(arrowsU, 247, 170)
animUpdate(arrowsU)
animSetScale(arrowsU, 2, 2)

--;===========================================================
--; OPTIONS BACKGROUND DEFINITION
--;===========================================================
--Scrolling background
optionsBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(optionsBG0, 160, 0)
animSetTile(optionsBG0, 1, 1)
animSetColorKey(optionsBG0, -1)

--Transparent background
optionsBG1 = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(optionsBG1, 1, 1)
animSetAlpha(optionsBG1, 20, 100)
animUpdate(optionsBG1)

--txt_titleFt = createTextImg(font1, 0, 1, 'I.K.E.M.E.N. PLUS ZEN', 107, 240)
txt_titleFt = createTextImg(font1, 0, 1, 'I.K.E.M.E.N. PLUS ULTRA', 109, 240)
txt_titleFt1 = createTextImg(font1, 0, 1, '', 135, 240)
txt_titleFt2 = createTextImg(font1, 0, -1, 'v1.1.0', 319, 240)
txt_mainSelect = createTextImg(jgFnt, 0, 0, '', 159, 13)

function f_clock() --Just a clock
os.clock()
txt_titleFt3 = createTextImg(font1, 0, -1, (os.date("%I:%M%p")), 34, 240) --os.date("%I:%M%p:%S") include seconds
textImgDraw(txt_titleFt3)
end

function f_default()
	setAutoLevel(false) --generate autolevel.txt in game dir
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
	data.versusScreen = true --versus screen enabled
	data.p1In = 1 --P1 controls P1 side of the select screen
	data.p2In = 0 --P2 controls in the select screen disabled
	data.gameMode = '' --additional variable used to distinguish modes in select screen
	data.rosterMode = '' --additional variable used to identify special modes in select screen
end

--;===========================================================
--; LOAD UNLOCKED CONTENT
--;===========================================================
-- Data loading from unlocks_sav.lua
local file = io.open("script/unlocks_sav.lua","r")
s_dataLUA = file:read("*all")
file:close()

function f_saveUnlockData()
	-- Data saving to data_sav.lua
	local t_savesUnlock = {
		['data.unlocks'] = data.unlocks
	}
	s_dataLUA = f_strSub(s_dataLUA, t_savesUnlock)
	local file = io.open("script/unlocks_sav.lua","w+")
	file:write(s_dataLUA)
	file:close()
end

--;===========================================================
--; LOGOS LOOP
--;===========================================================
function f_mainStart()
	script.storyboard.f_storyboard('data/logo.def')
	script.storyboard.f_storyboard('data/intro.def')
	--playVideo(videoOpening)
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff) --global variable so we can set it also from within select.lua
	--f_howtoplay()
	f_mainTitle()
end

--;===========================================================
--; HOW TO PLAY LOGOS LOOP
--;===========================================================
function f_howtoplay()
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff) --global variable so we can set it also from within select.lua
	--playVideo(videoHowToPlay)
	f_mainTitle()
end

--;===========================================================
--; HOW TO PLAY MENU LOOP
--;===========================================================
function f_howtoplay2()
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff) --global variable so we can set it also from within select.lua
	--playVideo(videoHowToPlay)
	return
end		

--;===========================================================
--; TITLE SCREEN LOOP
--;===========================================================
txt_mainTitleOn = createTextImg(jgFnt, 2, 0, '-- PRESS START --', 159, 190)
txt_mainTitleOff = createTextImg(jgFnt, 2, 0, '', 159, 190)

function f_mainTitle()
	cmdInput()
	local i = 0
	playBGM(bgmTitle)
	while true do
		if i == 500 then
		   cmdInput()
		   script.randomtest.run()
		   if data.unlocks == true then
				f_mainfullMenu()
			else
				f_mainMenu()
			end	
		elseif btnPalNo(p1Cmd) > 0 then
		   sndPlay(sysSnd, 100, 1)
			if data.unlocks == true then
				f_mainfullMenu()
			else
				f_mainMenu()
			end	
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		animSetWindow(cursorBox, 0, 180, 290, 13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt)		
		textImgDraw(txt_titleFt2)
		f_clock()
		textImgDraw(txt_mainTitleOn)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		i = i + 1
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; MAIN MENU LOOP
--;===========================================================
t_mainMenu = {
	{id = textImgNew(), text = 'ARCADE'},
	{id = textImgNew(), text = 'QUICK MATCH'},
	{id = textImgNew(), text = 'VERSUS'},
	{id = textImgNew(), text = 'ONLINE'},
	{id = textImgNew(), text = 'PRACTICE'},
	{id = textImgNew(), text = 'CHALLENGES'},	
	{id = textImgNew(), text = 'WATCH'},
	{id = textImgNew(), text = 'EXTRAS'},
	{id = textImgNew(), text = 'OPTIONS'},
	{id = textImgNew(), text = 'EXIT'},	
	{id = textImgNew(), text = 'CHECK UPDATES'},
}

function f_mainMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainMenu = 1
	f_menuMusic()
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			f_mainTitle()
			--f_howtoplay()
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainMenu = mainMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainMenu = mainMenu + 1
		end
		--mode titles/cursor position calculation
		if mainMenu < 1 then
			mainMenu = #t_mainMenu
			if #t_mainMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_mainMenu-1
			end
		elseif mainMenu > #t_mainMenu then
			mainMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (mainMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainMenu - 1) * 13
		end
		--mode selected
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ARCADE
			if mainMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_arcadeMenu()			
			--QUICK VERSUS	
			elseif mainMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_randomMenu()
			--VS MODE
			elseif mainMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				f_vsMenu()
			--ONLINE
			elseif mainMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				assert(loadfile('script/onlinecfg.lua'))()
				f_mainNetplay()
			--PRACTICE
			elseif mainMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_practiceMenu()		
			--CHALLENGES
			elseif mainMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				f_challengeMenu()
			--WATCH
			elseif mainMenu == 7 then
				sndPlay(sysSnd, 100, 1)
				f_watchMenu()
			--EXTRAS
			elseif mainMenu == 8 then
				sndPlay(sysSnd, 100, 1)
				f_extrasMenu()	
			--OPTIONS
			elseif mainMenu == 9 then
				sndPlay(sysSnd, 100, 1)
				script.options.f_mainCfg() --start f_mainCfg() function from script/options.lua
			--EXIT
			elseif mainMenu == 10 then
				os.exit()
			--CHECK UPDATES
			else
				sndPlay(sysSnd, 100, 1)	
				os.execute("start https://github.com/CableDorado2/Ikemen-Plus-Ultra")				
			end
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_mainMenu do
			if i == mainMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainMenu[i].id, jgFnt, bank, 0, t_mainMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'MAIN MENU')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end	

--;===========================================================
--; MAIN MENU UNLOCKED LOOP
--;===========================================================
t_mainfullMenu = {
	{id = textImgNew(), text = 'ARCADE'},
	{id = textImgNew(), text = 'QUICK MATCH'},
	{id = textImgNew(), text = 'VERSUS'},
	{id = textImgNew(), text = 'ONLINE'},
	{id = textImgNew(), text = 'PRACTICE'},
	{id = textImgNew(), text = 'CHALLENGES'},	
	{id = textImgNew(), text = 'WATCH'},
	{id = textImgNew(), text = 'EXTRAS'},
	{id = textImgNew(), text = 'UNLOCKS'},
	{id = textImgNew(), text = 'OPTIONS'},
	{id = textImgNew(), text = 'EXIT'},	
	{id = textImgNew(), text = 'CHECK UPDATES'},
}

function f_mainfullMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainfullMenu = 1
	f_menuMusic()
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			f_mainTitle()
			--f_howtoplay()
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainfullMenu = mainfullMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainfullMenu = mainfullMenu + 1
		end
		--mode titles/cursor position calculation
		if mainfullMenu < 1 then
			mainfullMenu = #t_mainfullMenu
			if #t_mainfullMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_mainfullMenu-1
			end
		elseif mainfullMenu > #t_mainfullMenu then
			mainfullMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (mainfullMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainfullMenu - 1) * 13
		end
		--mode selected
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ARCADE
			if mainfullMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_arcadeMenu()			
			--QUICK VERSUS	
			elseif mainfullMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_randomMenu()
			--VS MODE
			elseif mainfullMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				f_vsMenu()
			--ONLINE
			elseif mainfullMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				assert(loadfile('script/onlinecfg.lua'))()
				f_mainNetplay()
			--PRACTICE
			elseif mainfullMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_practiceMenu()		
			--CHALLENGES
			elseif mainfullMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				f_challengeMenu()
			--WATCH
			elseif mainfullMenu == 7 then
				sndPlay(sysSnd, 100, 1)
				f_watchMenu()
			--EXTRAS
			elseif mainfullMenu == 8 then
				sndPlay(sysSnd, 100, 1)
				f_extrasMenu()
			--SECRETS
			elseif mainfullMenu == 9 then
				sndPlay(sysSnd, 100, 1)
				f_unlockMenu()	
			--OPTIONS
			elseif mainfullMenu == 10 then
				sndPlay(sysSnd, 100, 1)
				script.options.f_mainCfg() --start f_mainCfg() function from script/options.lua
			--EXIT
			elseif mainfullMenu == 11 then
				os.exit()
			--CHECK UPDATES
			else
				sndPlay(sysSnd, 100, 1)	
				os.execute("start https://github.com/CableDorado2/Ikemen-Plus-Ultra")				
			end
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_mainfullMenu do
			if i == mainfullMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainfullMenu[i].id, jgFnt, bank, 0, t_mainfullMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'MAIN MENU')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ARCADE MENU LOOP
--;===========================================================
t_arcadeMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},
	{id = textImgNew(), text = 'BACK'},	
}
	
function f_arcadeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local arcadeMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			arcadeMenu = arcadeMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			arcadeMenu = arcadeMenu + 1
		end
		if arcadeMenu < 1 then
			arcadeMenu = #t_arcadeMenu
			if #t_arcadeMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_arcadeMenu-1
			end
		elseif arcadeMenu > #t_arcadeMenu then
			arcadeMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (arcadeMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (arcadeMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if arcadeMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1 --P1 controls P2 side of the select screen
				data.p2SelectMenu = false --P2 character selection disabled
				data.coinsLeft = data.coins - 1 --amount of continues
				data.gameMode = 'arcade' --mode recognized in select screen as 'arcade'
				textImgSetText(txt_mainSelect, 'ARCADE') --message displayed on top of select screen				
				script.select.f_selectAdvance() --start f_selectAdvance() function from script/select.lua
			--CO-OP MODE
			elseif arcadeMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true --P2 fighting on P1 side enabled
				data.coinsLeft = data.coins - 1
				data.gameMode = 'arcade'
				textImgSetText(txt_mainSelect, 'ARCADE COOPERATIVE')				
				script.select.f_selectAdvance()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_arcadeMenu do
			if i == arcadeMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_arcadeMenu[i].id, jgFnt, bank, 0, t_arcadeMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)		
		textImgSetText(txt_titleFt1, 'ARCADE MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VERSUS MENU LOOP
--;===========================================================
t_vsMenu = {
	{id = textImgNew(), text = '1P VS CPU'},
	{id = textImgNew(), text = '1P VS 2P'},
	{id = textImgNew(), text = 'CO-OP MODE'},	
	{id = textImgNew(), text = 'BACK'},	
}
	
function f_vsMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local vsMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			vsMenu = vsMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			vsMenu = vsMenu + 1
		end
		if vsMenu < 1 then
			vsMenu = #t_vsMenu
			if #t_vsMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_vsMenu-1
			end
		elseif vsMenu > #t_vsMenu then
			vsMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (vsMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (vsMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--1P VS CPU
			if vsMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.stageMenu = true
				data.p2Faces = true
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'FREE VERSUS')				
				script.select.f_selectSimple()
			--1P VS 2P
			elseif vsMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setHomeTeam(1) --P1 side considered the home team
				data.p2In = 2 --P2 controls P2 side of the select screen
				data.stageMenu = true --stage selection enabled
				data.p2Faces = true --additional window with P2 select screen small portraits (faces) enabled
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'VERSUS MODE')				
				script.select.f_selectSimple() --start f_selectSimple() function from script/select.lua
			--1P & 2P VS CPU
			elseif vsMenu == 3 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				--data.p2In = 2
				--data.p2Faces = true
				--data.stageMenu = true
				--data.coop = true
				--textImgSetText(txt_mainSelect, 'FREE VERSUS COOPERATIVE')				
				--script.select.f_selectSimple()	
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_vsMenu do
			if i == vsMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_vsMenu[i].id, jgFnt, bank, 0, t_vsMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'VERSUS MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; PRACTICE MENU LOOP
--;===========================================================
t_practiceMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '1P VS 2P'},	
	{id = textImgNew(), text = '2P[CO-OP]'},	
	{id = textImgNew(), text = 'BACK'},	
}
	
function f_practiceMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local practiceMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			practiceMenu = practiceMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			practiceMenu = practiceMenu + 1
		end
		if practiceMenu < 1 then
			practiceMenu = #t_practiceMenu
			if #t_practiceMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_practiceMenu-1
			end
		elseif practiceMenu > #t_practiceMenu then
			practiceMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (practiceMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (practiceMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if practiceMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1) --round time disabled
				data.p2In = 2
				data.stageMenu = true
				data.versusScreen = false --versus screen disabled
				data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
				data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
				data.p2Char = {t_charAdd['training']} --predefined P2 character as Training by stupa
				data.gameMode = 'training'
				textImgSetText(txt_mainSelect, 'TRAINING MODE')				
				script.select.f_selectSimple()
			--MULTIPLAYER MODE
			elseif practiceMenu == 2 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				setRoundTime(-1)
				setLifeMul(99999)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.stageMenu = true
				data.versusScreen = false
				data.p2Faces = true
				data.gameMode = 'training'
				textImgSetText(txt_mainSelect, 'MULTIPLAYER TRAINING')
				script.select.f_selectSimple()			
			--CO-OP MODE
			elseif practiceMenu == 3 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				--setRoundTime(-1)
				--data.p2In = 2
				--data.p2Faces = true
				--data.coop = true
				--data.stageMenu = true
				--data.versusScreen = false
				--data.p2TeamMenu = {mode = 0, chars = 1}
				--data.p3Char = {t_charAdd['training']}
				--data.gameMode = 'training'
				--textImgSetText(txt_mainSelect, 'TRAINING COOPERATIVE')				
				--script.select.f_selectSimple()			
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_practiceMenu do
			if i == practiceMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_practiceMenu[i].id, jgFnt, bank, 0, t_practiceMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'PRACTICE MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; RANDOM MATCH MENU LOOP
--;===========================================================
t_randomMenu = {
	{id = textImgNew(), text = '1P VS CPU'},
	{id = textImgNew(), text = '1P VS 2P'},
	{id = textImgNew(), text = 'RANDOM CO-OP'},
	{id = textImgNew(), text = 'BACK'},	
}
	
function f_randomMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local randomMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			randomMenu = randomMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			randomMenu = randomMenu + 1
		end
		if randomMenu < 1 then
			randomMenu = #t_randomMenu
			if #t_randomMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_randomMenu-1
			end
		elseif randomMenu > #t_randomMenu then
			randomMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (randomMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (randomMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--1P VS CPU
			if randomMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				script.randomtest.singleVersus()
			--1P VS 2P
			elseif randomMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				script.randomtest.multiVersus()
			--1P & 2P VS CPU
			elseif randomMenu == 3 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				--script.randomtest.coopVersus()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_randomMenu do
			if i == randomMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_randomMenu[i].id, jgFnt, bank, 0, t_randomMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'RANDOM MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CHALLENGES MENU LOOP
--;===========================================================
t_challengeMenu = {
	{id = textImgNew(), text = 'SURVIVAL'},
	{id = textImgNew(), text = 'BOSS FIGHT'},
	{id = textImgNew(), text = 'BONUS GAMES'},
	{id = textImgNew(), text = 'SUDDEN DEATH'},		
	{id = textImgNew(), text = 'TIME ATTACK'},
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_challengeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local challengeMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			challengeMenu = challengeMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			challengeMenu = challengeMenu + 1
		end
		if challengeMenu < 1 then
			challengeMenu = #t_challengeMenu
			if #t_challengeMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_challengeMenu-1
			end
		elseif challengeMenu > #t_challengeMenu then
			challengeMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (challengeMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (challengeMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SURVIVAL
			if challengeMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_survivalMenu()
			--BOSS FIGHT
			elseif challengeMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_bossMenu()
			--BONUS GAMES
			elseif challengeMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				f_bonusMenu()
			--SUDDEN DEATH
			elseif challengeMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				f_suddenMenu()				
			--TIME ATTACK
			elseif challengeMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_timeMenu()				
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_challengeMenu do
			if i == challengeMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_challengeMenu[i].id, jgFnt, bank, 0, t_challengeMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'CHALLENGES')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SURVIVAL MENU LOOP
--;===========================================================
t_survivalMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},	
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_survivalMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local survivalMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			survivalMenu = survivalMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			survivalMenu = survivalMenu + 1
		end
		if survivalMenu < 1 then
			survivalMenu = #t_survivalMenu
			if #t_survivalMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_survivalMenu-1
			end
		elseif survivalMenu > #t_survivalMenu then
			survivalMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (survivalMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (survivalMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if survivalMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.p2SelectMenu = false
				data.coinsLeft = 0
				data.gameMode = 'survival'
				textImgSetText(txt_mainSelect, 'SURVIVAL')				
				script.select.f_selectAdvance()
			--CO-OP MODE
			elseif survivalMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.coinsLeft = 0
				data.gameMode = 'survival'
				textImgSetText(txt_mainSelect, 'SURVIVAL COOPERATIVE')				
				script.select.f_selectAdvance()			
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_survivalMenu do
			if i == survivalMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_survivalMenu[i].id, jgFnt, bank, 0, t_survivalMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'SURVIVAL MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BOSS FIGHT MENU LOOP
--;===========================================================
t_bossMenu = {
	{id = textImgNew(), text = 'SINGLE MODE'},
	{id = textImgNew(), text = 'BOSS RUSH'},
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_bossMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bossMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			bossMenu = bossMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			bossMenu = bossMenu + 1
		end
		if bossMenu < 1 then
			bossMenu = #t_bossMenu
			if #t_bossMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_bossMenu-1
			end
		elseif bossMenu > #t_bossMenu then
			bossMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (bossMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bossMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE BOSS
			if bossMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_bossChars()
			--BOSS RUSH
			elseif bossMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_bossrushMenu()		
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_bossMenu do
			if i == bossMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bossMenu[i].id, jgFnt, bank, 0, t_bossMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'BOSS FIGHT')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SINGLE BOSS MENU LOOP
--;===========================================================
function f_bossChars()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bossChars = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			bossChars = bossChars - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			bossChars = bossChars + 1
		end
		if bossChars < 1 then
			bossChars = #t_bossSingle
			if #t_bossSingle > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_bossSingle-1
			end
		elseif bossChars > #t_bossSingle then
			bossChars = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (bossChars - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bossChars - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			if bossChars < #t_bossSingle then
			--BOSS CHAR NAME
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_bossChars[bossChars]}
				textImgSetText(txt_mainSelect, t_selChars[t_bossChars[bossChars]+1].displayname)				
				script.select.f_selectSimple()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_bossSingle do
			if i == bossChars then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bossSingle[i].id, jgFnt, bank, 0, t_bossSingle[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'BOSS FIGHT')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BOSS RUSH MENU LOOP
--;===========================================================
t_bossrushMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_bossrushMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bossrushMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			bossrushMenu = bossrushMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			bossrushMenu = bossrushMenu + 1
		end
		if bossrushMenu < 1 then
			bossrushMenu = #t_bossrushMenu
			if #t_bossrushMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_bossrushMenu-1
			end
		elseif bossrushMenu > #t_bossrushMenu then
			bossrushMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (bossrushMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bossrushMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if bossrushMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				if #t_bossChars ~= 0 then
					data.p2In = 1
					data.p2SelectMenu = false
					data.coinsLeft = 0
					data.gameMode = 'bossrush'
					textImgSetText(txt_mainSelect, 'BOSS RUSH')					
					script.select.f_selectAdvance()
				end	
			--CO-OP MODE
			elseif bossrushMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if #t_bossChars ~= 0 then
					data.p2In = 2
					data.p2Faces = true
					data.coop = true
					data.coinsLeft = 0
					data.gameMode = 'bossrush'
					textImgSetText(txt_mainSelect, 'BOSS RUSH COOPERATIVE')					
					script.select.f_selectAdvance()
				end			
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_bossrushMenu do
			if i == bossrushMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bossrushMenu[i].id, jgFnt, bank, 0, t_bossrushMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'BOSS RUSH')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BONUS GAMES MENU LOOP
--;===========================================================
t_bonusMenu = {
	{id = textImgNew(), text = 'SINGLE MODE'},
	{id = textImgNew(), text = 'BONUS RUSH'},
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_bonusMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bonusMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			bonusMenu = bonusMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			bonusMenu = bonusMenu + 1
		end
		if bonusMenu < 1 then
			bonusMenu = #t_bonusMenu
			if #t_bonusMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_bonusMenu-1
			end
		elseif bonusMenu > #t_bonusMenu then
			bonusMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (bonusMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bonusMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE BONUS
			if bonusMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_bonusExtras()
			--BONUS RUSH
			elseif bonusMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_bonusrushMenu()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_bonusMenu do
			if i == bonusMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bonusMenu[i].id, jgFnt, bank, 0, t_bonusMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'MINI-GAMES')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SINGLE BONUS GAMES MENU LOOP
--;===========================================================
function f_bonusExtras()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bonusExtras = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			bonusExtras = bonusExtras - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			bonusExtras = bonusExtras + 1
		end
		if bonusExtras < 1 then
			bonusExtras = #t_bonusExtras
			if #t_bonusExtras > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_bonusExtras-1
			end
		elseif bonusExtras > #t_bonusExtras then
			bonusExtras = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (bonusExtras - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bonusExtras - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			if bonusExtras < #t_bonusExtras then
			--BONUS CHAR NAME
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.versusScreen = false
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_bonusChars[bonusExtras]}
				textImgSetText(txt_mainSelect, t_selChars[t_bonusChars[bonusExtras]+1].displayname)				
				script.select.f_selectSimple()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_bonusExtras do
			if i == bonusExtras then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bonusExtras[i].id, jgFnt, bank, 0, t_bonusExtras[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'BONUS STAGES')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BONUS RUSH MENU LOOP
--;===========================================================
t_bonusrushMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_bonusrushMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bonusrushMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			bonusrushMenu = bonusrushMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			bonusrushMenu = bonusrushMenu + 1
		end
		if bonusrushMenu < 1 then
			bonusrushMenu = #t_bonusrushMenu
			if #t_bonusrushMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_bonusrushMenu-1
			end
		elseif bonusrushMenu > #t_bonusrushMenu then
			bonusrushMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (bonusrushMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bonusrushMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if bonusrushMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				if #t_bonusChars ~= 0 then
					data.p2In = 1
					data.p2SelectMenu = false
					data.versusScreen = false
					data.coinsLeft = 0
					data.gameMode = 'bonusrush'
					textImgSetText(txt_mainSelect, 'BONUS RUSH')					
					script.select.f_selectAdvance()
				end	
			--CO-OP MODE
			elseif bonusrushMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if #t_bonusChars ~= 0 then
					data.p2In = 2
					data.p2Faces = true
					data.coop = true
					data.versusScreen = false
					data.coinsLeft = 0
					data.gameMode = 'bonusrush'
					textImgSetText(txt_mainSelect, 'BONUS RUSH COOPERATIVE')					
					script.select.f_selectAdvance()
				end					
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_bonusrushMenu do
			if i == bonusrushMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bonusrushMenu[i].id, jgFnt, bank, 0, t_bonusrushMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'BONUS RUSH')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SUDDEN DEATH MENU LOOP
--;===========================================================
t_suddenMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},	
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_suddenMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local suddenMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			suddenMenu = suddenMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			suddenMenu = suddenMenu + 1
		end
		if suddenMenu < 1 then
			suddenMenu = #t_suddenMenu
			if #t_suddenMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_suddenMenu-1
			end
		elseif suddenMenu > #t_suddenMenu then
			suddenMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (suddenMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (suddenMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if suddenMenu == 1 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(1000)
				setLifeMul(0)
				data.p2In = 1				
				data.p2SelectMenu = false
				data.gameMode = 'endless'
				data.rosterMode = 'suddendeath'
				textImgSetText(txt_mainSelect, 'SUDDEN DEATH')
				script.select.f_selectAdvance()
			--CO-OP MODE
			elseif suddenMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(1000)
				setLifeMul(0)				
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				data.rosterMode = 'suddendeath'
				textImgSetText(txt_mainSelect, 'SUDDEN DEATH COOPERATIVE')
				script.select.f_selectAdvance()					
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_suddenMenu do
			if i == suddenMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_suddenMenu[i].id, jgFnt, bank, 0, t_suddenMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'SUDDEN DEATH MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TIME ATTACK MENU LOOP
--;===========================================================
t_timeMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},	
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_timeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local timeMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			timeMenu = timeMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			timeMenu = timeMenu + 1
		end
		if timeMenu < 1 then
			timeMenu = #t_timeMenu
			if #t_timeMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_timeMenu-1
			end
		elseif timeMenu > #t_timeMenu then
			timeMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (timeMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (timeMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if timeMenu == 1 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(3600)
				setLifeMul(2)
				data.p2In = 1				
				data.p2SelectMenu = false
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'TIME ATTACK (W.I.P)')
				script.select.f_selectAdvance()
			--CO-OP MODE
			elseif timeMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(3600)
				setLifeMul(2)				
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'TIME ATTACK COOPERATIVE (W.I.P)')
				script.select.f_selectAdvance()					
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_timeMenu do
			if i == timeMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_timeMenu[i].id, jgFnt, bank, 0, t_timeMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'TIME ATTACK MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WATCH MENU LOOP
--;===========================================================
t_watchMenu = {
	{id = textImgNew(), text = 'CPU MATCH'},
	{id = textImgNew(), text = 'LOCAL REPLAYS'},
	{id = textImgNew(), text = 'ONLINE REPLAYS'},	
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_watchMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local watchMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			watchMenu = watchMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			watchMenu = watchMenu + 1
		end
		if watchMenu < 1 then
			watchMenu = #t_watchMenu
			if #t_watchMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_watchMenu-1
			end
		elseif watchMenu > #t_watchMenu then
			watchMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (watchMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (watchMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--CPU MATCH
			if watchMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.aiFight = true --AI = data.difficulty for all characters enabled
				data.stageMenu = true
				data.p2Faces = true
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'WATCH MODE')			
				script.select.f_selectSimple()
			--LOCAL REPLAYS
			elseif watchMenu == 2 then
				
			--ONLINE REPLAYS
			elseif watchMenu == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				assert(loadfile('script/onlinecfg.lua'))()
				f_mainReplay()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_watchMenu do
			if i == watchMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_watchMenu[i].id, jgFnt, bank, 0, t_watchMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'WATCH MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; EXTRAS MENU LOOP
--;===========================================================
t_extrasMenu = {
	{id = textImgNew(), text = 'HOW TO PLAY'},
	{id = textImgNew(), text = 'STORYBOARDS'},
	{id = textImgNew(), text = 'SOUND TEST'},
	{id = textImgNew(), text = 'PLAY CREDITS'},
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_extrasMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local extrasMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			extrasMenu = extrasMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			extrasMenu = extrasMenu + 1
		end
		if extrasMenu < 1 then
			extrasMenu = #t_extrasMenu
			if #t_extrasMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_extrasMenu-1
			end
		elseif extrasMenu > #t_extrasMenu then
			extrasMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (extrasMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (extrasMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--HOW TO PLAY
			if extrasMenu == 1 then
				--sndPlay(sysSnd, 100, 1)
				--f_howtoplay2()
			--STORYBOARDS
			elseif extrasMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_storyboardMenu()
			--SOUND TEST
			elseif extrasMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				f_songMenu()	
			--CREDITS
			elseif extrasMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				cmdInput()
				local cursorPosY = 0
				local moveTxt = 0
				local playCredits = 1
				script.storyboard.f_storyboard('data/credits.def')
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
				while true do
					if esc() then
						sndPlay(sysSnd, 100, 2)
						break
					elseif btnPalNo(p1Cmd) or (commandGetState(p1Cmd, 'holds') > 0) then
						f_default()
						sndPlay(sysSnd, 100, 2)
						break
					end
				end	
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_extrasMenu do
			if i == extrasMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_extrasMenu[i].id, jgFnt, bank, 0, t_extrasMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'EXTRAS')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; UNLOCK MENU LOOP
--;===========================================================
t_unlockMenu = {
	{id = textImgNew(), text = 'ENDLESS MODE'},
	{id = textImgNew(), text = 'TIME TRIAL'},
	{id = textImgNew(), text = 'TOURNAMENT'},
	{id = textImgNew(), text = 'CUTSCENES'},
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_unlockMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local unlockMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			unlockMenu = unlockMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			unlockMenu = unlockMenu + 1
		end
		if unlockMenu < 1 then
			unlockMenu = #t_unlockMenu
			if #t_unlockMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_unlockMenu-1
			end
		elseif unlockMenu > #t_unlockMenu then
			unlockMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (unlockMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (unlockMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ENDLESS MODE
			if unlockMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_allcharsMenu()	
			--TIME TRIAL
			elseif unlockMenu == 2 then
				--sndPlay(sysSnd, 100, 1)
				--f_trialMenu()
			--TOURNAMENT
			elseif unlockMenu == 3 then
				--sndPlay(sysSnd, 100, 1)
				--f_trialMenu()	
			--CUTSCENES
			elseif unlockMenu == 4 then
				--sndPlay(sysSnd, 100, 1)
				--f_videoMenu()				
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_unlockMenu do
			if i == unlockMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_unlockMenu[i].id, jgFnt, bank, 0, t_unlockMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'UNLOCKS')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ENDLESS MENU LOOP
--;===========================================================
t_allcharsMenu = {
	{id = textImgNew(), text = '1P[CLASSIC]'},
	{id = textImgNew(), text = '2P[CO-OP]'},	
	{id = textImgNew(), text = 'BACK'},
}	
	
function f_allcharsMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local allcharsMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			allcharsMenu = allcharsMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			allcharsMenu = allcharsMenu + 1
		end
		if allcharsMenu < 1 then
			allcharsMenu = #t_allcharsMenu
			if #t_allcharsMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_allcharsMenu-1
			end
		elseif allcharsMenu > #t_allcharsMenu then
			allcharsMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (allcharsMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (allcharsMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if allcharsMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.p2SelectMenu = false
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'ENDLESS MODE')			
				script.select.f_selectAdvance()
			--CO-OP MODE
			elseif allcharsMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'ENDLESS COOPERATIVE')			
				script.select.f_selectAdvance()			
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_allcharsMenu do
			if i == allcharsMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_allcharsMenu[i].id, jgFnt, bank, 0, t_allcharsMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'INFINITE MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CUTSCENES MENU LOOP
--;===========================================================
t_videoMenu = {
	{id = textImgNew(), text = 'Back'},
}
txt_song = createTextImg(jgFnt, 0, 0, 'CUTSCENE SELECT', 159, 13)

videoDir = ".\\video\\"

function f_videoMenu()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	local cursorPosY = 1
	local moveTxt = 0
	local videoMenu = 1
	local videoList = {}
	local i = 1
	local g = 1
	p = io.popen('dir "'..videoDir..'" /b')  
	for file in p:lines() do
		if file:match('^.*(%.)wmv$') or file:match('^.*(%.)WMV$') then --Filtrar archivos (Solo admite WMV)
			videoList[i] = tostring(file)
			i = i + 1
		end	
	end
	p:close()
	cmdInput()
	while true do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu - 1
			if cursorPosY > 1 then 
				cursorPosY = cursorPosY - 1
			elseif cursorPosY == 1 then
				moveTxt = moveTxt - 1
			end
			if videoMenu < 1 then 
				videoMenu = #t_videoMenu + #videoList
				if #t_videoMenu + #videoList >= 14 then
					cursorPosY = 14
					moveTxt = #videoList-13
				else
					cursorPosY = #t_videoMenu + #videoList
					moveTxt = 0
				end
			end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu + 1
			if cursorPosY < 14 then 
				cursorPosY = cursorPosY + 1
			elseif cursorPosY == 14 then
				moveTxt = moveTxt + 1
			end
			if videoMenu > #t_videoMenu + #videoList then 
				moveTxt = 0
				videoMenu = 1
				cursorPosY = 1
			end
		end
		if btnPalNo(p1Cmd) > 0 then
			if videoMenu ~= (#t_videoMenu + #videoList) then
				videoFile = ('video/' .. videoList[videoMenu])
				cmdInput()
				playVideo(videoFile)
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
				while true do
					if esc() then
						sndPlay(sysSnd, 100, 2)
						f_menuMusic()
						break
					elseif btnPalNo(p1Cmd) or (commandGetState(p1Cmd, 'holds') > 0) then
						sndPlay(sysSnd, 100, 2)
						f_menuMusic()
						break
					end
				end
			else
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_song)
		if #videoList >= 13 then
			animSetWindow(optionsBG1, 80,20, 160,14*15)
		else
			animSetWindow(optionsBG1, 80,20, 160,(#t_videoMenu+#videoList)*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		for i=1, math.min(#videoList+1, 14) do
			if i+moveTxt < #t_videoMenu + #videoList then
				textImgDraw(createTextImg(font2, 0, 1, videoList[i+moveTxt], 85, 15+i*15))
			else
				textImgDraw(createTextImg(font2, 0, 1, t_videoMenu[1].text, 85, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; STORYBOARDS MENU LOOP
--;===========================================================
t_storyboardMenu = {
	{id = textImgNew(), text = 'Back'},
}
txt_storyboard = createTextImg(jgFnt, 0, 0, 'STORYBOARD SELECT', 159, 13)

storyboardDir = ".\\storyboards\\"

function f_storyboardMenu()
    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	local cursorPosY = 1
	local moveTxt = 0
	local storyboardMenu = 1
	local storyboardList = {}
	local i = 1
	local g = 1
	p = io.popen('dir "'..storyboardDir..'" /b')
	for file in p:lines() do                    
		if file:match('^.*(%.)def$') or file:match('^.*(%.)DEF$') then --Filtrar archivos
			storyboardList[i] = tostring(file)
			i = i + 1
		end
	end
	p:close()
	cmdInput()
	while true do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu - 1
			if cursorPosY > 1 then 
				cursorPosY = cursorPosY - 1
			elseif cursorPosY == 1 then
				moveTxt = moveTxt - 1
			end
			if storyboardMenu < 1 then 
				storyboardMenu = #t_storyboardMenu + #storyboardList
				if #t_storyboardMenu + #storyboardList >= 14 then
					cursorPosY = 14
					moveTxt = #storyboardList-13
				else
					cursorPosY = #t_storyboardMenu + #storyboardList
					moveTxt = 0
				end
			end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu + 1
			if cursorPosY < 14 then 
				cursorPosY = cursorPosY + 1
			elseif cursorPosY == 14 then
				moveTxt = moveTxt + 1
			end
			if storyboardMenu > #t_storyboardMenu + #storyboardList then 
				moveTxt = 0
				storyboardMenu = 1
				cursorPosY = 1
			end
		end
		if btnPalNo(p1Cmd) > 0 then
			if storyboardMenu ~= (#t_storyboardMenu + #storyboardList) then
				storyboardFile = ('storyboards/' .. storyboardList[storyboardMenu])
				cmdInput()
				script.storyboard.f_storyboard(storyboardFile)
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
				while true do
					if esc() then
						sndPlay(sysSnd, 100, 2)
						f_menuMusic()
						break
					elseif btnPalNo(p1Cmd) or (commandGetState(p1Cmd, 'holds') > 0) then
						f_default()
						sndPlay(sysSnd, 100, 2)
						f_menuMusic()
						break
					end
				end
			else
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_storyboard)
		if #storyboardList >= 13 then
			animSetWindow(optionsBG1, 80,20, 160,14*15)
		else
			animSetWindow(optionsBG1, 80,20, 160,(#t_storyboardMenu+#storyboardList)*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		for i=1, math.min(#storyboardList+1, 14) do
			if i+moveTxt < #t_storyboardMenu + #storyboardList then
				textImgDraw(createTextImg(font2, 0, 1, storyboardList[i+moveTxt], 85, 15+i*15))
			else
				textImgDraw(createTextImg(font2, 0, 1, t_storyboardMenu[1].text, 85, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SOUND TEST MENU LOOP
--;===========================================================
t_songMenu = {
	{id = textImgNew(), text = 'Back'},
}
txt_song = createTextImg(jgFnt, 0, 0, 'SONG SELECT', 159, 13)

songDir = ".\\sound\\"

function f_songMenu()
    playBGM(bgmNothing)
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	local cursorPosY = 1
	local moveTxt = 0
	local songMenu = 1
	local songList = {}
	local i = 1
	local g = 1
	p = io.popen('dir "'..songDir..'" /b')  
	for file in p:lines() do
		if file:match('^.*(%.)mp3$') or file:match('^.*(%.)MP3$') or file:match('^.*(%.)ogg$') or file:match('^.*(%.)OGG$') then --Filtrar archivos (Solo admite Mp3 y Ogg)
			songList[i] = tostring(file)
			i = i + 1
		end	
	end
	p:close()
	cmdInput()
	while true do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			f_menuMusic()
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu - 1
			if cursorPosY > 1 then 
				cursorPosY = cursorPosY - 1
			elseif cursorPosY == 1 then
				moveTxt = moveTxt - 1
			end
			if songMenu < 1 then 
				songMenu = #t_songMenu + #songList
				if #t_songMenu + #songList >= 14 then
					cursorPosY = 14
					moveTxt = #songList-13
				else
					cursorPosY = #t_songMenu + #songList
					moveTxt = 0
				end
			end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu + 1
			if cursorPosY < 14 then 
				cursorPosY = cursorPosY + 1
			elseif cursorPosY == 14 then
				moveTxt = moveTxt + 1
			end
			if songMenu > #t_songMenu + #songList then 
				moveTxt = 0
				songMenu = 1
				cursorPosY = 1
			end
		end
		if btnPalNo(p1Cmd) > 0 then
			if songMenu ~= (#t_songMenu + #songList) then
				songFile = ('sound/' .. songList[songMenu])
				playBGM(songFile)	
			else
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				f_menuMusic()
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_song)
		if #songList >= 13 then
			animSetWindow(optionsBG1, 80,20, 160,14*15)
		else
			animSetWindow(optionsBG1, 80,20, 160,(#t_songMenu+#songList)*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		for i=1, math.min(#songList+1, 14) do
			if i+moveTxt < #t_songMenu + #songList then
				textImgDraw(createTextImg(font2, 0, 1, songList[i+moveTxt], 85, 15+i*15))
			else
				textImgDraw(createTextImg(font2, 0, 1, t_songMenu[1].text, 85, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; REPLAY MENU LOOP
--;===========================================================
t_mainReplay = {
	{id = textImgNew(), text = 'Back'},
}
txt_replay = createTextImg(jgFnt, 0, 0, 'REPLAY SELECT', 159, 13)

replayFile = 'data.replay'
replayDir = ".\\replays\\Saved\\"

function f_mainReplay()
    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	local cursorPosY = 1
	local moveTxt = 0
	local mainReplay = 1
	local replayList = {}
	local i = 1
	local g = 1
	p = io.popen('dir "'..replayDir..'" /b')  
	for file in p:lines() do                    
		if file:match('^.*(%.)replay$') and not file:match('^data.replay$') then --Filtrar archivos
			replayList[i] = tostring(file)
			i = i + 1
		end	
	end
	p:close()
	cmdInput()
	while true do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay - 1
			if cursorPosY > 1 then 
				cursorPosY = cursorPosY - 1
			elseif cursorPosY == 1 then
				moveTxt = moveTxt - 1
			end
			if mainReplay < 1 then 
				mainReplay = #t_mainReplay + #replayList
				if #t_mainReplay + #replayList >= 14 then
					cursorPosY = 14
					moveTxt = #replayList-13
				else
					cursorPosY = #t_mainReplay + #replayList
					moveTxt = 0
				end
			end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay + 1
			if cursorPosY < 14 then 
				cursorPosY = cursorPosY + 1
			elseif cursorPosY == 14 then
				moveTxt = moveTxt + 1
			end
			if mainReplay > #t_mainReplay + #replayList then 
				moveTxt = 0
				mainReplay = 1
				cursorPosY = 1
			end
		end
		if btnPalNo(p1Cmd) > 0 then
			if mainReplay ~= (#t_mainReplay + #replayList) then
				replayFile = ('replays/Saved/' .. replayList[mainReplay])
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)	
                data.p2In = 2
				data.stageMenu = true
				data.p2Faces = true
				--saves.ini
				data.lifeMul = 100
				data.team1VS2Life = 120
				data.turnsRecoveryRate = 300
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				data.zoomActive = true
				s_zoomActive = 'Yes'
				data.zoomMin = 0.75
				data.zoomMax = 1.1
				data.zoomSpeed = 1.0
				data.roundTime = 99
				data.numTurns = 4
				data.numSimul = 4
				data.simulType = 'Assist'
				data.difficulty = 8
				data.coins = 10
				data.contSelection = true
				s_contSelection = 'Yes'
				data.aiRamping = true
				s_aiRamping = 'Yes'
				data.autoguard = false
				s_autoguard = 'No'
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'				
				data.lifebar = 'data/fight.def'
				gameSpeed = 60
				s_gameSpeed = 'Normal'
				--lifebar
				roundsNum = 2
				drawNum = 2
				f_saveCfg()
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'ONLINE REPLAY')
				enterReplay(replayFile)
				synchronize()
				math.randomseed(sszRandom())
				f_mainhostCfg()
				exitNetPlay()
    			exitReplay()	
			else
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_replay)
		if #replayList >= 13 then
			animSetWindow(optionsBG1, 80,20, 160,14*15)
		else
			animSetWindow(optionsBG1, 80,20, 160,(#t_mainReplay+#replayList)*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		for i=1, math.min(#replayList+1, 14) do
			if i+moveTxt < #t_mainReplay + #replayList then
				textImgDraw(createTextImg(font2, 0, 1, replayList[i+moveTxt], 85, 15+i*15))
			else
				textImgDraw(createTextImg(font2, 0, 1, t_mainReplay[1].text, 85, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		exitNetPlay()
    	exitReplay()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ONLINE MENU LOOP
--;===========================================================
t_mainNetplay = {
	{id = textImgNew(), text = 'HOST [CREATE GAME]'},
	{id = textImgNew(), text = 'CLIENT [JOIN A GAME]'},
	{id = textImgNew(), text = 'BACK'},	
}
txt_starting = createTextImg(jgFnt, 0, 1, '', 37, 228)
txt_connecting = createTextImg(jgFnt, 0, 1, '', 10, 228)

function f_mainNetplay()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainNetplay = 1
	local cancel = false
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return
		end
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainNetplay = mainNetplay - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainNetplay = mainNetplay + 1
		end
		if mainNetplay < 1 then
			mainNetplay = #t_mainNetplay
			if #t_mainNetplay > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_mainNetplay-1
			end
		elseif mainNetplay > #t_mainNetplay then
			mainNetplay = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (mainNetplay - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainNetplay - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--HOST
			if mainNetplay == 1 then
				--saves.ini
				data.lifeMul = 100
				data.team1VS2Life = 120
				data.turnsRecoveryRate = 300
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				data.zoomActive = true
				s_zoomActive = 'Yes'
				data.zoomMin = 0.75
				data.zoomMax = 1.1
				data.zoomSpeed = 1.0
				data.roundTime = 99
				data.numTurns = 4
				data.numSimul = 4
				data.simulType = 'Assist'
				data.difficulty = 8
				data.coins = 10
				data.contSelection = true
				s_contSelection = 'Yes'
				data.aiRamping = true
				s_aiRamping = 'Yes'
				data.autoguard = false
				s_autoguard = 'No'
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'				
				data.lifebar = 'data/fight.def'
				gameSpeed = 60
				s_gameSpeed = 'Normal'
				--lifebar
				roundsNum = 2
				drawNum = 2
				f_saveCfg()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				cancel = f_create()
				if not cancel then
					synchronize()
					math.randomseed(sszRandom())
					f_mainhostCfg()
				end
				exitNetPlay()
				exitReplay()
				ltn12.pump.all(
				  ltn12.source.file(assert(io.open("replays/data.replay", "rb"))),
				  ltn12.sink.file(assert(io.open("replays/Saved/" .. os.date("%Y-%m-%d %I-%M%p") .. ".replay", "wb")))
				)
			--CLIENT/JOIN
			elseif mainNetplay == 2 then
				--saves.ini
				data.lifeMul = 100
				data.team1VS2Life = 120
				data.turnsRecoveryRate = 300
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				data.zoomActive = true
				s_zoomActive = 'Yes'
				data.zoomMin = 0.75
				data.zoomMax = 1.1
				data.zoomSpeed = 1.0
				data.roundTime = 99
				data.numTurns = 4
				data.numSimul = 4
				data.simulType = 'Assist'
				data.difficulty = 8
				data.coins = 10
				data.contSelection = true
				s_contSelection = 'Yes'
				data.aiRamping = true
				s_aiRamping = 'Yes'
				data.autoguard = false
				s_autoguard = 'No'
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'				
				data.lifebar = 'data/fight.def'
				gameSpeed = 60
				s_gameSpeed = 'Normal'
				--lifebar
				roundsNum = 2
				drawNum = 2
				f_saveCfg()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				cancel = f_connect()
				if not cancel then
					synchronize()
					math.randomseed(sszRandom())
					f_mainjoinCfg()
				end
				exitNetPlay()
				exitReplay()
				ltn12.pump.all(
				  ltn12.source.file(assert(io.open("replays/data.replay", "rb"))),
				  ltn12.sink.file(assert(io.open("replays/Saved/" .. os.date("%Y-%m-%d %I-%M%p") .. ".replay", "wb")))
				)					
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end	
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_mainNetplay do
			if i == mainNetplay then
				bank = 3
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainNetplay[i].id, jgFnt, bank, 0, t_mainNetplay[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'NETWORK MODE')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		exitNetPlay()
    	exitReplay()		
		cmdInput()
		refresh()		
	end
end

--;===========================================================
--; HOST ONLINE SETTINGS MENU LOOP
--;===========================================================
txt_mainhostCfg = createTextImg(jgFnt, 0, 0, 'ONLINE SETTINGS', 159, 13)
t_mainhostCfg = {
	{id = '', text = 'Gameplay Settings'},
	{id = '', text = 'Engine Settings'},	
	{id = '', text = 'Save and Play'},
}
for i=1, #t_mainhostCfg do
	t_mainhostCfg[i].id = createTextImg(font2, 0, 1, t_mainhostCfg[i].text, 85, 15+i*15)
end

function f_mainhostCfg()
	cmdInput()
	local mainhostCfg = 1
	local bufl = 0
	local bufr = 0	
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainhostCfg = mainhostCfg - 1
			if mainhostCfg < 1 then mainhostCfg = #t_mainhostCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainhostCfg = mainhostCfg + 1
			if mainhostCfg > #t_mainhostCfg then mainhostCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif btnPalNo(p1Cmd) > 0 then
			--Gameplay Settings
			if mainhostCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				f_gamehostCfg()
			--Engine Settings
			elseif mainhostCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				f_enginehostCfg()	
			--Save and Play
			elseif mainhostCfg == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if modified == 1 then
					f_saveCfg()
				end
				f_mainHost()
				break
			end	
			--Exit
			--else
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 2)
				--break
			--end			
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_mainhostCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_mainhostCfg)		
		for i=1, #t_mainhostCfg do
			textImgDraw(t_mainhostCfg[i].id)
			if t_mainhostCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_mainhostCfg[i].varID, font2, 0, -1, t_mainhostCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+mainhostCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; HOST ONLINE GAMEPLAY SETTINGS
--;===========================================================
txt_gamehostCfg = createTextImg(jgFnt, 0, 0, 'ONLINE GAMEPLAY SETTINGS', 159, 13)
t_gamehostCfg = {
	{id = '', text = 'Difficulty Level',         varID = textImgNew(), varText = data.difficulty},
	{id = '', text = 'Round Time',         		 varID = textImgNew(), varText = data.roundTime},	
	{id = '', text = 'Rounds to Win',      		 varID = textImgNew(), varText = roundsNum},
	{id = '', text = 'Max Draw Games',      	 varID = textImgNew(), varText = drawNum},	
	{id = '', text = 'Life',               		 varID = textImgNew(), varText = data.lifeMul .. '%'},	
	{id = '', text = 'Arcade Coins',             varID = textImgNew(), varText = data.coins},
	{id = '', text = 'Char change at Continue',  varID = textImgNew(), varText = s_contSelection},
	{id = '', text = 'Versus Win Counter',  	 varID = textImgNew(), varText = s_vsDisplayWin},	
	{id = '', text = 'AI ramping',               varID = textImgNew(), varText = s_aiRamping},
	{id = '', text = 'Auto-Guard',               varID = textImgNew(), varText = s_autoguard},
	{id = '', text = 'Team Settings'},
	{id = '', text = 'Back'},
}
for i=1, #t_gamehostCfg do
	t_gamehostCfg[i].id = createTextImg(font2, 0, 1, t_gamehostCfg[i].text, 85, 15+i*15)
end

function f_gamehostCfg()
	cmdInput()
	local gamehostCfg = 1
	local bufl = 0
	local bufr = 0	
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			gamehostCfg = gamehostCfg - 1
			if gamehostCfg < 1 then gamehostCfg = #t_gamehostCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			gamehostCfg = gamehostCfg + 1
			if gamehostCfg > #t_gamehostCfg then gamehostCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		--Difficulty Level
		elseif gamehostCfg == 1 then
			if commandGetState(p1Cmd, 'r') and data.difficulty < 8 then
				sndPlay(sysSnd, 100, 0)
				data.difficulty = data.difficulty + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.difficulty > 1 then
				sndPlay(sysSnd, 100, 0)
				data.difficulty = data.difficulty - 1
				modified = 1
			end
		--Round Time			
		elseif gamehostCfg == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if data.roundTime < 1000 then
					data.roundTime = data.roundTime + 1
				else
					data.roundTime = -1
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if data.roundTime > -1 then
					data.roundTime = data.roundTime - 1
				else
					data.roundTime = 1000
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modified = 1
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
		--Rounds to Win			
		elseif gamehostCfg == 3 then
			if commandGetState(p1Cmd, 'r') and roundsNum < 10 then
				sndPlay(sysSnd, 100, 0)
				roundsNum = roundsNum + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and roundsNum > 1 then
				sndPlay(sysSnd, 100, 0)
				roundsNum = roundsNum - 1
				modified = 1
			end
		--Max Draw Games			
		elseif gamehostCfg == 4 then
			if commandGetState(p1Cmd, 'r') and drawNum < 10 then
				sndPlay(sysSnd, 100, 0)
				drawNum = drawNum + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and drawNum > 0 then
				sndPlay(sysSnd, 100, 0)
				drawNum = drawNum - 1
				modified = 1
			end				
		--Life
		elseif gamehostCfg == 5 then
			if commandGetState(p1Cmd, 'r') and data.lifeMul < 300 then
				sndPlay(sysSnd, 100, 0)
				data.lifeMul = data.lifeMul + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.lifeMul > 10 then
				sndPlay(sysSnd, 100, 0)
				data.lifeMul = data.lifeMul - 10
				modified = 1
			end			
		--Arcade Coins
		elseif gamehostCfg == 6 then
			if commandGetState(p1Cmd, 'r') and data.coins < 99 then
				sndPlay(sysSnd, 200, 0) --Coin Song
				data.coins = data.coins + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.coins > 0 then
				sndPlay(sysSnd, 200, 0) --Coin Song
				data.coins = data.coins - 1
				modified = 1
			end
		--Char change at Continue
		elseif gamehostCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.contSelection then
				data.contSelection = false
				s_contSelection = 'No'
				modified = 1
			else
				data.contSelection = true
				s_contSelection = 'Yes'
				modified = 1
			end
		--Display Versus Win Counter
		elseif gamehostCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.vsDisplayWin then
				data.vsDisplayWin = false
				s_vsDisplayWin = 'No'
				modified = 1
			else
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'
				modified = 1
			end			
		--AI ramping
		elseif gamehostCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.aiRamping then
				data.aiRamping = false
				s_aiRamping = 'No'
				modified = 1
			else
				data.aiRamping = true
				s_aiRamping = 'Yes'
				modified = 1
			end
		--Auto-Guard
		elseif gamehostCfg == 10 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.autoguard then
				data.autoguard = false
				s_autoguard = 'No'
				modified = 1
			else
				data.autoguard = true
				s_autoguard = 'Yes'
				modified = 1
			end
		--Team Settings
		elseif gamehostCfg == 11 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			f_teamhostCfg()			
		--Back
		elseif gamehostCfg == 12 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end	
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_gamehostCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_gamehostCfg)
		t_gamehostCfg[1].varText = data.difficulty
		if data.roundTime ~= -1 then
			t_gamehostCfg[2].varText = data.roundTime
		else
			t_gamehostCfg[2].varText = 'Infinite'
		end
		t_gamehostCfg[3].varText = roundsNum
		t_gamehostCfg[4].varText = drawNum		
		t_gamehostCfg[5].varText = data.lifeMul .. '%'		
		t_gamehostCfg[6].varText = data.coins
		t_gamehostCfg[7].varText = s_contSelection
		t_gamehostCfg[8].varText = s_vsDisplayWin		
		t_gamehostCfg[9].varText = s_aiRamping
		t_gamehostCfg[10].varText = s_autoguard
		for i=1, #t_gamehostCfg do
			textImgDraw(t_gamehostCfg[i].id)
			if t_gamehostCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_gamehostCfg[i].varID, font2, 0, -1, t_gamehostCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+gamehostCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; HOST ONLINE TEAM SETTINGS
--;===========================================================
txt_teamhostCfg = createTextImg(jgFnt, 0, 0, 'ONLINE TEAM SETTINGS', 159, 13)
t_teamhostCfg = {
	{id = '', text = 'Single Vs Team Life',     varID = textImgNew(), varText = data.team1VS2Life .. '%'},
	{id = '', text = 'Turns HP Recovery',       varID = textImgNew(), varText = data.turnsRecoveryRate .. '%'},
	{id = '', text = 'Disadvantage Life Share', varID = textImgNew(), varText = s_teamLifeShare},
	{id = '', text = 'Turns Players Limit',             varID = textImgNew(), varText = data.numTurns},
	{id = '', text = 'Simul Players Limit',             varID = textImgNew(), varText = data.numSimul},
	{id = '', text = 'Simul Type',              varID = textImgNew(), varText = data.simulType},
	{id = '', text = 'Back'},
}
for i=1, #t_teamhostCfg do
	t_teamhostCfg[i].id = createTextImg(font2, 0, 1, t_teamhostCfg[i].text, 85, 15+i*15)
end

function f_teamhostCfg()
	cmdInput()
	local teamhostCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			teamhostCfg = teamhostCfg - 1
			if teamhostCfg < 1 then teamhostCfg = #t_teamhostCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			teamhostCfg = teamhostCfg + 1
			if teamhostCfg > #t_teamhostCfg then teamhostCfg = 1 end
		--1P Vs Team Life
		elseif teamhostCfg == 1 then
			if commandGetState(p1Cmd, 'r') and data.team1VS2Life < 3000 then
				sndPlay(sysSnd, 100, 0)
				data.team1VS2Life = data.team1VS2Life + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.team1VS2Life > 10 then
				sndPlay(sysSnd, 100, 0)
				data.team1VS2Life = data.team1VS2Life - 10
				modified = 1
			end
		--Turns HP Recovery
		elseif teamhostCfg == 2 then
			if commandGetState(p1Cmd, 'r') and data.turnsRecoveryRate < 3000 then
				sndPlay(sysSnd, 100, 0)
				data.turnsRecoveryRate = data.turnsRecoveryRate + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.turnsRecoveryRate > 10 then
				sndPlay(sysSnd, 100, 0)
				data.turnsRecoveryRate = data.turnsRecoveryRate - 10
				modified = 1
			end
		--Disadvantage Life Share
		elseif teamhostCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.teamLifeShare then
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				modified = 1
			else
				data.teamLifeShare = true
				s_teamLifeShare = 'Yes'
				modified = 1
			end
		--Turns Limit (by default also requires editing 'if(!.m.inRange!int?(1, 4, nt)){' in ssz/system-script.ssz)
		elseif teamhostCfg == 4 then
			if commandGetState(p1Cmd, 'r') and data.numTurns < 4 then
				sndPlay(sysSnd, 100, 0)
				data.numTurns = data.numTurns + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.numTurns > 2 then
				sndPlay(sysSnd, 100, 0)
				data.numTurns = data.numTurns - 1
				modified = 1
			end
		--Simul Limit (by default also requires editing 'const int maxSimul = 4;' in ssz/common.ssz)
		elseif teamhostCfg == 5 then
			if commandGetState(p1Cmd, 'r') and data.numSimul < 4 then
				sndPlay(sysSnd, 100, 0)
				data.numSimul = data.numSimul + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.numSimul > 2 then
				sndPlay(sysSnd, 100, 0)
				data.numSimul = data.numSimul - 1
				modified = 1
			end
		--Simul Type
		elseif teamhostCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.simulType == 'Tag' then
				data.simulType = 'Assist'
				modified = 1
			else
				data.simulType = 'Tag'
				modified = 1
			end
		--Back
		elseif teamhostCfg == 7 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_teamhostCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_teamhostCfg)
		t_teamhostCfg[1].varText = data.team1VS2Life .. '%'
		t_teamhostCfg[2].varText = data.turnsRecoveryRate .. '%'
		t_teamhostCfg[3].varText = s_teamLifeShare
		t_teamhostCfg[4].varText = data.numTurns
		t_teamhostCfg[5].varText = data.numSimul
		t_teamhostCfg[6].varText = data.simulType
		for i=1, #t_teamhostCfg do
			textImgDraw(t_teamhostCfg[i].id)
			if t_teamhostCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_teamhostCfg[i].varID, font2, 0, -1, t_teamhostCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+teamhostCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; HOST ONLINE ENGINE SETTINGS
--;===========================================================
txt_enginehostCfg = createTextImg(jgFnt, 0, 0, 'ONLINE ENGINE SETTINGS', 159, 13)
t_enginehostCfg = {
	{id = '', text = 'Game Speed',  	varID = textImgNew(), varText = s_gameSpeed},
	{id = '', text = 'Zoom Settings'},
	{id = '', text = 'Back'},
}
for i=1, #t_enginehostCfg do
	t_enginehostCfg[i].id = createTextImg(font2, 0, 1, t_enginehostCfg[i].text, 85, 15+i*15)
end

function f_enginehostCfg()
	cmdInput()
	local enginehostCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			enginehostCfg = enginehostCfg - 1
			if enginehostCfg < 1 then enginehostCfg = #t_enginehostCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			enginehostCfg = enginehostCfg + 1
			if enginehostCfg > #t_enginehostCfg then enginehostCfg = 1 end
		--Game Speed
		elseif enginehostCfg == 1 then
			if commandGetState(p1Cmd, 'r') and gameSpeed < 72 then
				sndPlay(sysSnd, 100, 0)
				if gameSpeed < 48 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				--elseif gameSpeed < 56 then
					--gameSpeed = 56
					--s_gameSpeed = '93.33%'
				elseif gameSpeed < 60 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				--elseif gameSpeed < 64 then
					--gameSpeed = 64
					--s_gameSpeed = '106.66%'
				elseif gameSpeed < 72 then
					gameSpeed = 72
					s_gameSpeed = 'Turbo'
				end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and gameSpeed > 48 then
				sndPlay(sysSnd, 100, 0)
				--if gameSpeed >= 72 then
					--gameSpeed = 64
					--s_gameSpeed = '106.66%'
				if gameSpeed >= 64 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				--elseif gameSpeed >= 60 then
					--gameSpeed = 56
					--s_gameSpeed = '93.33%'
				elseif gameSpeed >= 56 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				end
				modified = 1
			end
		--Zoom Settings
		elseif enginehostCfg == 2 and btnPalNo(p1Cmd) > 0 then	
			sndPlay(sysSnd, 100, 1)
			f_zoomhostCfg()		
		--Back
		elseif enginehostCfg == 3 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_enginehostCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_enginehostCfg)
		t_enginehostCfg[1].varText = s_gameSpeed
		for i=1, #t_enginehostCfg do
			textImgDraw(t_enginehostCfg[i].id)
			if t_enginehostCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_enginehostCfg[i].varID, font2, 0, -1, t_enginehostCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+enginehostCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; HOST ONLINE ZOOM SETTINGS
--;===========================================================
txt_zoomhostCfg = createTextImg(jgFnt, 0, 0, 'ONLINE ZOOM SETTINGS', 159, 13)
t_zoomhostCfg = {
	{id = '', text = 'Zoom Active',  varID = textImgNew(), varText = s_zoomActive},
	{id = '', text = 'Max Zoom Out', varID = textImgNew(), varText = data.zoomMin},
	{id = '', text = 'Max Zoom In',  varID = textImgNew(), varText = data.zoomMax},
	{id = '', text = 'Zoom Speed',   varID = textImgNew(), varText = data.zoomSpeed},
	{id = '', text = 'Back'},
}
for i=1, #t_zoomhostCfg do
	t_zoomhostCfg[i].id = createTextImg(font2, 0, 1, t_zoomhostCfg[i].text, 85, 15+i*15)
end

function f_zoomhostCfg()
	cmdInput()
	local zoomhostCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			zoomhostCfg = zoomhostCfg - 1
			if zoomhostCfg < 1 then zoomhostCfg = #t_zoomhostCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			zoomhostCfg = zoomhostCfg + 1
			if zoomhostCfg > #t_zoomhostCfg then zoomhostCfg = 1 end
		--Zoom Active
		elseif zoomhostCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.zoomActive then
				data.zoomActive = false
				s_zoomActive = 'No'
				modified = 1
			else
				data.zoomActive = true
				s_zoomActive = 'Yes'
				modified = 1
			end
		--Max Zoom Out
		elseif zoomhostCfg == 2 and data.zoomMin < 10 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				data.zoomMin = data.zoomMin + 0.05
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomMin > 0.05 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMin = data.zoomMin - 0.05
				modified = 1
			end
		--Max Zoom In
		elseif zoomhostCfg == 3 then
			if commandGetState(p1Cmd, 'r') and data.zoomMax < 10 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMax = data.zoomMax + 0.05
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomMax > 0.05 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMax = data.zoomMax - 0.05
				modified = 1
			end
		--Zoom Speed
		elseif zoomhostCfg == 4 then
			if commandGetState(p1Cmd, 'r') and data.zoomSpeed < 10 then
				sndPlay(sysSnd, 100, 0)
				data.zoomSpeed = data.zoomSpeed + 0.1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomSpeed > 0.1 then
				sndPlay(sysSnd, 100, 0)
				data.zoomSpeed = data.zoomSpeed - 0.1
				modified = 1
			end
		--Back
		elseif zoomhostCfg == 5 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_zoomhostCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_zoomhostCfg)
		t_zoomhostCfg[1].varText = s_zoomActive
		t_zoomhostCfg[2].varText = data.zoomMin
		t_zoomhostCfg[3].varText = data.zoomMax
		t_zoomhostCfg[4].varText = data.zoomSpeed
		for i=1, #t_zoomhostCfg do
			textImgDraw(t_zoomhostCfg[i].id)
			if t_zoomhostCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_zoomhostCfg[i].varID, font2, 0, -1, t_zoomhostCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+zoomhostCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN ONLINE SETTINGS MENU LOOP
--;===========================================================
txt_mainjoinCfg = createTextImg(jgFnt, 0, 0, 'ONLINE SETTINGS', 159, 13)
t_mainjoinCfg = {
	{id = '', text = 'Gameplay Settings'},
	{id = '', text = 'Engine Settings'},	
	{id = '', text = 'Save and Play'},
}
for i=1, #t_mainjoinCfg do
	t_mainjoinCfg[i].id = createTextImg(font2, 0, 1, t_mainjoinCfg[i].text, 85, 15+i*15)
end

function f_mainjoinCfg()
	cmdInput()
	local mainjoinCfg = 1
	local bufl = 0
	local bufr = 0	
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainjoinCfg = mainjoinCfg - 1
			if mainjoinCfg < 1 then mainjoinCfg = #t_mainjoinCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainjoinCfg = mainjoinCfg + 1
			if mainjoinCfg > #t_mainjoinCfg then mainjoinCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif btnPalNo(p1Cmd) > 0 then
			--Gameplay Settings
			if mainjoinCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				f_gamejoinCfg()
			--Engine Settings
			elseif mainjoinCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				f_enginejoinCfg()	
			--Save and Play
			elseif mainjoinCfg == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if modified == 1 then
					f_saveCfg()
				end
				f_mainJoin()
				break
			end	
			--Exit
			--else
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 2)
				--break
			--end			
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_mainjoinCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_mainjoinCfg)		
		for i=1, #t_mainjoinCfg do
			textImgDraw(t_mainjoinCfg[i].id)
			if t_mainjoinCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_mainjoinCfg[i].varID, font2, 0, -1, t_mainjoinCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+mainjoinCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN ONLINE GAMEPLAY SETTINGS
--;===========================================================
txt_gamejoinCfg = createTextImg(jgFnt, 0, 0, 'ONLINE GAMEPLAY SETTINGS', 159, 13)
t_gamejoinCfg = {
	{id = '', text = 'Difficulty Level',         varID = textImgNew(), varText = data.difficulty},
	{id = '', text = 'Round Time',         		 varID = textImgNew(), varText = data.roundTime},	
	{id = '', text = 'Rounds to Win',      		 varID = textImgNew(), varText = roundsNum},
	{id = '', text = 'Max Draw Games',      	 varID = textImgNew(), varText = drawNum},	
	{id = '', text = 'Life',               		 varID = textImgNew(), varText = data.lifeMul .. '%'},	
	{id = '', text = 'Arcade Coins',             varID = textImgNew(), varText = data.coins},
	{id = '', text = 'Char change at Continue',  varID = textImgNew(), varText = s_contSelection},
	{id = '', text = 'Versus Win Counter',  	 varID = textImgNew(), varText = s_vsDisplayWin},	
	{id = '', text = 'AI ramping',               varID = textImgNew(), varText = s_aiRamping},
	{id = '', text = 'Auto-Guard',               varID = textImgNew(), varText = s_autoguard},
	{id = '', text = 'Team Settings'},
	{id = '', text = 'Back'},
}
for i=1, #t_gamejoinCfg do
	t_gamejoinCfg[i].id = createTextImg(font2, 0, 1, t_gamejoinCfg[i].text, 85, 15+i*15)
end

function f_gamejoinCfg()
	cmdInput()
	local gamejoinCfg = 1
	local bufl = 0
	local bufr = 0	
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			gamejoinCfg = gamejoinCfg - 1
			if gamejoinCfg < 1 then gamejoinCfg = #t_gamejoinCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			gamejoinCfg = gamejoinCfg + 1
			if gamejoinCfg > #t_gamejoinCfg then gamejoinCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		--Difficulty Level
		elseif gamejoinCfg == 1 then
			if commandGetState(p1Cmd, 'r') and data.difficulty < 8 then
				sndPlay(sysSnd, 100, 0)
				data.difficulty = data.difficulty + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.difficulty > 1 then
				sndPlay(sysSnd, 100, 0)
				data.difficulty = data.difficulty - 1
				modified = 1
			end
		--Round Time			
		elseif gamejoinCfg == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if data.roundTime < 1000 then
					data.roundTime = data.roundTime + 1
				else
					data.roundTime = -1
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if data.roundTime > -1 then
					data.roundTime = data.roundTime - 1
				else
					data.roundTime = 1000
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modified = 1
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
		--Rounds to Win			
		elseif gamejoinCfg == 3 then
			if commandGetState(p1Cmd, 'r') and roundsNum < 10 then
				sndPlay(sysSnd, 100, 0)
				roundsNum = roundsNum + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and roundsNum > 1 then
				sndPlay(sysSnd, 100, 0)
				roundsNum = roundsNum - 1
				modified = 1
			end
		--Max Draw Games			
		elseif gamejoinCfg == 4 then
			if commandGetState(p1Cmd, 'r') and drawNum < 10 then
				sndPlay(sysSnd, 100, 0)
				drawNum = drawNum + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and drawNum > 0 then
				sndPlay(sysSnd, 100, 0)
				drawNum = drawNum - 1
				modified = 1
			end				
		--Life
		elseif gamejoinCfg == 5 then
			if commandGetState(p1Cmd, 'r') and data.lifeMul < 300 then
				sndPlay(sysSnd, 100, 0)
				data.lifeMul = data.lifeMul + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.lifeMul > 10 then
				sndPlay(sysSnd, 100, 0)
				data.lifeMul = data.lifeMul - 10
				modified = 1
			end			
		--Arcade Coins
		elseif gamejoinCfg == 6 then
			if commandGetState(p1Cmd, 'r') and data.coins < 99 then
				sndPlay(sysSnd, 200, 0) --Coin Song
				data.coins = data.coins + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.coins > 0 then
				sndPlay(sysSnd, 200, 0) --Coin Song
				data.coins = data.coins - 1
				modified = 1
			end
		--Char change at Continue
		elseif gamejoinCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.contSelection then
				data.contSelection = false
				s_contSelection = 'No'
				modified = 1
			else
				data.contSelection = true
				s_contSelection = 'Yes'
				modified = 1
			end
		--Display Versus Win Counter
		elseif gamejoinCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.vsDisplayWin then
				data.vsDisplayWin = false
				s_vsDisplayWin = 'No'
				modified = 1
			else
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'
				modified = 1
			end			
		--AI ramping
		elseif gamejoinCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.aiRamping then
				data.aiRamping = false
				s_aiRamping = 'No'
				modified = 1
			else
				data.aiRamping = true
				s_aiRamping = 'Yes'
				modified = 1
			end
		--Auto-Guard
		elseif gamejoinCfg == 10 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.autoguard then
				data.autoguard = false
				s_autoguard = 'No'
				modified = 1
			else
				data.autoguard = true
				s_autoguard = 'Yes'
				modified = 1
			end
		--Team Settings
		elseif gamejoinCfg == 11 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			f_teamjoinCfg()			
		--Back
		elseif gamejoinCfg == 12 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end	
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_gamejoinCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_gamejoinCfg)
		t_gamejoinCfg[1].varText = data.difficulty
		if data.roundTime ~= -1 then
			t_gamejoinCfg[2].varText = data.roundTime
		else
			t_gamejoinCfg[2].varText = 'Infinite'
		end
		t_gamejoinCfg[3].varText = roundsNum
		t_gamejoinCfg[4].varText = drawNum		
		t_gamejoinCfg[5].varText = data.lifeMul .. '%'		
		t_gamejoinCfg[6].varText = data.coins
		t_gamejoinCfg[7].varText = s_contSelection
		t_gamejoinCfg[8].varText = s_vsDisplayWin		
		t_gamejoinCfg[9].varText = s_aiRamping
		t_gamejoinCfg[10].varText = s_autoguard
		for i=1, #t_gamejoinCfg do
			textImgDraw(t_gamejoinCfg[i].id)
			if t_gamejoinCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_gamejoinCfg[i].varID, font2, 0, -1, t_gamejoinCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+gamejoinCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN ONLINE TEAM SETTINGS
--;===========================================================
txt_teamjoinCfg = createTextImg(jgFnt, 0, 0, 'ONLINE TEAM SETTINGS', 159, 13)
t_teamjoinCfg = {
	{id = '', text = 'Single Vs Team Life',     varID = textImgNew(), varText = data.team1VS2Life .. '%'},
	{id = '', text = 'Turns HP Recovery',       varID = textImgNew(), varText = data.turnsRecoveryRate .. '%'},
	{id = '', text = 'Disadvantage Life Share', varID = textImgNew(), varText = s_teamLifeShare},
	{id = '', text = 'Turns Players Limit',             varID = textImgNew(), varText = data.numTurns},
	{id = '', text = 'Simul Players Limit',             varID = textImgNew(), varText = data.numSimul},
	{id = '', text = 'Simul Type',              varID = textImgNew(), varText = data.simulType},
	{id = '', text = 'Back'},
}
for i=1, #t_teamjoinCfg do
	t_teamjoinCfg[i].id = createTextImg(font2, 0, 1, t_teamjoinCfg[i].text, 85, 15+i*15)
end

function f_teamjoinCfg()
	cmdInput()
	local teamjoinCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			teamjoinCfg = teamjoinCfg - 1
			if teamjoinCfg < 1 then teamjoinCfg = #t_teamjoinCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			teamjoinCfg = teamjoinCfg + 1
			if teamjoinCfg > #t_teamjoinCfg then teamjoinCfg = 1 end
		--1P Vs Team Life
		elseif teamjoinCfg == 1 then
			if commandGetState(p1Cmd, 'r') and data.team1VS2Life < 3000 then
				sndPlay(sysSnd, 100, 0)
				data.team1VS2Life = data.team1VS2Life + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.team1VS2Life > 10 then
				sndPlay(sysSnd, 100, 0)
				data.team1VS2Life = data.team1VS2Life - 10
				modified = 1
			end
		--Turns HP Recovery
		elseif teamjoinCfg == 2 then
			if commandGetState(p1Cmd, 'r') and data.turnsRecoveryRate < 3000 then
				sndPlay(sysSnd, 100, 0)
				data.turnsRecoveryRate = data.turnsRecoveryRate + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.turnsRecoveryRate > 10 then
				sndPlay(sysSnd, 100, 0)
				data.turnsRecoveryRate = data.turnsRecoveryRate - 10
				modified = 1
			end
		--Disadvantage Life Share
		elseif teamjoinCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.teamLifeShare then
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				modified = 1
			else
				data.teamLifeShare = true
				s_teamLifeShare = 'Yes'
				modified = 1
			end
		--Turns Limit (by default also requires editing 'if(!.m.inRange!int?(1, 4, nt)){' in ssz/system-script.ssz)
		elseif teamjoinCfg == 4 then
			if commandGetState(p1Cmd, 'r') and data.numTurns < 4 then
				sndPlay(sysSnd, 100, 0)
				data.numTurns = data.numTurns + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.numTurns > 2 then
				sndPlay(sysSnd, 100, 0)
				data.numTurns = data.numTurns - 1
				modified = 1
			end
		--Simul Limit (by default also requires editing 'const int maxSimul = 4;' in ssz/common.ssz)
		elseif teamjoinCfg == 5 then
			if commandGetState(p1Cmd, 'r') and data.numSimul < 4 then
				sndPlay(sysSnd, 100, 0)
				data.numSimul = data.numSimul + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.numSimul > 2 then
				sndPlay(sysSnd, 100, 0)
				data.numSimul = data.numSimul - 1
				modified = 1
			end
		--Simul Type
		elseif teamjoinCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.simulType == 'Tag' then
				data.simulType = 'Assist'
				modified = 1
			else
				data.simulType = 'Tag'
				modified = 1
			end
		--Back
		elseif teamjoinCfg == 7 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_teamjoinCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_teamjoinCfg)
		t_teamjoinCfg[1].varText = data.team1VS2Life .. '%'
		t_teamjoinCfg[2].varText = data.turnsRecoveryRate .. '%'
		t_teamjoinCfg[3].varText = s_teamLifeShare
		t_teamjoinCfg[4].varText = data.numTurns
		t_teamjoinCfg[5].varText = data.numSimul
		t_teamjoinCfg[6].varText = data.simulType
		for i=1, #t_teamjoinCfg do
			textImgDraw(t_teamjoinCfg[i].id)
			if t_teamjoinCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_teamjoinCfg[i].varID, font2, 0, -1, t_teamjoinCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+teamjoinCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN ONLINE ENGINE SETTINGS
--;===========================================================
txt_enginejoinCfg = createTextImg(jgFnt, 0, 0, 'ONLINE ENGINE SETTINGS', 159, 13)
t_enginejoinCfg = {
	{id = '', text = 'Game Speed',  	varID = textImgNew(), varText = s_gameSpeed},
	{id = '', text = 'Zoom Settings'},
	{id = '', text = 'Back'},
}
for i=1, #t_enginejoinCfg do
	t_enginejoinCfg[i].id = createTextImg(font2, 0, 1, t_enginejoinCfg[i].text, 85, 15+i*15)
end

function f_enginejoinCfg()
	cmdInput()
	local enginejoinCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			enginejoinCfg = enginejoinCfg - 1
			if enginejoinCfg < 1 then enginejoinCfg = #t_enginejoinCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			enginejoinCfg = enginejoinCfg + 1
			if enginejoinCfg > #t_enginejoinCfg then enginejoinCfg = 1 end
		--Game Speed
		elseif enginejoinCfg == 1 then
			if commandGetState(p1Cmd, 'r') and gameSpeed < 72 then
				sndPlay(sysSnd, 100, 0)
				if gameSpeed < 48 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				--elseif gameSpeed < 56 then
					--gameSpeed = 56
					--s_gameSpeed = '93.33%'
				elseif gameSpeed < 60 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				--elseif gameSpeed < 64 then
					--gameSpeed = 64
					--s_gameSpeed = '106.66%'
				elseif gameSpeed < 72 then
					gameSpeed = 72
					s_gameSpeed = 'Turbo'
				end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and gameSpeed > 48 then
				sndPlay(sysSnd, 100, 0)
				--if gameSpeed >= 72 then
					--gameSpeed = 64
					--s_gameSpeed = '106.66%'
				if gameSpeed >= 64 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				--elseif gameSpeed >= 60 then
					--gameSpeed = 56
					--s_gameSpeed = '93.33%'
				elseif gameSpeed >= 56 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				end
				modified = 1
			end
		--Zoom Settings
		elseif enginejoinCfg == 2 and btnPalNo(p1Cmd) > 0 then	
			sndPlay(sysSnd, 100, 1)
			f_zoomjoinCfg()		
		--Back
		elseif enginejoinCfg == 3 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_enginejoinCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_enginejoinCfg)
		t_enginejoinCfg[1].varText = s_gameSpeed
		for i=1, #t_enginejoinCfg do
			textImgDraw(t_enginejoinCfg[i].id)
			if t_enginejoinCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_enginejoinCfg[i].varID, font2, 0, -1, t_enginejoinCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+enginejoinCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN ONLINE ZOOM SETTINGS
--;===========================================================
txt_zoomjoinCfg = createTextImg(jgFnt, 0, 0, 'ONLINE ZOOM SETTINGS', 159, 13)
t_zoomjoinCfg = {
	{id = '', text = 'Zoom Active',  varID = textImgNew(), varText = s_zoomActive},
	{id = '', text = 'Max Zoom Out', varID = textImgNew(), varText = data.zoomMin},
	{id = '', text = 'Max Zoom In',  varID = textImgNew(), varText = data.zoomMax},
	{id = '', text = 'Zoom Speed',   varID = textImgNew(), varText = data.zoomSpeed},
	{id = '', text = 'Back'},
}
for i=1, #t_zoomjoinCfg do
	t_zoomjoinCfg[i].id = createTextImg(font2, 0, 1, t_zoomjoinCfg[i].text, 85, 15+i*15)
end

function f_zoomjoinCfg()
	cmdInput()
	local zoomjoinCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			zoomjoinCfg = zoomjoinCfg - 1
			if zoomjoinCfg < 1 then zoomjoinCfg = #t_zoomjoinCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			zoomjoinCfg = zoomjoinCfg + 1
			if zoomjoinCfg > #t_zoomjoinCfg then zoomjoinCfg = 1 end
		--Zoom Active
		elseif zoomjoinCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.zoomActive then
				data.zoomActive = false
				s_zoomActive = 'No'
				modified = 1
			else
				data.zoomActive = true
				s_zoomActive = 'Yes'
				modified = 1
			end
		--Max Zoom Out
		elseif zoomjoinCfg == 2 and data.zoomMin < 10 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				data.zoomMin = data.zoomMin + 0.05
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomMin > 0.05 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMin = data.zoomMin - 0.05
				modified = 1
			end
		--Max Zoom In
		elseif zoomjoinCfg == 3 then
			if commandGetState(p1Cmd, 'r') and data.zoomMax < 10 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMax = data.zoomMax + 0.05
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomMax > 0.05 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMax = data.zoomMax - 0.05
				modified = 1
			end
		--Zoom Speed
		elseif zoomjoinCfg == 4 then
			if commandGetState(p1Cmd, 'r') and data.zoomSpeed < 10 then
				sndPlay(sysSnd, 100, 0)
				data.zoomSpeed = data.zoomSpeed + 0.1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomSpeed > 0.1 then
				sndPlay(sysSnd, 100, 0)
				data.zoomSpeed = data.zoomSpeed - 0.1
				modified = 1
			end
		--Back
		elseif zoomjoinCfg == 5 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_zoomjoinCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_zoomjoinCfg)
		t_zoomjoinCfg[1].varText = s_zoomActive
		t_zoomjoinCfg[2].varText = data.zoomMin
		t_zoomjoinCfg[3].varText = data.zoomMax
		t_zoomjoinCfg[4].varText = data.zoomSpeed
		for i=1, #t_zoomjoinCfg do
			textImgDraw(t_zoomjoinCfg[i].id)
			if t_zoomjoinCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_zoomjoinCfg[i].varID, font2, 0, -1, t_zoomjoinCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+zoomjoinCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; HOST MENU LOOP
--;===========================================================
t_mainHost = {
	{id = textImgNew(), text = 'VERSUS PLAYER 2'},
	{id = textImgNew(), text = 'PRACTICE'},	
	{id = textImgNew(), text = 'ARCADE'},
	{id = textImgNew(), text = 'SURVIVAL'},
	{id = textImgNew(), text = 'ENDLESS'},
	{id = textImgNew(), text = 'BOSS RUSH'},
	{id = textImgNew(), text = 'BONUS RUSH'},
	{id = textImgNew(), text = 'SUDDEN DEATH'},
	{id = textImgNew(), text = 'TIME ATTACK'},	
	{id = textImgNew(), text = 'ONLINE SETTINGS'},
	{id = textImgNew(), text = 'LEAVE ONLINE'},
}

function f_mainHost()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainHost = 1
	local cancel = false
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return
		end
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainHost = mainHost - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainHost = mainHost + 1
		end
		if mainHost < 1 then
			mainHost = #t_mainHost
			if #t_mainHost > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_mainHost-1
			end
		elseif mainHost > #t_mainHost then
			mainHost = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (mainHost - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainHost - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ONLINE VERSUS
			if mainHost == 1 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setHomeTeam(1)
				data.p2In = 2
				data.stageMenu = true
				data.p2Faces = true
				setRoundTime(-1)
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'ONLINE VERSUS')
				script.select.f_selectSimple()
			--ONLINE TRAINING
			elseif mainHost == 2 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				setRoundTime(-1)
				setLifeMul(99999)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.stageMenu = true
				data.versusScreen = true
				data.p2Faces = true
				data.gameMode = 'training'
				textImgSetText(txt_mainSelect, 'ONLINE TRAINING')
				script.select.f_selectSimple()
			--ONLINE ARCADE	
			elseif mainHost == 3 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.coinsLeft = data.coins - 1
				data.gameMode = 'arcade'
				textImgSetText(txt_mainSelect, 'ONLINE ARCADE COOPERATIVE')
                script.select.f_selectAdvance()
			--ONLINE SURVIVAL	
			elseif mainHost == 4 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.coinsLeft = 0
				data.gameMode = 'survival'
				textImgSetText(txt_mainSelect, 'ONLINE SURVIVAL COOPERATIVE')
				script.select.f_selectAdvance()
			--ONLINE ENDLESS
			elseif mainHost == 5 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'ONLINE ENDLESS COOPERATIVE')			
				script.select.f_selectAdvance()
			--ONLINE BOSS RUSH
			elseif mainHost == 6 then		
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if #t_bossChars ~= 0 then
					data.p2In = 2
					data.p2Faces = true
					data.coop = true
					data.coinsLeft = 0
					data.gameMode = 'bossrush'
					textImgSetText(txt_mainSelect, 'ONLINE BOSS RUSH COOPERATIVE')					
					script.select.f_selectAdvance()
				end	
			--ONLINE BONUS RUSH
			elseif mainHost == 7 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if #t_bonusChars ~= 0 then
					data.p2In = 2
					data.p2Faces = true
					data.coop = true
					data.versusScreen = false
					data.coinsLeft = 0
					data.gameMode = 'bonusrush'
					textImgSetText(txt_mainSelect, 'ONLINE BONUS RUSH COOPERATIVE')					
					script.select.f_selectAdvance()
				end	
			--ONLINE SUDDEN DEATH
			elseif mainHost == 8 then				
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(1000)
				setLifeMul(0)				
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				data.rosterMode = 'suddendeath'
				textImgSetText(txt_mainSelect, 'ONLINE SUDDEN DEATH COOPERATIVE')
				script.select.f_selectAdvance()				
			--ONLINE TIME ATTACK
			elseif mainHost == 9 then				
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(3600)
				setLifeMul(2)				
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'ONLINE TIME ATTACK COOPERATIVE (W.I.P)')
				script.select.f_selectAdvance()				
			--ONLINE SETTINGS
			elseif mainHost == 10 then
				sndPlay(sysSnd, 100, 1)
				f_mainhostCfg()
			--EXIT
			else
				sndPlay(sysSnd, 100, 2)
				break
			end			
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_mainHost do
			if i == mainHost then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainHost[i].id, jgFnt, bank, 0, t_mainHost[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'ONLINE MENU')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN MENU LOOP
--;===========================================================
t_mainJoin = {
	{id = textImgNew(), text = 'VERSUS PLAYER 1'},
	{id = textImgNew(), text = 'PRACTICE'},	
	{id = textImgNew(), text = 'ARCADE'},
	{id = textImgNew(), text = 'SURVIVAL'},
	{id = textImgNew(), text = 'ENDLESS'},
	{id = textImgNew(), text = 'BOSS RUSH'},
	{id = textImgNew(), text = 'BONUS RUSH'},
	{id = textImgNew(), text = 'SUDDEN DEATH'},
	{id = textImgNew(), text = 'TIME ATTACK'},	
	{id = textImgNew(), text = 'ONLINE SETTINGS'},
	{id = textImgNew(), text = 'LEAVE ONLINE'},	
}

function f_mainJoin()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainJoin = 1
	local cancel = false
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return
		end
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainJoin = mainJoin - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainJoin = mainJoin + 1
		end
		if mainJoin < 1 then
			mainJoin = #t_mainJoin
			if #t_mainJoin > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_mainJoin-1
			end
		elseif mainJoin > #t_mainJoin then
			mainJoin = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (mainJoin - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainJoin - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ONLINE VERSUS
			if mainJoin == 1 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setHomeTeam(1)
				data.p2In = 2
				data.stageMenu = true
				data.p2Faces = true
				setRoundTime(-1)
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'ONLINE VERSUS')
				script.select.f_selectSimple()
			--ONLINE TRAINING
			elseif mainJoin == 2 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				setRoundTime(-1)
				setLifeMul(99999)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.stageMenu = true
				data.versusScreen = true
				data.p2Faces = true
				data.gameMode = 'training'
				textImgSetText(txt_mainSelect, 'ONLINE TRAINING')
				script.select.f_selectSimple()
			--ONLINE ARCADE	
			elseif mainJoin == 3 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.coinsLeft = data.coins - 1
				data.gameMode = 'arcade'
				textImgSetText(txt_mainSelect, 'ONLINE ARCADE COOPERATIVE')
                script.select.f_selectAdvance()
			--ONLINE SURVIVAL	
			elseif mainJoin == 4 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.coinsLeft = 0
				data.gameMode = 'survival'
				textImgSetText(txt_mainSelect, 'ONLINE SURVIVAL COOPERATIVE')
				script.select.f_selectAdvance()
			--ONLINE ENDLESS
			elseif mainJoin == 5 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'ONLINE ENDLESS COOPERATIVE')			
				script.select.f_selectAdvance()
			--ONLINE BOSS RUSH
			elseif mainJoin == 6 then		
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if #t_bossChars ~= 0 then
					data.p2In = 2
					data.p2Faces = true
					data.coop = true
					data.coinsLeft = 0
					data.gameMode = 'bossrush'
					textImgSetText(txt_mainSelect, 'ONLINE BOSS RUSH COOPERATIVE')					
					script.select.f_selectAdvance()
				end	
			--ONLINE BONUS RUSH
			elseif mainJoin == 7 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if #t_bonusChars ~= 0 then
					data.p2In = 2
					data.p2Faces = true
					data.coop = true
					data.versusScreen = false
					data.coinsLeft = 0
					data.gameMode = 'bonusrush'
					textImgSetText(txt_mainSelect, 'ONLINE BONUS RUSH COOPERATIVE')					
					script.select.f_selectAdvance()
				end	
			--ONLINE SUDDEN DEATH
			elseif mainJoin == 8 then				
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(1000)
				setLifeMul(0)				
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				data.rosterMode = 'suddendeath'
				textImgSetText(txt_mainSelect, 'ONLINE SUDDEN DEATH COOPERATIVE')
				script.select.f_selectAdvance()				
			--ONLINE TIME ATTACK
			elseif mainJoin == 9 then				
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(3600)
				setLifeMul(2)				
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
				data.gameMode = 'endless'
				textImgSetText(txt_mainSelect, 'ONLINE TIME ATTACK COOPERATIVE (W.I.P)')
				script.select.f_selectAdvance()				
			--ONLINE SETTINGS
			elseif mainJoin == 10 then
				sndPlay(sysSnd, 100, 1)
				f_mainjoinCfg()
			--EXIT
			else
				sndPlay(sysSnd, 100, 2)
				break
			end	
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_mainJoin do
			if i == mainJoin then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainJoin[i].id, jgFnt, bank, 0, t_mainJoin[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_titleFt1)
		textImgSetText(txt_titleFt1, 'ONLINE MENU')
		textImgDraw(txt_titleFt2)
		f_clock()
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end	
	
--;===========================================================
--; HOST LOOP
--;===========================================================
function f_create()
	textImgSetText(txt_starting, 'Starting netplay by port ' .. getListenPort())
	enterNetPlay(inputDialogGetStr(inputdia))
	while not connected() do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			return true
		end
		textImgDraw(txt_starting)
		refresh()
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
	end
	return false
end

--;===========================================================
--; CLIENT/JOIN LOOP
--;===========================================================
function f_connect()
	inputDialogPopup(inputdia, 'To Join enter IP address of your Host')
	while not inputDialogIsDone(inputdia) do
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		refresh()
	end
	sndPlay(sysSnd, 100, 1)
	textImgSetText(txt_connecting, 'Now connecting with ' .. inputDialogGetStr(inputdia) .. ' ' .. getListenPort())
	enterNetPlay(inputDialogGetStr(inputdia))
	while not connected() do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			return true
		end
		textImgDraw(txt_connecting)
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		refresh()	
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
	end
	return false
end

--;===========================================================
--; INITIALIZE LOOPS
--;===========================================================

f_mainStart()
