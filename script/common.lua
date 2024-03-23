--;===========================================================
--; LIBRARY DEFINITION
--;===========================================================
lfs = require('lfs') --load lfs.dll
package.path = package.path..';./lib/ltn12.lua' --load ltn12 lua library
ltn12 = require('ltn12')
package.path = package.path..';./lib/dkjson.lua' --load dkjson lua library
dkjson = require('dkjson')
json = (loadfile 'lib/dkjson.lua')() --One-time load of the json routines
--[[
package.path = package.path..';./lib/net/http.lua'
http = require('http')
package.path = package.path..';./lib/net/socket.lua'
socket = require('socket')
package.path = package.path..';./lib/net/ftp.lua'
ftp = require('ftp')
package.path = package.path..';./lib/net/headers.lua'
headers = require('headers')
package.path = package.path..';./lib/net/mbox.lua'
mbox = require('mbox')
package.path = package.path..';./lib/net/mime.lua'
mime = require('mime')
package.path = package.path..';./lib/net/smtp.lua'
smtp = require('smtp')
package.path = package.path..';./lib/net/tp.lua'
tp = require('tp')
package.path = package.path..';./lib/net/url.lua'
url = require('url')
]]
--;===========================================================
--; DATA DEFINITION
--;===========================================================
data = require('save.data') --Create global space variable (accessing variables between modules)

--[[Require function, allows use the content inside in the script said.
The begin of the script called need to have this:

module(..., package.seeall)
]]

--Load saved variables
assert(loadfile('save/data_sav.lua'))() --assert loadfile, allows load the content stored in script said. The script must not have any module load.
assert(loadfile('save/stats_sav.lua'))() --player records data
assert(loadfile('save/training_sav.lua'))() --training data
assert(loadfile('save/temp_sav.lua'))() --temp data

require('script.updatecfg') --to update settings without reset entire config

--Data loading from host_rooms.json
local file = io.open("save/host_rooms.json","r")
host_rooms = json.decode(file:read("*all"))
file:close()

--Data loading from stats_sav.lua
local file = io.open("save/stats_sav.lua","r")
statsDataLUA = file:read("*all")
file:close()

--Data loading from training_sav.lua
local trainingFile = io.open("save/training_sav.lua","r")
s_trainLUA = trainingFile:read("*all")
trainingFile:close()

--Data loading from temp_sav.lua
local tempFile = io.open("save/temp_sav.lua","r")
s_tempdataLUA = tempFile:read("*all")
tempFile:close()

--;===========================================================
--; SCREENPACK DEFINITION
--;===========================================================
--SFF
fadeSff = sffNew('data/screenpack/fade.sff') --load fade sprites
sysSff = sffNew('data/screenpack/system.sff') --load screenpack/menu sprites
contSff = sffNew('data/screenpack/continue.sff') --load continue sprites
eventSff = sffNew('data/screenpack/events.sff') --load events menu sprites
missionSff = sffNew('data/screenpack/missions.sff') --load missions menu sprites
gallerySff = sffNew('data/screenpack/gallery.sff') --load gallery sprites
storySff = sffNew('data/screenpack/story.sff') --load story sprites
--towerSff = sffNew('data/screenpack/tower.sff') --load tower sprites
--[[
tourneySff = sffNew('data/screenpack/tourney.sff') --load tourney sprites
legionSff = sffNew('data/screenpack/legion.sff') --load legion sprites
adventureSff = sffNew('data/screenpack/adventure.sff') --load adventure sprites
]]

--SND (Sound effects do not interrupt music/bgm)
sysSnd = sndNew('data/screenpack/system.snd')
announcerSnd = sndNew('data/screenpack/announcer.snd')
contSnd = sndNew('data/screenpack/continue.snd')

--Fonts (At the moments only FNT Format is Supported)
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

--;=================================================================
--; SOUNDTRACK DEFINITION (ONLY MP3 and OGG formats are Supported)
--;=================================================================
bgmNothing = " .mp3"
bgmIntro = "sound/System/Opening.mp3"
bgmIntroJP = "sound/System/Opening Lyrics.mp3"
bgmTitle = "sound/System/Title.mp3"
bgmSelectBoss = "sound/System/select/Select Boss.mp3"
bgmSelectOrder = "sound/System/Order Select.mp3"
bgmSelectOrderFinal = "sound/System/Order Select Final.mp3"
bgmVS = "sound/System/VS.mp3"
bgmVSFinal = "sound/System/VS Final.mp3"
bgmVictory = "sound/System/Victory.mp3"
bgmResults = "sound/System/Results.mp3"
bgmService = "sound/System/Service.mp3"
bgmContinue = "sound/System/Continue.mp3"
bgmGameOver = "sound/System/Game Over.mp3"
bgmVault = "sound/System/The Vault.mp3"
bgmEvents = "sound/System/Events.mp3"
bgmStory = "sound/System/Story.mp3"
bgmTower = "sound/System/Tower.mp3"
bgmTourney = "sound/System/Tourney.mp3"
bgmLegion = "sound/System/Legion.mp3"
bgmAdventure = "sound/System/Adventure.mp3"

--Select Main Menu Song
function f_menuMusic()
	if data.menuSong == "Random" then
		f_bgmrandomMenu()
	else
		playBGM(data.menuSong)
	end
end

--Random Select for Main Menu Song
function f_bgmrandomMenu()
	local randomTrack = {"sound/System/Menu 1.mp3", "sound/System/Menu 2.mp3", "sound/System/Menu 3.ogg"}
	playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Select Character Select Song
function f_selectMusic()
	if data.selectSong == "Random" then
		--TODO
	else
		playBGM(data.selectSong)
	end
end

--Select Character Select (New Challenger Mode) Song
function f_challengerMusic()
	if data.challengerSong == "Random" then
		--TODO
	else
		playBGM(data.challengerSong)
	end
end

--Random Select Song for Quick Versus Mode
function f_bgmrandomVS()
	t_randomsongList = {}
	for file in lfs.dir[[.\\sound\\]] do
		if file:match('^.*(%.)mp3$') then
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['name'] = file:gsub('^(.*)[%.]mp3$', '%1')
			t_randomsongList[row]['path'] = 'sound/'..file
		elseif file:match('^.*(%.)MP3$') then
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['name'] = file:gsub('^(.*)[%.]MP3$', '%1')
			t_randomsongList[row]['path'] = 'sound/'..file
		elseif file:match('^.*(%.)ogg$') then
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['name'] = file:gsub('^(.*)[%.]ogg$', '%1')
			t_randomsongList[row]['path'] = 'sound/'..file
		elseif file:match('^.*(%.)OGG$') then
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['name'] = file:gsub('^(.*)[%.]OGG$', '%1')
			t_randomsongList[row]['path'] = 'sound/'..file
		end
	end
	playBGM(t_randomsongList[math.random(1, #t_randomsongList)].path)
	if data.debugLog then f_printTable(t_randomsongList, "save/debug/t_randomsongList.txt") end
end

--Load Songs from Folders
function f_soundtrack()
t_songList = {} --Create Table
--;=================================================================
--;	FOLDER 1
--;=================================================================
folder = #t_songList+1 --Set "Folder 1" row for the table
t_songList[folder] = {} --Add 1st Folder
for file in lfs.dir[[.\\sound\\]] do --Read Dir
	if file:match('^.*(%.)mp3$') then --Filter Files .mp3			
		t_songList[folder][#t_songList[folder]+1] = {} --Add songs filtered to the end of the "folder" sub-table
		t_songList[folder][#t_songList[folder]]['id'] = '' --Reserve id to create text
		t_songList[folder][#t_songList[folder]]['folder'] = 'SOUND' --Folder name where is located the song
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]mp3$', '%1') --Get song name without extension
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file --Get song file path
	elseif file:match('^.*(%.)MP3$') then --Filter Files .MP3
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SOUND'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]MP3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file
	elseif file:match('^.*(%.)ogg$') then --Filter Files .ogg
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SOUND'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]ogg$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file
	elseif file:match('^.*(%.)OGG$') then --Filter Files .OGG
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SOUND'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]OGG$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file
	end
end
--Add extra items to the end of "Folder" sub-row Created
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SOUND', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SOUND', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 2
--;=================================================================
folder = #t_songList+1 --Set "Folder 2" row for the table
t_songList[folder] = {} --Add 2nd Folder
for file in lfs.dir[[.\\sound\system\\]] do
	if file:match('^.*(%.)mp3$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]mp3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	elseif file:match('^.*(%.)MP3$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]MP3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	elseif file:match('^.*(%.)ogg$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]ogg$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	elseif file:match('^.*(%.)OGG$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]OGG$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SYSTEM', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SYSTEM', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 3
--;=================================================================
folder = #t_songList+1
t_songList[folder] = {}
for file in lfs.dir[[.\\sound\system\menu\\]] do
	if file:match('^.*(%.)mp3$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]mp3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	elseif file:match('^.*(%.)MP3$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]MP3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	elseif file:match('^.*(%.)ogg$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]ogg$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	elseif file:match('^.*(%.)OGG$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]OGG$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'MENU', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'MENU', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 4
--;=================================================================
folder = #t_songList+1
t_songList[folder] = {}
for file in lfs.dir[[.\\sound\system\select\\]] do
	if file:match('^.*(%.)mp3$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]mp3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	elseif file:match('^.*(%.)MP3$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]MP3$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	elseif file:match('^.*(%.)ogg$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]ogg$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	elseif file:match('^.*(%.)OGG$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.]OGG$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'CHARACTER SELECT', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'CHARACTER SELECT', name = '          BACK', path = ''}
--;=================================================================
--;	SET YOUR FOLDER BELOW
--;=================================================================

--
if data.debugLog then f_printTable(t_songList, "save/debug/t_songList.txt") end
t_randomSongTest = {}
for i=1, #t_songList[1] do --recibe todos los valores de la folder 1, la idea es usar esta tabla para randomizar esos valores como lo hace t_selchars
	t_randomSongTest[#t_randomSongTest+1] = i - 1
end
if data.debugLog then f_printTable(t_randomSongTest, "save/debug/t_randomSongTest.txt") end
end

--;===========================================================
--; MOVIE DEFINITION
--;===========================================================
videoHowToPlay = "movie/How To Play.wmv"
videoOpening = "movie/Opening.wmv"

--;===========================================================
--; COMMON FUNCTIONS DEFINITION
--;===========================================================
--Constants/Standards
gameTick = 20

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
	commandAdd(c, 'q', 'q') --LT/SCREENSHOT
	commandAdd(c, 'w', 'w') --RT/CONFIRM
	commandAdd(c, 'e', 'e') --SELECT/RETURN
	commandAdd(c, 's', 's') --START/PAUSE
	commandAdd(c, 'holds', '/s')
	commandAdd(c, 'su', '/s, U')
	commandAdd(c, 'sd', '/s, D')
end

p1Cmd = commandNew()
setCommand(p1Cmd)

p2Cmd = commandNew()
setCommand(p2Cmd)

setSysCtrl(10) --Load Menu Controls from config.ssz

function cmdInput()
	commandInput(p1Cmd, data.p1In)
	commandInput(p2Cmd, data.p2In)
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

--Take Screenshots
function f_screenShot()
	sndPlay(sysSnd, 22, 0) --sndPlay(sysSnd, 22, 1)
	takeScreenShot("screenshots/ " .. os.date("IKEMEN %Y-%m-%d %I-%M%p-%S") .. ".png")
end

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

--shortcut for draw text for select.lua player 1 functions in list format
function f_drawNameListP1(id, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique, scaleX, scaleY)
	for i=1, #t do
		textImgSetText(id, f_getName(t[i].cel)) --f_getName(t[i].cel if you want to get all names of table inserted
		textImgSetPos(id, x, y)
		scaleX = scaleX or 0.8
		scaleY = scaleY or 0.8
		textImgSetScale(id, scaleX, scaleY)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(id, 3) --Blue Color of P1 on VS screen
			else
				textImgSetBank(id, bankUnique) --Color of Team Member on VS screen
			end
		else
			textImgSetBank(id, 3)
		end
		textImgDraw(id)
		x = x + spacingX
		y = y + spacingY
	end
	return x, y
end

--shortcut for draw text for select.lua player 2 functions in list format
function f_drawNameListP2(id, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique, scaleX, scaleY)
	for i=1, #t do
		textImgSetText(id, f_getName(t[i].cel))
		textImgSetPos(id, x, y)
		scaleX = scaleX or 0.8
		scaleY = scaleY or 0.8
		textImgSetScale(id, scaleX, scaleY)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(id, 1)
			else
				textImgSetBank(id, bank)
			end
		else
			textImgSetBank(id, 1)
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

--shortcut for draw character animations
function f_drawCharAnim(t, data, x, y, update, scaleX, scaleY, alphaS, alphaD)
	if t ~= nil and t[data] ~= nil then
		scaleX = scaleX or 1
		scaleY = scaleY or 1
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

function f_contains(t, val)
	for k,v in pairs(t) do
		--if v == val then
		if v:match(val) then
			return true
		end
	end
	return false
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

--Keyboard conversion table (Unused Currently)
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
			if commandGetState(p1Cmd, 'w') then --Skip Button
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
--; MAIN MENU STUFF
--;===========================================================
--Loading Text
txt_loading = createTextImg(font1, 0, -1, 'LOADING FILES...', 310, 230)

function f_default() --Reset Game Modes Configuration
	setAutoLevel(false) --generate autolevel.txt in debug dir
	setHomeTeam(2) --P2 side considered the home team: http://mugenguild.com/forum/topics/ishometeam-triggers-169132.0.html
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
	--data.p1Faces = false --additional window with P1 select screen small portraits (faces) disabled
	data.p2Faces = false --additional window with P2 select screen small portraits (faces) disabled
	data.p1SelectMenu = true --P1 character selection enabled
	data.p2SelectMenu = true --P2 character selection enabled
	data.aiFight = false --AI = data.difficulty for all characters disabled
	data.stageMenu = false --stage selection disabled
	data.stage = nil --no predefined custom stage
	data.bgm = nil --no predefined custom song route
	data.orderSelect = true --order select screen enabled
	data.versusScreen = true --versus screen enabled
	data.victoryscreen = true --victory screen enabled
	data.serviceScreen = false --service screen disabled
	data.challengerScreen = true --Here comes a New Challenger screen enabled
	data.gameMode = '' --additional variable used to distinguish modes in select screen
	data.rosterMode = '' --additional variable used to identify special modes in select screen
	data.rosterAdvanced = false --additional variable used to identify advanced games in select screen
	data.missionNo = nil --additional variable used to identify missions in select screen
	data.eventNo = nil --additional variable used to identify events in select screen
	data.storyNo = nil --additional variable used to identify stories in select screen
	setHUD(true) --just enable or disable hud elements in game (added via system-script.ssz)
	setServiceType(0) --set different fight services for players (works via match.cns) [0:No Service, (1 or 21):MAX Power, (2 or 22):Enemy Life At 1/3, (3 or 23):Double Defence, (4 or 24):Invincible]
	setGameType(0) --set game type to identify (works via match.cns) [0:No Special Match, 1:Demo Match, 2:Training Match, 3:Bonus Match, 4:Input Test Match]
	setGameMode('') --sets ssz gameMode variable to adjust internal settings.
	setPlayerSide('') --sets ssz player side variable to adjust internal settings in pause menu.
end

sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
--sysTime3 = tonumber(os.date("%m"))

--;===========================================================
--; SAVE DATA DEFINITION
--;===========================================================
--Data saving to temp_sav.lua
function f_saveTemp()
	local t_temp = {
		['data.tempBack'] = data.tempBack,
		['data.replayDone'] = data.replayDone,
		['data.challengerMode'] = data.challengerMode
	}
	s_tempdataLUA = f_strSub(s_tempdataLUA, t_temp)
	local tempFile = io.open("save/temp_sav.lua","w+")
	tempFile:write(s_tempdataLUA)
	tempFile:close()
end

--Data saving to training_sav.lua
function f_saveTraining()
	--[[
	setPlaybackCfg(
		data.pbkRecSlot,
		data.pbkPlaySlot,
		data.pbkPlayLoop,
		data.pbkSlot1,
		data.pbkSlot2,
		data.pbkSlot3,
		data.pbkSlot4,
		data.pbkSlot5
	)
	]]
	local t_training = {
	--Practice Settings
		['data.damageDisplay'] = data.damageDisplay,
		['data.inputDisplay'] = data.inputDisplay,
		['data.hitbox'] = data.hitbox,
		['data.debugInfo'] = data.debugInfo,
		['data.PowerStateP1'] = data.PowerStateP1,
		['data.PowerStateP2'] = data.PowerStateP2,
		['data.LifeStateP1'] = data.LifeStateP1,
		['data.LifeStateP2'] = data.LifeStateP2,
	--Playback Settings
		['data.pbkRecSlot'] = data.pbkRecSlot,
		['data.pbkPlaySlot'] = data.pbkPlaySlot,
		['data.pbkPlayLoop'] = data.pbkPlayLoop,
		['data.pbkSlot1'] = data.pbkSlot1,
		['data.pbkSlot2'] = data.pbkSlot2,
		['data.pbkSlot3'] = data.pbkSlot3,
		['data.pbkSlot4'] = data.pbkSlot4,
		['data.pbkSlot5'] = data.pbkSlot5
	}
	s_trainLUA = f_strSub(s_trainLUA, t_training)
	local trainingFile = io.open("save/training_sav.lua","w+")
	trainingFile:write(s_trainLUA)
	trainingFile:close()
	--trainingModified = false
end

function f_playTime()
	gTime = os.clock() - gameTime
	data.playTime = (data.playTime + gTime)
	f_saveProgress()
	assert(loadfile('save/stats_sav.lua'))()
end

--Data saving to stats_sav.lua
function f_saveProgress()
	local t_progress = {
		['data.firstRun'] = data.firstRun,
		['data.arcadeClear'] = data.arcadeClear,
		['data.survivalClear'] = data.survivalClear,
		['data.coins'] = data.coins,
		['data.attractCoins'] = data.attractCoins,
		['data.continueCount'] = data.continueCount,
		['data.vault'] = data.vault,
		['data.playTime'] = data.playTime,
		['data.trainingTime'] = data.trainingTime,
		['data.favoriteChar'] = data.favoriteChar,
		['data.favoriteStage'] = data.favoriteStage,
		['data.victories'] = data.victories,
		['data.defeats'] = data.defeats,
	--Records Data
		['data.timerecord'] = data.timerecord,
		['data.scorerecord'] = data.scorerecord,
		['data.bossrecord'] = data.bossrecord,
		['data.suddenrecord'] = data.suddenrecord,
		['data.endlessrecord'] = data.endlessrecord,
	--Time Played Data
		['data.arcadeTime'] = data.arcadeTime,
		['data.vsTime'] = data.vsTime,
		['data.survivalTime'] = data.survivalTime,
		['data.bossTime'] = data.bossTime,
		['data.bonusTime'] = data.bonusTime,
		['data.timeattackTime'] = data.timeattackTime,
		['data.suddendeathTime'] = data.suddendeathTime,
		['data.cpumatchTime'] = data.cpumatchTime,
		['data.eventsTime'] = data.eventsTime,
		['data.missionsTime'] = data.missionsTime,
		['data.endlessTime'] = data.endlessTime,
		['data.legionTime'] = data.legionTime,
		['data.towerTime'] = data.towerTime,
		['data.storyTime'] = data.storyTime,
		['data.tourneyTime'] = data.tourneyTime,
		['data.adventureTime'] = data.adventureTime,
	--Event Mode Data
		['data.eventsProgress'] = data.eventsProgress,
		['data.event1Status'] = data.event1Status,
		['data.event2Status'] = data.event2Status,
		['data.event3Status'] = data.event3Status,
	--Mission Mode Data
		['data.missionsProgress'] = data.missionsProgress,
		['data.mission1Status'] = data.mission1Status,
		['data.mission2Status'] = data.mission2Status,
		['data.mission3Status'] = data.mission3Status,
	--Story Mode Data
		['data.storiesProgress'] = data.storiesProgress,
	--Arc 1 Data
		['data.story1_0Status'] = data.story1_0Status,
		['data.story1_1Status'] = data.story1_1Status,
		['data.story1_2Status'] = data.story1_2Status,
		['data.story1_3AStatus'] = data.story1_3AStatus,
		['data.story1_3BStatus'] = data.story1_3BStatus,
		['data.story1_4AStatus'] = data.story1_4AStatus,
		['data.story1_4BStatus'] = data.story1_4BStatus,
		['data.story1_4CStatus'] = data.story1_4CStatus,
		['data.story1_4DStatus'] = data.story1_4DStatus,
	--Arc 2 Data
		['data.story2_0Status'] = data.story2_0Status,
		['data.story2_1Status'] = data.story2_1Status,
		['data.story2_2Status'] = data.story2_2Status,
	--Arc 3 Data
		['data.story3_0Status'] = data.story3_0Status,
		['data.story3_1Status'] = data.story3_1Status,
	--Arc 1 - Story Chapters Unlocks
		['data.story1_1Unlock'] = data.story1_1Unlock,
		['data.story1_2Unlock'] = data.story1_2Unlock,
		['data.story1_3AUnlock'] = data.story1_3AUnlock,
		['data.story1_3BUnlock'] = data.story1_3BUnlock,
		['data.story1_4AUnlock'] = data.story1_4AUnlock,
		['data.story1_4BUnlock'] = data.story1_4BUnlock,
		['data.story1_4CUnlock'] = data.story1_4CUnlock,
		['data.story1_4DUnlock'] = data.story1_4DUnlock,
	--Arc 2 - Story Chapters Unlocks
		['data.story2_1Unlock'] = data.story2_1Unlock,
		['data.story2_2Unlock'] = data.story2_2Unlock,
	--Arc 3 - Story Chapters Unlocks
		['data.story3_1Unlock'] = data.story3_1Unlock
	}
	statsDataLUA = f_strSub(statsDataLUA, t_progress)
	local file = io.open("save/stats_sav.lua","w+")
	file:write(statsDataLUA)
	file:close()
end