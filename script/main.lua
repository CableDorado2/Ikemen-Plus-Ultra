--;===========================================================
--; LIBRARY AND DATA DEFINITION
--;===========================================================
math.randomseed(os.time())
lfs = require('lfs') --load lfs.dll
package.path = package.path..';./lib/ltn12.lua' --load ltn12 lua library
ltn12 = require('ltn12')
--package.path = package.path..';./lib/json.lua' --load json lua library
--json = require('json')
--package.path = package.path..';./lib/dkjson.lua' --load dkjson lua library
--dkjson = require('dkjson')

--Create global space (accessing variables between modules)
data = require('saved.data') --Require function, allows use the content inside in the script said. The begin of the script called need to have this: module(..., package.seeall)

--Load saved variables
assert(loadfile('saved/data_sav.lua'))() --assert loadfile, allows load the content stored in script said. The script must not have any module load.
assert(loadfile('saved/stats_sav.lua'))()

--;===========================================================
--; SCREENPACK DEFINITION
--;===========================================================
--Assign Lifebar
loadLifebar(data.lifebar) --path to lifebar stored in 'saved/data_sav.lua', also adjustable from options

--Debug stuff
loadDebugFont('data/font/14x14.fnt')
setDebugScript('script/debug.lua')	

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
	local randomTrack = {"sound/Random VS/Song 1.mp3", "sound/Random VS/Song 2.mp3", "sound/Random VS/Song 3.mp3"}
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

--Load Common stuff
require('script.common')

--Loading Text
txt_loading = createTextImg(font1, 0, -1, 'LOADING FILES...', 310, 230)

--;===========================================================
--; LOAD ADDITIONAL SCRIPTS
--;===========================================================
require('script.randomtest')
assert(loadfile('script/parser.lua'))()
require('script.options')
require('script.missions')
require('script.events')
require('script.select')
require('script.storyboard')

--;===========================================================
--; MAIN MENU SCREEN DEFINITION
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
animAddPos(wirelessBG, -4.5, 0)
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

--Mission Above Transparent background
missionBG1 = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(missionBG1, 1, 1)
animSetAlpha(missionBG1, 20, 100)
animUpdate(missionBG1)

--;===========================================================
--; MAIN MENU STUFF DEFINITION
--;===========================================================
--txt_subTitle = createTextImg(font3, 0, 1, 'S-SIZE', 122, 120)
--txt_subTitle = createTextImg(font3, 0, 1, 'PLUS ZEN', 111, 120)
txt_subTitle = createTextImg(font3, 0, 1, 'PLUS ULTRA', 102, 120) --Cool fonts: 3, 5, 6, 9, 10, 11, 12, 20, 21
txt_titleFt = createTextImg(font5, 0, 1, '', 2, 240)
txt_titleFt1 = createTextImg(font1, 0, -1, 'v1.2.0', 319, 240)
txt_msgMenu = createTextImg(jgFnt, 0, 1, '', 0, 0) --Text that appears in black screen important message
txt_mainSelect = createTextImg(jgFnt, 0, 0, '', 159, 13) --Text that appears in character select with the name of the game mode



function f_sysTime() --clock and date features
	data.sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
	data.sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
	--data.sysTime3 = tonumber(os.date("%m"))

	if data.clock == 'Standard' then
		txt_titleFt2 = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 314, 8)
	elseif data.clock == 'Full Standard' then
		txt_titleFt2 = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 314, 8)
	elseif data.clock == 'Military' then
		txt_titleFt2 = createTextImg(font12, 0, -1, (os.date("%H:%M")), 314, 8)
	elseif data.clock == 'Full Military' then
		txt_titleFt2 = createTextImg(font12, 0, -1, (os.date("%X")), 314, 8)
	end	
	textImgDraw(txt_titleFt2)
	
	if data.date == 'Type A' then
		txt_titleFt3 = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 50, 8)
	elseif data.date == 'Type B' then
		txt_titleFt3 = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 65, 8)
	elseif data.date == 'Type C' then
		txt_titleFt3 = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 95, 8)
	elseif data.date == 'Type D' then
		txt_titleFt3 = createTextImg(font12, 0, -1, (os.date("%A")), 49, 8)
	elseif data.date == 'Type E' then
		txt_titleFt3 = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 97, 8)
	end	
	textImgDraw(txt_titleFt3)
end

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

--;===========================================================
--; LOAD UNLOCKED CONTENT
--;===========================================================
--Data loading from stats_sav.lua
local file = io.open("saved/stats_sav.lua","r")
s_dataLUA = file:read("*all")
file:close()

function f_saveUnlockData()
	--Data saving to stats_sav.lua
	local t_savesUnlock = {
		['data.arcadeUnlocks'] = data.arcadeUnlocks,
		['data.survivalUnlocks'] = data.survivalUnlocks,
		['data.coins'] = data.coins,
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
	s_dataLUA = f_strSub(s_dataLUA, t_savesUnlock)
	local file = io.open("saved/stats_sav.lua","w+")
	file:write(s_dataLUA)
	file:close()
end

--;===========================================================
--; LOGOS LOOP
--;===========================================================
function f_mainStart()
	script.storyboard.f_storyboard('data/screenpack/logo.def')
	script.storyboard.f_storyboard('data/screenpack/intro.def')
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff) --global variable so we can set it also from within select.lua
	--f_howtoplay()
	f_mainTitle()
end

--;===========================================================
--; HOW TO PLAY LOOP
--;===========================================================
function f_howtoplay()
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
	--playVideo(videoHowToPlay)
	f_mainTitle()
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
		   setGameType(1)
		   script.randomtest.run()
		   f_mainMenu()
		elseif btnPalNo(p1Cmd) > 0 then
		   sndPlay(sysSnd, 100, 1)
		   i = 0
		   f_mainMenu()
		elseif esc() then
			i = 0
			sndPlay(sysSnd, 100, 2)
			f_exitMenu()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, '          WELCOME TO SUEHIRO IKEMEN ENGINE')
		f_sysTime()
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
	--{id = textImgNew(), text = 'STORY'},
	{id = textImgNew(), text = 'ARCADE'},
	{id = textImgNew(), text = 'VERSUS'},
	{id = textImgNew(), text = 'NETPLAY'},
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
	closeText = 1
	f_menuMusic()
	while true do
		if esc() then
			playBGM(bgmTitle)
			return
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
			--STORY
			--if mainMenu == 1 then
				--sndPlay(sysSnd, 100, 1)
				--f_comingSoon()			
			--ARCADE	
			if mainMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_arcadeMenu()
			--VERSUS
			elseif mainMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_vsMenu()
			--NETPLAY
			elseif mainMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				--Data loading from config.ssz
				local file = io.open("ssz/config.ssz","r")
				s_configSSZ = file:read("*all")
				file:close()
				resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
				resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
				--if (resolutionHeight / 3 * 4) ~= resolutionWidth then --To play online you need to set a 4:3 Resolution to avoid desync
				--if (resolutionHeight / 10 * 16) ~= resolutionWidth then --To play online you need to set a 16:10 Resolution to avoid desync
				if (math.floor((resolutionHeight / 9 * 16) + 0.5)) ~= resolutionWidth then --To play online you need to set a 16:9 Resolution to avoid desync
				--Rounding Example
				--local number = 15.57
				--local number2 = 15.23
				--print(math.floor(number + 0.5)) --Result will be = 16
				--print(math.floor(number2 + 0.5)) --Result will be = 15
					f_netWarning()
				else
					f_mainNetplay()
				end
			--PRACTICE
			elseif mainMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				f_practiceMenu()		
			--CHALLENGES
			elseif mainMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_challengeMenu()
			--WATCH
			elseif mainMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				f_watchMenu()
			--EXTRAS
			elseif mainMenu == 7 then
				sndPlay(sysSnd, 100, 1)
				assert(loadfile('saved/stats_sav.lua'))()
				if data.arcadeUnlocks == true then
					f_extrasMenu()
				else
					f_secret()
				end
			--OPTIONS
			elseif mainMenu == 8 then
				sndPlay(sysSnd, 100, 1)
				onlinegame = false --only for identify purposes
				assert(loadfile('saved/data_sav.lua'))()
				script.options.f_mainCfg() --start f_mainCfg() function from script/options.lua
			--EXIT
			elseif mainMenu == 9 then
				sndPlay(sysSnd, 100, 1)
				f_exitMenu()
			--CHECK UPDATES
			else
				sndPlay(sysSnd, 100, 1)	
				webOpen("https://github.com/CableDorado2/Ikemen-Plus-Ultra") --added via script.ssz
			end
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_mainMenu do
			if i == mainMenu then
				bank = 5 --Text Color (0=Nothing, 1=Red, 2=Green, 3=Blue, 4=Nothing, 5=Yellow, 6=Pink 7=Shadow, 8=Black, 9=¿?
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainMenu[i].id, jgFnt, bank, 0, t_mainMenu[i].text, 159, 144+i*13-moveTxt)) --Text Position
		end
		animSetWindow(cursorBox, 0,147+cursorPosY*13, 316,13) --Position and Size of the selection cursor
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1)) --Blink rate
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		animDraw(titleBG6)
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'MAIN MENU')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)		
		textImgSetText(txt_titleFt, 'ARCADE MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'QUICK MATCH'},
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1 VS P2'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},	
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
			--QUICK VERSUS	
			if vsMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_randomMenu()
			--P1 VS CPU
			elseif vsMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.stageMenu = true
				data.p2Faces = true
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'FREE VERSUS')				
				script.select.f_selectSimple()
			--P1 VS P2
			elseif vsMenu == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setHomeTeam(1) --P1 side considered the home team
				data.p2In = 2 --P2 controls P2 side of the select screen
				data.stageMenu = true --stage selection enabled
				data.p2Faces = true --additional window with P2 select screen small portraits (faces) enabled
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'VERSUS MODE')				
				script.select.f_selectSimple() --start f_selectSimple() function from script/select.lua
			--P1 & P2 VS CPU
			elseif vsMenu == 4 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				f_comingSoon()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'VERSUS MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1 VS P2'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},
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
			--P1 VS CPU
			if randomMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				script.randomtest.singleVersus()
			--P1 VS P2
			elseif randomMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				script.randomtest.multiVersus()
			--P1 & P2 VS CPU
			elseif randomMenu == 3 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				f_comingSoon()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'RANDOM MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1 VS P2'},	
	{id = textImgNew(), text = 'P1&P2 VS CPU'},	
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
				data.stageMenu = true
				data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
				data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
				if data.training == 'Free' then
					data.p2In = 3 --A fusion between data.p2In = 1 and data.p2In = 2 for use only in single free training mode (the enemy can be controlled by Player 2)
					data.p2Faces = true
					data.versusScreen = false --versus screen disabled
				elseif data.training == 'Fixed' then
					data.p2In = 2
					data.versusScreen = false
					data.p2Char = {t_charAdd['training/sandbag.def']} --predefined P2 character as Sandbag char
				end
				data.gameMode = 'training'
				setGameType(2)
				textImgSetText(txt_mainSelect, 'TRAINING MODE')
				script.select.f_selectSimple()
			--MULTIPLAYER MODE
			elseif practiceMenu == 2 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				setRoundTime(-1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.stageMenu = true
				data.versusScreen = false
				data.p2Faces = true
				data.gameMode = 'training'
				setGameType(2)
				textImgSetText(txt_mainSelect, 'MULTIPLAYER TRAINING')
				script.select.f_selectSimple()			
			--CO-OP MODE
			elseif practiceMenu == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				f_comingSoon()
				--setRoundTime(-1)
				--data.p2In = 2
				--data.p2Faces = true
				--data.coop = true
				--data.stageMenu = true
				--data.versusScreen = false
				--data.p2TeamMenu = {mode = 0, chars = 1}
				--data.p3Char = {t_charAdd['training']}
				--data.gameMode = 'training'
				--setGameType(2)
				--textImgSetText(txt_mainSelect, 'COOPERATIVE TRAINING')				
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'TRAINING MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'CHALLENGES')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},	
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'SURVIVAL MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'VS SINGLE BOSS'},
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'BOSS FIGHT')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
			if bossChars < #t_bossSingle then --This table refers to the one at the end of the parser.lua script
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'BOSS FIGHT')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'BOSS RUSH')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'MINI-GAMES')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
			if bonusExtras < #t_bonusExtras then --This table refers to the one at the end of the parser.lua script
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'BONUS STAGES')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},
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
					data.p2TeamMenu = {mode = 0, chars = 1}
					data.versusScreen = false
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'BONUS RUSH')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},	
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'SUDDEN DEATH MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},	
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
				textImgSetText(txt_mainSelect, 'TIME ATTACK')
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
				textImgSetText(txt_mainSelect, 'TIME ATTACK COOPERATIVE')
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'TIME ATTACK MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'P1 VS CPU'},
	{id = textImgNew(), text = 'P1&P2 VS CPU'},	
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'INFINITE MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	{id = textImgNew(), text = 'ONLINE REPLAYS'},
	{id = textImgNew(), text = 'STAGE VIEWER'},
	{id = textImgNew(), text = 'SCREENSHOTS'},
	{id = textImgNew(), text = 'STATISTICS'},
	{id = textImgNew(), text = 'CPU MATCH'},
	{id = textImgNew(), text = 'CREDITS'},
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
			--ONLINE REPLAYS
			if watchMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				--Data loading from config.ssz
				local file = io.open("ssz/config.ssz","r")
				s_configSSZ = file:read("*all")
				file:close()
				resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
				resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
				--if (resolutionHeight / 3 * 4) ~= resolutionWidth then --To watch an online replay you need to set a 4:3 Resolution to avoid desync
				--if (resolutionHeight / 10 * 16) ~= resolutionWidth then --To watch an online replay you need to set a 16:10 Resolution to avoid desync
				if (math.floor((resolutionHeight / 9 * 16) + 0.5)) ~= resolutionWidth then --To watch an online replay you need to set a 16:9 Resolution to avoid desync
					f_replayWarning()
				else
					f_mainReplay()
				end
			--STAGE VIEWER
			elseif watchMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1) --round time disabled
				data.p2In = 2
				data.stageMenu = true
				data.versusScreen = false --versus screen disabled
				data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
				data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
				data.p1Char = {t_charAdd['stage viewer']} --predefined P1 character
				data.p2Char = {t_charAdd['stage viewer']} --predefined P2 character
				data.gameMode = 'stage viewer'
				textImgSetText(txt_mainSelect, 'STAGE VIEWER')
				script.select.f_selectSimple()
			--SCREENSHOTS
			elseif watchMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				sszOpen("saved/screenshots", "") --added via script.ssz
			--STATISTICS
			elseif watchMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				f_statisticsMenu()
			--CPU MATCH
			elseif watchMenu == 5 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.aiFight = true --AI = data.difficulty for all characters enabled
				data.stageMenu = true
				data.p2Faces = true
				data.gameMode = 'versus'
				textImgSetText(txt_mainSelect, 'WATCH MODE')			
				script.select.f_selectSimple()
			--CREDITS
			elseif watchMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				cmdInput()
				local cursorPosY = 0
				local moveTxt = 0
				local playCredits = 1
				script.storyboard.f_storyboard('data/screenpack/credits.def')
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'WATCH CONTENT')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
--; GALLERY LOGIC
--;===========================================================
function f_gallery() --Based on stage preview code
	gallery = ''
	gallery = '0,' .. galleryList-1 .. ', 0,0, 0'
	gallery = animNew(gallerySff, gallery)
	animSetScale(gallery, 0.30, 0.305)
	animSetPos(gallery, 160, 119)
	animUpdate(gallery)
	animDraw(gallery)
	txt_artNumber = createTextImg(font14, 0, 0, ' ' .. galleryList .. '/11', 290, 230) --draw gallery limit numbers text
	textImgDraw(txt_artNumber)
	return gallery
end

--;===========================================================
--; EXTRAS MENU LOOP
--;===========================================================
t_extrasMenu = {
	{id = textImgNew(), text = 'EVENTS'},
	{id = textImgNew(), text = 'ENDLESS'},
	{id = textImgNew(), text = 'MISSIONS'},
	{id = textImgNew(), text = 'TIME TRIALS'},
	{id = textImgNew(), text = 'SOUND TEST'},
	{id = textImgNew(), text = 'STORYBOARDS'},
	{id = textImgNew(), text = 'CUTSCENES'},
	{id = textImgNew(), text = 'GALLERY'},
	{id = textImgNew(), text = 'TOURNEY'},
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
			--EVENTS MODE
			if extrasMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				script.events.f_eventMenu()
			--ENDLESS MODE
			elseif extrasMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_allcharsMenu()	
			--MISSIONS MODE
			elseif extrasMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				script.missions.f_missionMenu()
			--TIME TRIALS
			elseif extrasMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				--f_trialsMenu()
				f_comingSoon()
			--SOUND TEST
			elseif extrasMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_songMenu()
			--STORYBOARDS
			elseif extrasMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				f_storyboardMenu()
			--CUTSCENES
			elseif extrasMenu == 7 then
				sndPlay(sysSnd, 100, 1)
				f_videoMenu()
			--GALLERY
			elseif extrasMenu == 8 then
				data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				local moveArt = 1 --Start in image 0,0
				galleryList = 0 --Important to avoid errors when read
				cmdInput()
				while true do
					if esc() then
						data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 2)
						break				
					elseif (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'd')) and moveArt <= 10 then --moveArt <= Number of your Gallery Limit
						data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 3)
						moveArt = moveArt + 1
					elseif (commandGetState(p1Cmd, 'l') or commandGetState(p1Cmd, 'u')) and moveArt > 1 then --Keep in image 0,0 when press left until finish
						data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 3)
						moveArt = moveArt - 1
					end
					
					galleryList = moveArt --Uses menu position to show image in these order
					f_gallery()
					animDraw(data.fadeTitle)
					animUpdate(data.fadeTitle)
					cmdInput()
					refresh()
				end
			--TOURNEY MODE
			elseif extrasMenu == 9 then
				sndPlay(sysSnd, 100, 1)
				f_tournamentMenu()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'EXTRAS UNLOCKED')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
--; SOUND TEST MENU LOOP
--;===========================================================
txt_song = createTextImg(jgFnt, 0, 0, 'SONG SELECT', 159, 13)

function f_songMenu()
	playBGM(bgmNothing)
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local songMenu = 1
	t_songList = {}
	for file in lfs.dir[[.\\sound\\]] do --Read Dir
		if file:match('^.*(%.)mp3$') or file:match('^.*(%.)MP3$') or file:match('^.*(%.)ogg$') or file:match('^.*(%.)OGG$') then --Filtrar archivos (Solo admite Mp3 y Ogg)
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			if file:match('^.*(%.)mp3$') then
				t_songList[row]['MP3'] = file:gsub('^(.*)[%.]mp3$', '%1')
			elseif file:match('^.*(%.)ogg$') then
				t_songList[row]['MP3'] = file:gsub('^(.*)[%.]ogg$', '%1')
			end	
			--t_songList[row]['MP3'] = file:gsub('^(.*)[%.]mp3$', '%1') --original
		end
	end
	t_songList[#t_songList+1] = {
		id = '', MP3 = '          BACK'
	}
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			f_menuMusic()
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if songMenu == #t_songList then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				f_menuMusic()
				sndPlay(sysSnd, 100, 2)
				break
			else
				--Play Song
				if t_songList[songMenu].MP3 .. '.mp3' then
					playBGM('sound/' .. t_songList[songMenu].MP3 .. '.mp3')
				elseif t_songList[songMenu].MP3 .. '.ogg' then
					playBGM('sound/' .. t_songList[songMenu].MP3 .. '.ogg')
				end
			end
		end
		--Cursor position calculation
		if songMenu < 1 then
			songMenu = #t_songList
			if #t_songList > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_songList
			end
		elseif songMenu > #t_songList then
			songMenu = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (songMenu - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (songMenu - 1) * 15
		end	
		if #t_songList <= 14 then
			maxSongs = #t_songList
		elseif songMenu - cursorPosY > 0 then
			maxSongs = songMenu + 14 - cursorPosY
		else
			maxSongs = 14
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,(#t_songList)*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_song)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxSongs do
			if t_songList[i].MP3:len() > 26 then
				songText = string.sub(t_songList[i].MP3, 1, 24)
				songText = tostring(songText .. '...')
			else
				songText = t_songList[i].MP3
			end
			if i > songMenu - cursorPosY then
				t_songList[i].id = createTextImg(font2, 0, 1, songText, 85, 15+i*15-moveTxt)
				textImgDraw(t_songList[i].id)
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CUTSCENES MENU LOOP
--;===========================================================
txt_video = createTextImg(jgFnt, 0, 0, 'CUTSCENE SELECT', 159, 13)

function f_videoMenu()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local videoMenu = 1
	t_videoList = {}
	for file in lfs.dir[[.\\data\\movie\\]] do --Read Dir
		if file:match('^.*(%.)wmv$') or file:match('^.*(%.)WMV$') then --Filtrar archivos
			row = #t_videoList+1
			t_videoList[row] = {}
			t_videoList[row]['id'] = ''
			t_videoList[row]['replay'] = file:gsub('^(.*)[%.]wmv$', '%1')
		end
	end
	t_videoList[#t_videoList+1] = {
		id = '', replay = '          BACK'
	}
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if videoMenu == #t_videoList then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			else
				--Play Video
				playVideo('data/movie/' .. t_videoList[videoMenu].replay .. '.wmv')
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
			end
		end
		--Cursor position calculation
		if videoMenu < 1 then
			videoMenu = #t_videoList
			if #t_videoList > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_videoList
			end
		elseif videoMenu > #t_videoList then
			videoMenu = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (videoMenu - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (videoMenu - 1) * 15
		end	
		if #t_videoList <= 14 then
			maxVideos = #t_videoList
		elseif videoMenu - cursorPosY > 0 then
			maxVideos = videoMenu + 14 - cursorPosY
		else
			maxVideos = 14
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,(#t_videoList)*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_video)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxVideos do
			if t_videoList[i].replay:len() > 26 then
				VideoText = string.sub(t_videoList[i].replay, 1, 24)
				VideoText = tostring(VideoText .. '...')
			else
				VideoText = t_videoList[i].replay
			end
			if i > videoMenu - cursorPosY then
				t_videoList[i].id = createTextImg(font2, 0, 1, VideoText, 85, 15+i*15-moveTxt)
				textImgDraw(t_videoList[i].id)
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; STORYBOARDS MENU LOOP
--;===========================================================
txt_storyboard = createTextImg(jgFnt, 0, 0, 'STORYBOARD SELECT', 159, 13)

function f_storyboardMenu()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local storyboardMenu = 1
	t_storyboardList = {}
	for file in lfs.dir[[.\\data\\storyboards\\]] do --Read Dir
		if file:match('^.*(%.)def$') or file:match('^.*(%.)DEF$') then --Filtrar archivos
			row = #t_storyboardList+1
			t_storyboardList[row] = {}
			t_storyboardList[row]['id'] = ''
			t_storyboardList[row]['replay'] = file:gsub('^(.*)[%.]def$', '%1')
		end
	end
	t_storyboardList[#t_storyboardList+1] = {
		id = '', replay = '          BACK'
	}
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if storyboardMenu == #t_storyboardList then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			else
				--Play Storyboard
				storyboardFile = ('data/storyboards/' .. t_storyboardList[storyboardMenu].replay .. '.def')
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
			end
		end
		--Cursor position calculation
		if storyboardMenu < 1 then
			storyboardMenu = #t_storyboardList
			if #t_storyboardList > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_storyboardList
			end
		elseif storyboardMenu > #t_storyboardList then
			storyboardMenu = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (storyboardMenu - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (storyboardMenu - 1) * 15
		end	
		if #t_storyboardList <= 14 then
			maxStoryboards = #t_storyboardList
		elseif storyboardMenu - cursorPosY > 0 then
			maxStoryboards = storyboardMenu + 14 - cursorPosY
		else
			maxStoryboards = 14
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,(#t_storyboardList)*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_storyboard)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxStoryboards do
			if t_storyboardList[i].replay:len() > 26 then
				storyboardText = string.sub(t_storyboardList[i].replay, 1, 24)
				storyboardText = tostring(storyboardText .. '...')
			else
				storyboardText = t_storyboardList[i].replay
			end
			if i > storyboardMenu - cursorPosY then
				t_storyboardList[i].id = createTextImg(font2, 0, 1, storyboardText, 85, 15+i*15-moveTxt)
				textImgDraw(t_storyboardList[i].id)
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; REPLAY MENU LOOP
--;===========================================================
txt_replay = createTextImg(jgFnt, 0, 0, 'REPLAY SELECT', 159, 13)

function f_mainReplay()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local mainReplay = 1
	netPlayer = 'Host'
	coinSystem = false
	t_replayList = {}
	for file in lfs.dir[[.\\saved\\replays\\]] do --Read Dir
		if file:match('^.*(%.)replay$') and not file:match('^data.replay$') then --Filtrar archivos
			row = #t_replayList+1
			t_replayList[row] = {}
			t_replayList[row]['id'] = ''
			t_replayList[row]['replay'] = file:gsub('^(.*)[%.]replay$', '%1')
		end
	end
	t_replayList[#t_replayList+1] = {
		id = '', replay = '          BACK'
	}
	while true do
		if esc() then
			onlinegame = false --only for identify purposes
			coinSystem = true --only for identify purposes
			assert(loadfile('saved/data_sav.lua'))()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if mainReplay == #t_replayList then
				onlinegame = false --only for identify purposes
				coinSystem = true --only for identify purposes
				assert(loadfile('saved/data_sav.lua'))()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			else
				onlinegame = true --only for identify purposes
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)	
				--Set Default values to prevent desync.
				script.options.f_onlineDefault()
				script.options.f_netsaveCfg()
				enterReplay('saved/replays/' .. t_replayList[mainReplay].replay .. '.replay')
				synchronize()
				math.randomseed(sszRandom())
				script.options.f_onlineCfg()
				exitNetPlay()
    			exitReplay()
				commandBufReset(p1Cmd, 1)
			end
		end
		--Cursor position calculation
		if mainReplay < 1 then
			mainReplay = #t_replayList
			if #t_replayList > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_replayList
			end
		elseif mainReplay > #t_replayList then
			mainReplay = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (mainReplay - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (mainReplay - 1) * 15
		end	
		if #t_replayList <= 14 then
			maxReplays = #t_replayList
		elseif mainReplay - cursorPosY > 0 then
			maxReplays = mainReplay + 14 - cursorPosY
		else
			maxReplays = 14
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,(#t_replayList)*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_replay)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxReplays do
			if t_replayList[i].replay:len() > 26 then
				replayText = string.sub(t_replayList[i].replay, 1, 24)
				replayText = tostring(replayText .. '...')
			else
				replayText = t_replayList[i].replay
			end
			if i > mainReplay - cursorPosY then
				t_replayList[i].id = createTextImg(font2, 0, 1, replayText, 85, 15+i*15-moveTxt)
				textImgDraw(t_replayList[i].id)
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		--exitNetPlay()
    	--exitReplay()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ONLINE MENU LOOP
--;===========================================================
txt_starting = createTextImg(jgFnt, 0, 1, '', 37, 228)
txt_connecting = createTextImg(jgFnt, 0, 1, '', 10, 228)

t_mainNetplay = {
	{id = textImgNew(), text = 'HOST [CREATE GAME]'},
	{id = textImgNew(), text = 'CLIENT [JOIN A GAME]'},
	{id = textImgNew(), text = 'BACK'},	
}

function f_mainNetplay()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainNetplay = 1
	local cancel = false
	while true do
		if esc() then
			onlinegame = false --only for identify purposes
			assert(loadfile('saved/data_sav.lua'))()
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
				onlinegame = true --only for identify purposes
				script.options.f_onlineDefault()
				script.options.f_netsaveCfg()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				cancel = f_create()
				if not cancel then
					synchronize()
					math.randomseed(sszRandom())
					script.options.f_onlineCfg()
				end
				exitNetPlay()
				exitReplay()
				commandBufReset(p1Cmd, 1)
				ltn12.pump.all(
				  ltn12.source.file(assert(io.open("saved/data.replay", "rb"))),
				  ltn12.sink.file(assert(io.open("saved/replays/" .. os.date("%Y-%m-%d %I-%M%p") .. ".replay", "wb")))
				)
			--CLIENT/JOIN
			elseif mainNetplay == 2 then
				onlinegame = true --only for identify purposes
				script.options.f_onlineDefault()
				script.options.f_netsaveCfg()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				cancel = f_connect()
				if not cancel then
					synchronize()
					math.randomseed(sszRandom())
					script.options.f_onlineCfg()
				end
				exitNetPlay()
				exitReplay()
				commandBufReset(p1Cmd, 1)
				ltn12.pump.all(
				  ltn12.source.file(assert(io.open("saved/data.replay", "rb"))),
				  ltn12.sink.file(assert(io.open("saved/replays/" .. os.date("%Y-%m-%d %I-%M%p") .. ".replay", "wb")))
				)
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				onlinegame = false --only for identify purposes
				assert(loadfile('saved/data_sav.lua'))()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'ONLINE MODE')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.stageMenu = true
				data.versusScreen = true
				data.p2Faces = true
				data.gameMode = 'training'
				setGameType(2)
				textImgSetText(txt_mainSelect, 'ONLINE TRAINING')
				script.select.f_selectSimple()
			--ONLINE ARCADE	
			elseif mainHost == 3 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
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
				textImgSetText(txt_mainSelect, 'ONLINE TIME ATTACK COOPERATIVE')
				script.select.f_selectAdvance()				
			--ONLINE SETTINGS
			elseif mainHost == 10 then
				sndPlay(sysSnd, 100, 1)
				script.options.f_onlineCfg()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'ONLINE MENU')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.stageMenu = true
				data.versusScreen = true
				data.p2Faces = true
				data.gameMode = 'training'
				setGameType(2)
				textImgSetText(txt_mainSelect, 'ONLINE TRAINING')
				script.select.f_selectSimple()
			--ONLINE ARCADE	
			elseif mainJoin == 3 then
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)			
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true
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
				textImgSetText(txt_mainSelect, 'ONLINE TIME ATTACK COOPERATIVE')
				script.select.f_selectAdvance()				
			--ONLINE SETTINGS
			elseif mainJoin == 10 then
				sndPlay(sysSnd, 100, 1)
				script.options.f_onlineCfg()
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'ONLINE MENU')
		textImgDraw(txt_titleFt1)
		f_sysTime()
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
	cmdInput()
	textImgSetText(txt_starting, 'Waiting for Player 2... ' .. getListenPort())
	enterNetPlay(inputDialogGetStr(inputdia))
	netPlayer = 'Host' --For Replay Identify
	--data.p1In = 1
	--f_exitMenu() --Try to Wait client in Training Mode?
	while not connected() do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			netPlayer = ''
			return true		
		end
		textImgDraw(txt_starting)
		cmdInput()
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
	textImgSetText(txt_connecting, 'Now connecting with... ' .. inputDialogGetStr(inputdia) .. ' ' .. getListenPort())
	enterNetPlay(inputDialogGetStr(inputdia))
	netPlayer = 'Client'
	
	while not connected() do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			netPlayer = ''
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

easteregg = animNew(sysSff, [[
666,0, 0,0, -1
]])
animAddPos(easteregg, -10, -5)
animUpdate(easteregg)
animSetScale(easteregg, 1.059, 1.041)


function f_tournamentMenu()
	data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			f_comingSoon()
			break 
		end
		animDraw(easteregg)	
	    animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WARNING LOOP
--;===========================================================
function f_comingSoon()
	local i = 0
	txt = 'THIS FEATURE WILL BE AVAILABLE COMING SOON...'
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			cmdInput()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			break
		end
        i = i + 1
        f_textRender(txt_msgMenu, txt, i, 20, 178, 15, 1.4, 35)
        animDraw(data.fadeTitle)
        animUpdate(data.fadeTitle)
		cmdInput()
        refresh()
    end		
end

--;===========================================================
--; UNLOCK INFO LOOP
--;===========================================================
function f_secret()
	local i = 0
	txt = 'COMPLETE THE ARCADE MODE TO UNLOCK THIS FEATURE!'
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			cmdInput()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			break
		end
        i = i + 1
        f_textRender(txt_msgMenu, txt, i, 20, 178, 15, 1.8, 35)
        animDraw(data.fadeTitle)
        animUpdate(data.fadeTitle)
		cmdInput()
        refresh()
    end		
end

--;===========================================================
--; NETPLAY INFO LOOP
--;===========================================================
function f_netWarning()
	local i = 0
	txt = 'BEFORE TO PLAY ONLINE, SET A 16:9 GAME RESOLUTION TO AVOID DESYNC.'
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			cmdInput()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			break
		end
        i = i + 1
        f_textRender(txt_msgMenu, txt, i, 20, 178, 15, 1, 35)
        animDraw(data.fadeTitle)
        animUpdate(data.fadeTitle)
		cmdInput()
        refresh()
    end		
end

--;===========================================================
--; REPLAY INFO LOOP
--;===========================================================
function f_replayWarning()
	local i = 0
	txt = 'BEFORE TO WATCH AN ONLINE REPLAY, SET A 16:9 GAME RESOLUTION TO AVOID DESYNC.'
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			cmdInput()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			break
		end
        i = i + 1
        f_textRender(txt_msgMenu, txt, i, 20, 178, 15, 1, 35)
        animDraw(data.fadeTitle)
        animUpdate(data.fadeTitle)
		cmdInput()
        refresh()
    end		
end

--;===========================================================
--; EXIT LOOP
--;===========================================================
t_exitMenu = {
	{id = textImgNew(), text = 'CLOSE ENGINE'},
	{id = textImgNew(), text = 'RESTART ENGINE'},
	{id = textImgNew(), text = 'BACK TO MAIN MENU'},
}	
	
function f_exitMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local exitMenu = 1
	while true do
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			exitMenu = exitMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			exitMenu = exitMenu + 1
		end
		if exitMenu < 1 then
			exitMenu = #t_exitMenu
			if #t_exitMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_exitMenu-1
			end
		elseif exitMenu > #t_exitMenu then
			exitMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (exitMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (exitMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			--EXIT
			if exitMenu == 1 then
			    sndPlay(sysSnd, 100, 1)
				f_closeMenu()					
			--RESTART
			elseif exitMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_restartMenu()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_exitMenu do
			if i == exitMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_exitMenu[i].id, jgFnt, bank, 0, t_exitMenu[i].text, 159, 165+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,168+cursorPosY*13, 316,13)
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, '               CLOSE OR RESTART ENGINE')	
		f_sysTime()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLOSE LOOP
--;===========================================================
t_closeMenu = {
	{id = textImgNew(), text = 'YES'},
	{id = textImgNew(), text = 'NO'},
}	
	
function f_closeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local closeMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			closeMenu = closeMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			closeMenu = closeMenu + 1
		end
		if closeMenu < 1 then
			closeMenu = #t_closeMenu
			if #t_closeMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_closeMenu-1
			end
		elseif closeMenu > #t_closeMenu then
			closeMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (closeMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (closeMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			--YES
			if closeMenu == 1 then
			    os.exit()					
			--NO
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_closeMenu do
			if i == closeMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_closeMenu[i].id, jgFnt, bank, 0, t_closeMenu[i].text, 159, 165+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,168+cursorPosY*13, 316,13)
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, '             THE ENGINE WILL BE CLOSED')	
		f_sysTime()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; RESTART LOOP
--;===========================================================
t_restartMenu = {
	{id = textImgNew(), text = 'YES'},
	{id = textImgNew(), text = 'NO'},
}	
	
function f_restartMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local restartMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			restartMenu = restartMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			restartMenu = restartMenu + 1
		end
		if restartMenu < 1 then
			restartMenu = #t_restartMenu
			if #t_restartMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_restartMenu-1
			end
		elseif restartMenu > #t_restartMenu then
			restartMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (restartMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (restartMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			--YES
			if restartMenu == 1 then
			    sszReload()
				os.exit()					
			--NO
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_restartMenu do
			if i == restartMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_restartMenu[i].id, jgFnt, bank, 0, t_restartMenu[i].text, 159, 165+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,168+cursorPosY*13, 316,13)
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
		textImgDraw(txt_subTitle)
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, '           THE ENGINE WILL BE RESTARTED')	
		f_sysTime()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; STATISTICS LOOP
--;===========================================================
t_statisticsMenu = {	
	{id = '', text = 'Collected Coins',    varID = textImgNew(), varText = data.coins},
	{id = '', text = 'Time Played             W.I.P'},
	{id = '', text = 'Favorite Character        W.I.P'},
	{id = '', text = 'Favorite Stage          W.I.P'},
	{id = '', text = 'Preferred Game Mode    W.I.P'},
	--{id = '', text = 'Victories             W.I.P'},
	--{id = '', text = 'Defeats              W.I.P'},
	{id = '', text = '          BACK'},
}
for i=1, #t_statisticsMenu do
	t_statisticsMenu[i].id = createTextImg(font2, 0, 1, t_statisticsMenu[i].text, 85, 15+i*15)
end

function f_statisticsMenu()
	txt_statisticsMenu = createTextImg(jgFnt, 0, 0, '' .. getUserName() .. ' STATISTICS ', 159, 13) --needs to be inside of statistics Menu function, to load a updated data
	cmdInput()
	local statisticsMenu = 1	
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break --return
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			statisticsMenu = statisticsMenu - 1
			if statisticsMenu < 1 then statisticsMenu = #t_statisticsMenu end		
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			statisticsMenu = statisticsMenu + 1
			if statisticsMenu > #t_statisticsMenu then statisticsMenu = 1 end			
		elseif btnPalNo(p1Cmd) > 0 then --To see more statistics details
			--Collected Coins
			if statisticsMenu == 1 then
				--sndPlay(sysSnd, 100, 1)	
			--Time Played
			elseif statisticsMenu == 2 then
				--sndPlay(sysSnd, 100, 1)
			--Favorite Character
			elseif statisticsMenu == 3 then
				--sndPlay(sysSnd, 100, 1)
			--Favorite Stage
			elseif statisticsMenu == 4 then
				--sndPlay(sysSnd, 100, 1)
			--Preferred Game Mode
			elseif statisticsMenu == 5 then
				--sndPlay(sysSnd, 100, 1)
			--Victories
			--elseif statisticsMenu == 6 then
				--sndPlay(sysSnd, 100, 1)
			--Defeats
			--elseif statisticsMenu == 7 then
				--sndPlay(sysSnd, 100, 1)
			--Back
			else
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end			
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_statisticsMenu*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_statisticsMenu)
		if needReload == 1 then
			for i=1, #t_restart do
				textImgDraw(t_restart[i].id)
			end
		end			
		t_statisticsMenu[1].varText = data.coins
		for i=1, #t_statisticsMenu do
			textImgDraw(t_statisticsMenu[i].id)
			if t_statisticsMenu[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_statisticsMenu[i].varID, font2, 0, -1, t_statisticsMenu[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+statisticsMenu*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; INITIALIZE LOOPS
--;===========================================================

f_mainStart() --Start Menu