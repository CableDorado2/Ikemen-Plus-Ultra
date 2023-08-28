--;===========================================================
--; INITIAL ACTIONS
--;===========================================================
math.randomseed(os.time())

--Assign Lifebar
loadLifebar('data/screenpack/winmugen/fight.def') --path to lifebar stored in 'saved/data_sav.lua', also adjustable from options

--Debug stuff
loadDebugFont('font/14x14.fnt')
setDebugScript('script/debug.lua')

--Load Common stuff (shared with pause.lua)
require('script.common')

--Loading Text
txt_loading = createTextImg(font1, 0, -1, 'LOADING FILES...', 310, 230)

--;===========================================================
--; LOAD ADDITIONAL SCRIPTS
--;===========================================================
assert(loadfile('script/parser.lua'))()
require('script.options')
require('script.select')
require('script.statistics')
require('script.missions')
require('script.events')
--require('script.adventure')
--require('script.story')

--;===========================================================
--; MAIN MENU SCREENPACK
--;===========================================================
--Buttons Background
titleBG0 = animNew(sysSff, [[
5,1, 0,145, -1
]])
animAddPos(titleBG0, 160, 0)
animSetTile(titleBG0, 1, 1)
animSetWindow(titleBG0, 0, 145, 320, 78)
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

--Optimized Cursor Box
--cursorBox = animNew(sysSff, [[
--3,1, 0,0, -1
--]])
--animSetPos(cursorBox, 80, 20)
--animSetAlpha(cursorBox, 20, 100)
--animUpdate(cursorBox)

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
animAddPos(arrowsU, 252, 170)
animUpdate(arrowsU)
animSetScale(arrowsU, 2, 2)

function f_sysTime() --clock and date features
	--local http = require("socket.http") -- import the socket.http module
	--local body, httpcode, headers = http.request("http://www.google.com") --("time.windows.com")
	--local date = headers.date -- LuaSocket makes all header names lowercase
	--print(date) --> "Mon, 18 Feb 2013 09:03:13 GMT"
	sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
	sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
	--sysTime3 = tonumber(os.date("%m"))
	--Clock
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
	--Date
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

--;===========================================================
--; LOGOS SCREEN
--;===========================================================
function f_mainStart()
	gameTime = os.clock()
	f_storyboard('data/screenpack/logo.def')
	f_storyboard('data/screenpack/intro.def')
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff) --global variable so we can set it also from within select.lua
	--f_howtoplay()
	f_mainTitle()
end

--;===========================================================
--; HOW TO PLAY DEMO
--;===========================================================
function f_howtoplay()
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
	--playVideo(videoHowToPlay)
	f_mainTitle()
end

--;===========================================================
--; TITLE SCREEN
--;===========================================================
--txt_subTitle = createTextImg(font3, 0, 1, 'S-SIZE', 122, 120)
--txt_subTitle = createTextImg(font3, 0, 1, 'PLUS ZEN', 111, 120)
txt_subTitle = createTextImg(font3, 0, 1, 'PLUS ULTRA', 102, 120) --Cool fonts: 3, 5, 6, 9, 10, 11, 12, 20, 21
txt_mainTitle = createTextImg(jgFnt, 2, 0, '-- PRESS START --', 159, 190)
txt_version = createTextImg(font1, 0, -1, 'Dev. Build', 319, 240) --font1, 0, [-1] : [1]= Align text left | [0]= Center Text | [-1]= Align text right
txt_titleFt = createTextImg(font5, 0, 0, '', 156, 240)

function f_mainTitle()
	cmdInput()
	local i = 0
	local t = 0
	playBGM(bgmTitle)
	while true do
		if i == 500 then
		   cmdInput()
		   setGameType(1)
		   data.fadeTitle = f_fadeAnim(32, 'fadein', 'black', fadeSff)
		   runDemo()
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
		textImgSetText(txt_titleFt, 'WELCOME TO SUEHIRO IKEMEN ENGINE')
		f_sysTime()
		if t%60 < 30 then
			textImgDraw(txt_mainTitle)
		end
		t = t >= 60 and 0 or t + 1
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		i = i + 1
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; EXIT MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			exitMenu = exitMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
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
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (exitMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (exitMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			restartEngine = false
			--EXIT
			if exitMenu == 1 then
			    sndPlay(sysSnd, 100, 1)
				f_closeMenu()					
			--RESTART
			elseif exitMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				restartEngine = true
				f_closeMenu()
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
		textImgSetText(txt_titleFt, 'CLOSE OR RESTART ENGINE')	
		f_sysTime()
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLOSE/RESTART SCREEN
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			closeMenu = closeMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
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
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 4 then
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
			    f_playTime()
				if restartEngine == true then
					sszReload()
				end
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
		if restartEngine == true then
			textImgSetText(txt_titleFt, 'THE ENGINE WILL BE RESTARTED')
		else
			textImgSetText(txt_titleFt, 'THE ENGINE WILL BE CLOSED')
		end
		f_sysTime()
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; MAIN MENU
--;===========================================================
txt_gameFt = createTextImg(font5, 0, 1, '', 2, 240) --Text to identify the game mode in menus
txt_mainSelect = createTextImg(jgFnt, 0, 0, '', 159, 13) --Text that appears in character select with the name of the game mode

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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	closeText = 1
	f_menuMusic()
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			playBGM(bgmTitle)
			return
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainMenu = mainMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainMenu = mainMenu + 1
		end
		--mode titles/cursor position calculation
		if mainMenu < 1 then
			mainMenu = #t_mainMenu
			if #t_mainMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_mainMenu-1
			end
		elseif mainMenu > #t_mainMenu then
			mainMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (mainMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainMenu - 1) * 13
		end
		if #t_mainMenu <= 5 then
			maxMainMenu = #t_mainMenu
		elseif mainMenu - cursorPosY > 0 then
			maxMainMenu = mainMenu + 5 - cursorPosY
		else
			maxMainMenu = 5
		end
		--mode selected
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--STORY
			--if mainMenu == 1 then
				--sndPlay(sysSnd, 100, 1)
				--script.story.f_mainStory()
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
			textImgDraw(f_updateTextImg(t_mainMenu[i].id, jgFnt, bank, 0, t_mainMenu[i].text, 159, 142+i*13-moveTxt)) --Text Position
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13) --Position and Size of the selection cursor
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'MAIN MENU')
		textImgDraw(txt_version)
		f_sysTime()
		if maxMainMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_mainMenu > 6 and maxMainMenu < #t_mainMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ARCADE MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			arcadeMenu = arcadeMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			arcadeMenu = arcadeMenu + 1
		end
		if arcadeMenu < 1 then
			arcadeMenu = #t_arcadeMenu
			if #t_arcadeMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_arcadeMenu-1
			end
		elseif arcadeMenu > #t_arcadeMenu then
			arcadeMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (arcadeMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (arcadeMenu - 1) * 13
		end
		if #t_arcadeMenu <= 5 then
			maxArcadeMenu = #t_arcadeMenu
		elseif arcadeMenu - cursorPosY > 0 then
			maxArcadeMenu = arcadeMenu + 5 - cursorPosY
		else
			maxArcadeMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE MODE
			if arcadeMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1 --P1 controls P2 side of the select screen
				data.p2SelectMenu = false --P2 character selection disabled
				data.serviceScreen = true
				data.gameMode = 'arcade' --mode recognized in select screen as 'arcade'
				data.rosterMode = 'arcade' --to record statistics
				textImgSetText(txt_mainSelect, 'ARCADE') --message displayed on top of select screen				
				script.select.f_selectAdvance() --start f_selectAdvance() function from script/select.lua
			--CO-OP MODE
			elseif arcadeMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 2
				data.p2Faces = true
				data.coop = true --P2 fighting on P1 side enabled
				data.serviceScreen = true
				data.gameMode = 'arcade'
				data.rosterMode = 'arcade'
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
			textImgDraw(f_updateTextImg(t_arcadeMenu[i].id, jgFnt, bank, 0, t_arcadeMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)		
		textImgSetText(txt_gameFt, 'ARCADE MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxArcadeMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_arcadeMenu > 6 and maxArcadeMenu < #t_arcadeMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VERSUS MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			vsMenu = vsMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			vsMenu = vsMenu + 1
		end
		if vsMenu < 1 then
			vsMenu = #t_vsMenu
			if #t_vsMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_vsMenu-1
			end
		elseif vsMenu > #t_vsMenu then
			vsMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (vsMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (vsMenu - 1) * 13
		end
		if #t_vsMenu <= 5 then
			maxVSMenu = #t_vsMenu
		elseif vsMenu - cursorPosY > 0 then
			maxVSMenu = vsMenu + 5 - cursorPosY
		else
			maxVSMenu = 5
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
				data.rosterMode = 'versus'
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
				data.rosterMode = 'versus'
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
				--data.rosterMode = 'versus'
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
			textImgDraw(f_updateTextImg(t_vsMenu[i].id, jgFnt, bank, 0, t_vsMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'VERSUS MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxVSMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_vsMenu > 6 and maxVSMenu < #t_vsMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; RANDOM MATCH MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			randomMenu = randomMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			randomMenu = randomMenu + 1
		end
		if randomMenu < 1 then
			randomMenu = #t_randomMenu
			if #t_randomMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_randomMenu-1
			end
		elseif randomMenu > #t_randomMenu then
			randomMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (randomMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (randomMenu - 1) * 13
		end
		if #t_randomMenu <= 5 then
			maxRandomMenu = #t_randomMenu
		elseif randomMenu - cursorPosY > 0 then
			maxRandomMenu = randomMenu + 5 - cursorPosY
		else
			maxRandomMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--P1 VS CPU
			if randomMenu == 1 then
				data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				randomsingleVS()
			--P1 VS P2
			elseif randomMenu == 2 then
				data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				randommultiVS()
			--P1 & P2 VS CPU
			elseif randomMenu == 3 then
				--data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
				--sndPlay(sysSnd, 100, 1)
				f_comingSoon()
				--randomcoopVS()
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
			textImgDraw(f_updateTextImg(t_randomMenu[i].id, jgFnt, bank, 0, t_randomMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'RANDOM MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxRandomMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_randomMenu > 6 and maxRandomMenu < #t_randomMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; PRACTICE MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			practiceMenu = practiceMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			practiceMenu = practiceMenu + 1
		end
		if practiceMenu < 1 then
			practiceMenu = #t_practiceMenu
			if #t_practiceMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_practiceMenu-1
			end
		elseif practiceMenu > #t_practiceMenu then
			practiceMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (practiceMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (practiceMenu - 1) * 13
		end
		if #t_practiceMenu <= 5 then
			maxPracticeMenu = #t_practiceMenu
		elseif practiceMenu - cursorPosY > 0 then
			maxPracticeMenu = practiceMenu + 5 - cursorPosY
		else
			maxPracticeMenu = 5
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
					--data.p2In = 3 --A fusion between data.p2In = 1 and data.p2In = 2 for use only in single free training mode (the enemy can be controlled by Player 2)
					data.p2In = 1
					data.p2Faces = true
					data.versusScreen = false --versus screen disabled
				elseif data.training == 'Fixed' then
					data.p2In = 2
					data.versusScreen = false
					data.p2Char = {t_charAdd['training/sandbag.def']} --predefined P2 character as Sandbag char
				end
				data.gameMode = 'training'
				data.rosterMode = 'training'
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
				data.rosterMode = 'training'
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
				--data.rosterMode = 'training'
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
			textImgDraw(f_updateTextImg(t_practiceMenu[i].id, jgFnt, bank, 0, t_practiceMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'TRAINING MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxPracticeMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_practiceMenu > 6 and maxPracticeMenu < #t_practiceMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CHALLENGES MENU
--;===========================================================
t_challengeMenu = {
	{id = textImgNew(), text = 'SURVIVAL'},
	{id = textImgNew(), text = 'MISSIONS'},
	{id = textImgNew(), text = 'BOSS FIGHT'},
	{id = textImgNew(), text = 'BONUS GAMES'},
	{id = textImgNew(), text = 'TIME ATTACK'},
	{id = textImgNew(), text = 'SUDDEN DEATH'},		
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_challengeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local challengeMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			challengeMenu = challengeMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			challengeMenu = challengeMenu + 1
		end
		if challengeMenu < 1 then
			challengeMenu = #t_challengeMenu
			if #t_challengeMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_challengeMenu-1
			end
		elseif challengeMenu > #t_challengeMenu then
			challengeMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (challengeMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (challengeMenu - 1) * 13
		end
		if #t_challengeMenu <= 5 then
			maxChallengeMenu = #t_challengeMenu
		elseif challengeMenu - cursorPosY > 0 then
			maxChallengeMenu = challengeMenu + 5 - cursorPosY
		else
			maxChallengeMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SURVIVAL
			if challengeMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_survivalMenu()
			--MISSIONS MODE
			elseif challengeMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				script.missions.f_missionMenu()
			--BOSS FIGHT
			elseif challengeMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				f_bossMenu()
			--BONUS GAMES
			elseif challengeMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				f_bonusMenu()
			--TIME ATTACK
			elseif challengeMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_timeMenu()
			--SUDDEN DEATH
			elseif challengeMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				f_suddenMenu()								
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
			textImgDraw(f_updateTextImg(t_challengeMenu[i].id, jgFnt, bank, 0, t_challengeMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'CHALLENGES MODES')
		textImgDraw(txt_version)
		f_sysTime()
		if maxChallengeMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_challengeMenu > 6 and maxChallengeMenu < #t_challengeMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SURVIVAL MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			survivalMenu = survivalMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			survivalMenu = survivalMenu + 1
		end
		if survivalMenu < 1 then
			survivalMenu = #t_survivalMenu
			if #t_survivalMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_survivalMenu-1
			end
		elseif survivalMenu > #t_survivalMenu then
			survivalMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (survivalMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (survivalMenu - 1) * 13
		end
		if #t_survivalMenu <= 5 then
			maxSurvivalMenu = #t_survivalMenu
		elseif survivalMenu - cursorPosY > 0 then
			maxSurvivalMenu = survivalMenu + 5 - cursorPosY
		else
			maxSurvivalMenu = 5
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
				data.rosterMode = 'survival'
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
				data.rosterMode = 'survival'
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
			textImgDraw(f_updateTextImg(t_survivalMenu[i].id, jgFnt, bank, 0, t_survivalMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'SURVIVAL MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxSurvivalMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_survivalMenu > 6 and maxSurvivalMenu < #t_survivalMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BOSS FIGHT MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossMenu = bossMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossMenu = bossMenu + 1
		end
		if bossMenu < 1 then
			bossMenu = #t_bossMenu
			if #t_bossMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_bossMenu-1
			end
		elseif bossMenu > #t_bossMenu then
			bossMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (bossMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bossMenu - 1) * 13
		end
		if #t_bossMenu <= 5 then
			maxBossMenu = #t_bossMenu
		elseif bossMenu - cursorPosY > 0 then
			maxBossMenu = bossMenu + 5 - cursorPosY
		else
			maxBossMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE BOSS
			if bossMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_rushTables() --From Parser.lua
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
			textImgDraw(f_updateTextImg(t_bossMenu[i].id, jgFnt, bank, 0, t_bossMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'BOSS FIGHT MODES')
		textImgDraw(txt_version)
		f_sysTime()
		if maxBossMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_bossMenu > 6 and maxBossMenu < #t_bossMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SINGLE BOSS MENU
--;===========================================================
function f_bossChars()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bossChars = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossChars = bossChars - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossChars = bossChars + 1
		end
		if bossChars < 1 then
			bossChars = #t_bossSingle
			if #t_bossSingle > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_bossSingle-1
			end
		elseif bossChars > #t_bossSingle then
			bossChars = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (bossChars - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bossChars - 1) * 13
		end
		if #t_bossSingle <= 5 then
			maxBossChars = #t_bossSingle
		elseif bossChars - cursorPosY > 0 then
			maxBossChars = bossChars + 5 - cursorPosY
		else
			maxBossChars = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			if bossChars < #t_bossSingle then --This table refers to the one at the end of the parser.lua script
			--BOSS CHAR NAME
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_bossChars[bossChars]}
				data.rosterMode = 'bosssingle'
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
			textImgDraw(f_updateTextImg(t_bossSingle[i].id, jgFnt, bank, 0, t_bossSingle[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'BOSS FIGHT')
		textImgDraw(txt_version)
		f_sysTime()
		if maxBossChars > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_bossSingle > 6 and maxBossChars < #t_bossSingle then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BOSS RUSH MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossrushMenu = bossrushMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossrushMenu = bossrushMenu + 1
		end
		if bossrushMenu < 1 then
			bossrushMenu = #t_bossrushMenu
			if #t_bossrushMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_bossrushMenu-1
			end
		elseif bossrushMenu > #t_bossrushMenu then
			bossrushMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (bossrushMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bossrushMenu - 1) * 13
		end
		if #t_bossrushMenu <= 5 then
			maxBossRushMenu = #t_bossrushMenu
		elseif bossrushMenu - cursorPosY > 0 then
			maxBossRushMenu = bossrushMenu + 5 - cursorPosY
		else
			maxBossRushMenu = 5
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
					data.rosterMode = 'bossrush'
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
					data.rosterMode = 'bossrush'
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
			textImgDraw(f_updateTextImg(t_bossrushMenu[i].id, jgFnt, bank, 0, t_bossrushMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'BOSS RUSH MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxBossRushMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_bossrushMenu > 6 and maxBossRushMenu < #t_bossrushMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BONUS GAMES MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusMenu = bonusMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusMenu = bonusMenu + 1
		end
		if bonusMenu < 1 then
			bonusMenu = #t_bonusMenu
			if #t_bonusMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_bonusMenu-1
			end
		elseif bonusMenu > #t_bonusMenu then
			bonusMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (bonusMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bonusMenu - 1) * 13
		end
		if #t_bonusMenu <= 5 then
			maxBonusMenu = #t_bonusMenu
		elseif bonusMenu - cursorPosY > 0 then
			maxBonusMenu = bonusMenu + 5 - cursorPosY
		else
			maxBonusMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--SINGLE BONUS
			if bonusMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				f_rushTables()
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
			textImgDraw(f_updateTextImg(t_bonusMenu[i].id, jgFnt, bank, 0, t_bonusMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'MINI-GAMES')
		textImgDraw(txt_version)
		f_sysTime()
		if maxBonusMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_bonusMenu > 6 and maxBonusMenu < #t_bonusMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SINGLE BONUS GAMES MENU
--;===========================================================
function f_bonusExtras()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local bonusExtras = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusExtras = bonusExtras - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusExtras = bonusExtras + 1
		end
		if bonusExtras < 1 then
			bonusExtras = #t_bonusExtras
			if #t_bonusExtras > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_bonusExtras-1
			end
		elseif bonusExtras > #t_bonusExtras then
			bonusExtras = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (bonusExtras - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bonusExtras - 1) * 13
		end
		if #t_bonusExtras <= 5 then
			maxBonusExtras = #t_bonusExtras
		elseif bonusExtras - cursorPosY > 0 then
			maxBonusExtras = bonusExtras + 5 - cursorPosY
		else
			maxBonusExtras = 5
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
				data.rosterMode = 'singlebonus'
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
			textImgDraw(f_updateTextImg(t_bonusExtras[i].id, jgFnt, bank, 0, t_bonusExtras[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'BONUS STAGES')
		textImgDraw(txt_version)
		f_sysTime()
		if maxBonusExtras > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_bonusExtras > 6 and maxBonusExtras < #t_bonusExtras then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; BONUS RUSH MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusrushMenu = bonusrushMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusrushMenu = bonusrushMenu + 1
		end
		if bonusrushMenu < 1 then
			bonusrushMenu = #t_bonusrushMenu
			if #t_bonusrushMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_bonusrushMenu-1
			end
		elseif bonusrushMenu > #t_bonusrushMenu then
			bonusrushMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (bonusrushMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (bonusrushMenu - 1) * 13
		end
		if #t_bonusrushMenu <= 5 then
			maxBonusRushMenu = #t_bonusrushMenu
		elseif bonusrushMenu - cursorPosY > 0 then
			maxBonusRushMenu = bonusrushMenu + 5 - cursorPosY
		else
			maxBonusRushMenu = 5
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
					data.rosterMode = 'bonusrush'
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
					data.rosterMode = 'bonusrush'
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
			textImgDraw(f_updateTextImg(t_bonusrushMenu[i].id, jgFnt, bank, 0, t_bonusrushMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'BONUS RUSH MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxBonusRushMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_bonusrushMenu > 6 and maxBonusRushMenu < #t_bonusrushMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TIME ATTACK MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			timeMenu = timeMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			timeMenu = timeMenu + 1
		end
		if timeMenu < 1 then
			timeMenu = #t_timeMenu
			if #t_timeMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_timeMenu-1
			end
		elseif timeMenu > #t_timeMenu then
			timeMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (timeMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (timeMenu - 1) * 13
		end
		if #t_timeMenu <= 5 then
			maxTimeMenu = #t_timeMenu
		elseif timeMenu - cursorPosY > 0 then
			maxTimeMenu = timeMenu + 5 - cursorPosY
		else
			maxTimeMenu = 5
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
				data.gameMode = 'allroster'
				data.rosterMode = 'timeattack'
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
				data.gameMode = 'allroster'
				data.rosterMode = 'timeattack'
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
			textImgDraw(f_updateTextImg(t_timeMenu[i].id, jgFnt, bank, 0, t_timeMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'TIME ATTACK MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxTimeMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_timeMenu > 6 and maxTimeMenu < #t_timeMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SUDDEN DEATH MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			suddenMenu = suddenMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			suddenMenu = suddenMenu + 1
		end
		if suddenMenu < 1 then
			suddenMenu = #t_suddenMenu
			if #t_suddenMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_suddenMenu-1
			end
		elseif suddenMenu > #t_suddenMenu then
			suddenMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (suddenMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (suddenMenu - 1) * 13
		end
		if #t_suddenMenu <= 5 then
			maxSuddenMenu = #t_suddenMenu
		elseif suddenMenu - cursorPosY > 0 then
			maxSuddenMenu = suddenMenu + 5 - cursorPosY
		else
			maxSuddenMenu = 5
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
				data.gameMode = 'allroster'
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
				data.gameMode = 'allroster'
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
			textImgDraw(f_updateTextImg(t_suddenMenu[i].id, jgFnt, bank, 0, t_suddenMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'SUDDEN DEATH MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxSuddenMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_suddenMenu > 6 and maxSuddenMenu < #t_suddenMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ENDLESS MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			allcharsMenu = allcharsMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			allcharsMenu = allcharsMenu + 1
		end
		if allcharsMenu < 1 then
			allcharsMenu = #t_allcharsMenu
			if #t_allcharsMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_allcharsMenu-1
			end
		elseif allcharsMenu > #t_allcharsMenu then
			allcharsMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (allcharsMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (allcharsMenu - 1) * 13
		end
		if #t_allcharsMenu <= 5 then
			maxAllCharsMenu = #t_allcharsMenu
		elseif allcharsMenu - cursorPosY > 0 then
			maxAllCharsMenu = allcharsMenu + 5 - cursorPosY
		else
			maxAllCharsMenu = 5
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
				data.rosterMode = 'endless'
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
				data.rosterMode = 'endless'
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
			textImgDraw(f_updateTextImg(t_allcharsMenu[i].id, jgFnt, bank, 0, t_allcharsMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'INFINITE MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxAllCharsMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_allcharsMenu > 6 and maxAllCharsMenu < #t_allcharsMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WATCH MENU
--;===========================================================
t_watchMenu = {
	{id = textImgNew(), text = 'ONLINE REPLAYS'},
	{id = textImgNew(), text = 'LEADERBOARDS'},
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			watchMenu = watchMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			watchMenu = watchMenu + 1
		end
		if watchMenu < 1 then
			watchMenu = #t_watchMenu
			if #t_watchMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_watchMenu-1
			end
		elseif watchMenu > #t_watchMenu then
			watchMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (watchMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (watchMenu - 1) * 13
		end
		if #t_watchMenu <= 5 then
			maxWatchMenu = #t_watchMenu
		elseif watchMenu - cursorPosY > 0 then
			maxWatchMenu = watchMenu + 5 - cursorPosY
		else
			maxWatchMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ONLINE REPLAYS
			if watchMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
			--Load resolution Data from config.ssz
				local file = io.open("ssz/config.ssz","r")
				s_configSSZ = file:read("*all")
				file:close()
				resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
				resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
				--if (resolutionHeight / 3 * 4) ~= resolutionWidth then --To watch an online replay you need to set a 4:3 Resolution to avoid desync
				--if (resolutionHeight / 10 * 16) ~= resolutionWidth then --To watch an online replay you need to set a 16:10 Resolution to avoid desync
				if (math.floor((resolutionHeight / 9 * 16) + 0.5)) ~= resolutionWidth then
					f_replayWarning() --To watch an online replay you need to set a 16:9 Resolution to avoid desync
				else
					f_mainReplay()
				end
			--LEADERBOARDS
			elseif watchMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				f_comingSoon()
			--STAGE VIEWER
			elseif watchMenu == 3 then
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
			elseif watchMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				sszOpen("saved/screenshots", "") --added via script.ssz
			--STATISTICS
			elseif watchMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				--assert(loadfile('saved/stats_sav.lua'))()
				script.select.f_modeplayTime()
				script.statistics.f_statsMenu()
			--CPU MATCH
			elseif watchMenu == 6 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				data.p2In = 1
				data.aiFight = true --AI = data.difficulty for all characters enabled
				data.stageMenu = true
				data.p2Faces = true
				data.gameMode = 'versus'
				data.rosterMode = 'cpu'
				textImgSetText(txt_mainSelect, 'WATCH MODE')			
				script.select.f_selectSimple()
			--CREDITS
			elseif watchMenu == 7 then
				sndPlay(sysSnd, 100, 1)
				cmdInput()
				local cursorPosY = 0
				local moveTxt = 0
				local playCredits = 1
				f_storyboard('data/screenpack/credits.def')
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
			textImgDraw(f_updateTextImg(t_watchMenu[i].id, jgFnt, bank, 0, t_watchMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'WATCH CONTENT')
		textImgDraw(txt_version)
		f_sysTime()
		if maxWatchMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_watchMenu > 6 and maxWatchMenu < #t_watchMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; EXTRAS MENU
--;===========================================================
t_extrasMenu = {
	{id = textImgNew(), text = 'EVENTS'},
	{id = textImgNew(), text = 'ENDLESS'},
	{id = textImgNew(), text = 'GALLERY'},
	{id = textImgNew(), text = 'SOUND TEST'},
	{id = textImgNew(), text = 'STORYBOARDS'},
	{id = textImgNew(), text = 'CUTSCENES'},
	{id = textImgNew(), text = 'TOWER'},
	{id = textImgNew(), text = 'LEGION'},
	{id = textImgNew(), text = 'TOURNEY'},
	{id = textImgNew(), text = 'ADVENTURE'},
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_extrasMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local extrasMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			extrasMenu = extrasMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			extrasMenu = extrasMenu + 1
		end
		if extrasMenu < 1 then
			extrasMenu = #t_extrasMenu
			if #t_extrasMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_extrasMenu-1
			end
		elseif extrasMenu > #t_extrasMenu then
			extrasMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (extrasMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (extrasMenu - 1) * 13
		end
		if #t_extrasMenu <= 5 then
			maxExtrasMenu = #t_extrasMenu
		elseif extrasMenu - cursorPosY > 0 then
			maxExtrasMenu = extrasMenu + 5 - cursorPosY
		else
			maxExtrasMenu = 5
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
			--GALLERY
			elseif extrasMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				f_galleryMenu()
			--SOUND TEST
			elseif extrasMenu == 4 then
				sndPlay(sysSnd, 100, 1)
				f_songMenu()
			--STORYBOARDS
			elseif extrasMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				f_storyboardMenu()
			--CUTSCENES
			elseif extrasMenu == 6 then
				sndPlay(sysSnd, 100, 1)
				f_videoMenu()
			--TOWER MODE
			elseif extrasMenu == 7 then
				sndPlay(sysSnd, 100, 1)
				--script.select.f_selectTower()
				f_comingSoon()
			--LEGION MODE
			elseif extrasMenu == 8 then
				sndPlay(sysSnd, 100, 1)
				--script.select.f_selectLegion()
				f_comingSoon()
			--TOURNEY MODE
			elseif extrasMenu == 9 then
				sndPlay(sysSnd, 100, 1)
				f_tourneyMenu()
			--ADVENTURE MODE
			elseif extrasMenu == 10 then
				sndPlay(sysSnd, 100, 1)
				--script.adventure.f_mainAdventure()
				f_comingSoon()
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
			textImgDraw(f_updateTextImg(t_extrasMenu[i].id, jgFnt, bank, 0, t_extrasMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'EXTRAS UNLOCKED')
		textImgDraw(txt_version)
		f_sysTime()
		if maxExtrasMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_extrasMenu > 6 and maxExtrasMenu < #t_extrasMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TOURNAMENT MENU (WIP)
--;===========================================================
t_tourneyMenu = {
	{id = textImgNew(), text = 'ROUND OF 16'},
	{id = textImgNew(), text = 'ROUND OF 8'},
	{id = textImgNew(), text = 'ROUND OF 4'},
	{id = textImgNew(), text = 'BACK'},
}

function f_tourneyMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local tourneyMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			tourneyMenu = tourneyMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			tourneyMenu = tourneyMenu + 1
		end
		if tourneyMenu < 1 then
			tourneyMenu = #t_tourneyMenu
			if #t_tourneyMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_tourneyMenu-1
			end
		elseif tourneyMenu > #t_tourneyMenu then
			tourneyMenu = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (tourneyMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (tourneyMenu - 1) * 13
		end
		if #t_tourneyMenu <= 5 then
			maxTourneyMenu = #t_tourneyMenu
		elseif tourneyMenu - cursorPosY > 0 then
			maxTourneyMenu = tourneyMenu + 5 - cursorPosY
		else
			maxTourneyMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--ROUND OF 16
			if tourneyMenu == 1 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				--data.p2In = 1
				--data.p2SelectMenu = false
				--data.gameMode = 'tourney'
				--data.rosterMode = 'tourney'
				--textImgSetText(txt_mainSelect, 'TOURNAMENT MODE')
				script.select.f_selectTourney()
			--QUARTERFINALS
			elseif tourneyMenu == 2 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				--data.p2In = 1
				--data.p2SelectMenu = false
				--data.gameMode = 'tourney'
				--data.rosterMode = 'tourney'
				--textImgSetText(txt_mainSelect, 'TOURNAMENT MODE - QUARTERFINALS')
				script.select.f_selectTourney()
			--SEMIFINALS
			elseif tourneyMenu == 3 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				--data.p2In = 1
				--data.p2SelectMenu = false
				--data.gameMode = 'tourney'
				--data.rosterMode = 'tourney'
				--textImgSetText(txt_mainSelect, 'TOURNAMENT MODE - SEMIFINALS')
				script.select.f_selectTourney()
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_tourneyMenu do
			if i == tourneyMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_tourneyMenu[i].id, jgFnt, bank, 0, t_tourneyMenu[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'TOURNAMENT MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxTourneyMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_tourneyMenu > 6 and maxTourneyMenu < #t_tourneyMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GALLERY SCREENPACK
--;===========================================================
--Left Gallery Arrow
arrowsGL = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(arrowsGL, 264, 220.5)
animUpdate(arrowsGL)
animSetScale(arrowsGL, 0.5, 0.5)

--Right Gallery Arrow
arrowsGR = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(arrowsGR, 312, 220.5)
animUpdate(arrowsGR)
animSetScale(arrowsGR, 0.5, 0.5)

--;===========================================================
--; GALLERY MENU
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

function f_galleryMenu()
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local moveArt = 1 --Start in image 0,0
	galleryList = 0 --Important to avoid errors when read
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) or (commandGetState(p1Cmd, 'holdr') and bufr >= 30)) and moveArt <= 10 then --moveArt <= Number of your Gallery Limit
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 3)
			moveArt = moveArt + 1
		elseif (commandGetState(p1Cmd, 'l') or commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) or (commandGetState(p1Cmd, 'holdl') and bufl >= 30)) and moveArt > 1 then --Keep in image 0,0 when press left until finish
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 3)
			moveArt = moveArt - 1
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		elseif commandGetState(p1Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufu = 0
			bufd = 0
			bufr = 0
			bufl = 0
		end
		galleryList = moveArt --Use menu position to show image in these order
		f_gallery()
		if moveArt > 1 then
			animDraw(arrowsGL)
			animUpdate(arrowsGL)
		end
		if moveArt <= 10 then
			animDraw(arrowsGR)
			animUpdate(arrowsGR)
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SOUND TEST SCREENPACK
--;===========================================================
txt_song = createTextImg(jgFnt, 0, 0, 'SONG SELECT', 159, 13)

--Scrolling background
songBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(songBG0, 160, 0)
animSetTile(songBG0, 1, 1)
animSetColorKey(songBG0, -1)

--Transparent background
songBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(songBG1, 20, 20)
animSetAlpha(songBG1, 20, 100)
animUpdate(songBG1)

--Up Arrow
songUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(songUpArrow, 228, 11)
animUpdate(songUpArrow)
animSetScale(songUpArrow, 0.5, 0.5)

--Down Arrow
songDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(songDownArrow, 228, 231)
animUpdate(songDownArrow)
animSetScale(songDownArrow, 0.5, 0.5)

--;===========================================================
--; SOUND TEST MENU
--;===========================================================
function f_songMenu()
	playBGM(bgmNothing)
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local songMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	t_songList = {} --Create Table
	for file in lfs.dir[[.\\sound\\]] do --Read Dir
		if file:match('^.*(%.)mp3$') then --Filter Files .mp3
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]mp3$', '%1')
		elseif file:match('^.*(%.)MP3$') then --Filter Files .MP3
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]MP3$', '%1')
		elseif file:match('^.*(%.)ogg$') then --Filter Files .ogg
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]ogg$', '%1')
		elseif file:match('^.*(%.)OGG$') then --Filter Files .OGG
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]OGG$', '%1')
		end
	end
	t_songList[#t_songList+1] = {id = '', playlist = '          BACK'} --Add one item to the table Created
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			f_menuMusic()
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if songMenu == #t_songList then
				--BACK
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				f_menuMusic()
				sndPlay(sysSnd, 100, 2)
				break
			else
				--Play Song
				playBGM('sound/' .. t_songList[songMenu].playlist .. '.mp3')
				playBGM('sound/' .. t_songList[songMenu].playlist .. '.ogg')
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
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 14 then
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
		--Draw Menu BG
		animDraw(f_animVelocity(songBG0, -1, -1))
		--Draw Transparent Table BG
		animSetScale(songBG1, 220, maxSongs*15)
		animSetWindow(songBG1, 80,20, 160,210)
		animDraw(songBG1)
		--Draw Title Menu
		textImgDraw(txt_song)
		--Draw Table Cursor
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Text for Table
		for i=1, maxSongs do
			if t_songList[i].playlist:len() > 26 then --If name is too long, shortcut with ...
				songText = string.sub(t_songList[i].playlist, 1, 24)
				songText = tostring(songText .. '...')
			else
				songText = t_songList[i].playlist
			end
			if i > songMenu - cursorPosY then
				t_songList[i].id = createTextImg(font2, 0, 1, songText, 85, 15+i*15-moveTxt)
				textImgDraw(t_songList[i].id)
			end
		end
		--Draw Up Animated Cursor
		if maxSongs > 14 then
			animDraw(songUpArrow)
			animUpdate(songUpArrow)
		end
		--Draw Down Animated Cursor
		if #t_songList > 14 and maxSongs < #t_songList then
			animDraw(songDownArrow)
			animUpdate(songDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CUTSCENES SCREENPACK
--;===========================================================
txt_video = createTextImg(jgFnt, 0, 0, 'CUTSCENE SELECT', 159, 13)

--Scrolling background
videoBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(videoBG0, 160, 0)
animSetTile(videoBG0, 1, 1)
animSetColorKey(videoBG0, -1)

--Transparent background
videoBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(videoBG1, 20, 20)
animSetAlpha(videoBG1, 20, 100)
animUpdate(videoBG1)

--Up Arrow
videoUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(videoUpArrow, 228, 11)
animUpdate(videoUpArrow)
animSetScale(videoUpArrow, 0.5, 0.5)

--Down Arrow
videoDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(videoDownArrow, 228, 231)
animUpdate(videoDownArrow)
animSetScale(videoDownArrow, 0.5, 0.5)

--;===========================================================
--; CUTSCENES MENU
--;===========================================================
function f_videoMenu()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local videoMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	t_videoList = {}
	for file in lfs.dir[[.\\data\\movie\\]] do
		if file:match('^.*(%.)wmv$') then
			row = #t_videoList+1
			t_videoList[row] = {}
			t_videoList[row]['id'] = ''
			t_videoList[row]['playlist'] = file:gsub('^(.*)[%.]wmv$', '%1')
		elseif file:match('^.*(%.)WMV$') then
			row = #t_videoList+1
			t_videoList[row] = {}
			t_videoList[row]['id'] = ''
			t_videoList[row]['playlist'] = file:gsub('^(.*)[%.]WMV$', '%1')
		end
	end
	t_videoList[#t_videoList+1] = {id = '', playlist = '          BACK'}
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if videoMenu == #t_videoList then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			else
				playVideo('data/movie/' .. t_videoList[videoMenu].playlist .. '.wmv')
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
			end
		end
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
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 14 then
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
		animDraw(f_animVelocity(videoBG0, -1, -1))
		animSetScale(videoBG1, 220, maxVideos*15)
		animSetWindow(videoBG1, 80,20, 160,210)
		animDraw(videoBG1)
		textImgDraw(txt_video)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxVideos do
			if t_videoList[i].playlist:len() > 26 then
				VideoText = string.sub(t_videoList[i].playlist, 1, 24)
				VideoText = tostring(VideoText .. '...')
			else
				VideoText = t_videoList[i].playlist
			end
			if i > videoMenu - cursorPosY then
				t_videoList[i].id = createTextImg(font2, 0, 1, VideoText, 85, 15+i*15-moveTxt)
				textImgDraw(t_videoList[i].id)
			end
		end
		if maxVideos > 14 then
			animDraw(videoUpArrow)
			animUpdate(videoUpArrow)
		end
		if #t_videoList > 14 and maxVideos < #t_videoList then
			animDraw(videoDownArrow)
			animUpdate(videoDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; STORYBOARDS SCREENPACK
--;===========================================================
txt_storyboard = createTextImg(jgFnt, 0, 0, 'STORYBOARD SELECT', 159, 13)

--Scrolling background
storyboardBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(storyboardBG0, 160, 0)
animSetTile(storyboardBG0, 1, 1)
animSetColorKey(storyboardBG0, -1)

--Transparent background
storyboardBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(storyboardBG1, 20, 20)
animSetAlpha(storyboardBG1, 20, 100)
animUpdate(storyboardBG1)

--Up Arrow
storyboardUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(storyboardUpArrow, 228, 11)
animUpdate(storyboardUpArrow)
animSetScale(storyboardUpArrow, 0.5, 0.5)

--Down Arrow
storyboardDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(storyboardDownArrow, 228, 231)
animUpdate(storyboardDownArrow)
animSetScale(storyboardDownArrow, 0.5, 0.5)

--;===========================================================
--; STORYBOARDS MENU
--;===========================================================
function f_storyboardMenu()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local storyboardMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	t_storyboardList = {}
	for file in lfs.dir[[.\\data\\storyboards\\]] do
		if file:match('^.*(%.)def$') then
			row = #t_storyboardList+1
			t_storyboardList[row] = {}
			t_storyboardList[row]['id'] = ''
			t_storyboardList[row]['playlist'] = file:gsub('^(.*)[%.]def$', '%1')
		elseif file:match('^.*(%.)DEF$') then
			row = #t_storyboardList+1
			t_storyboardList[row] = {}
			t_storyboardList[row]['id'] = ''
			t_storyboardList[row]['playlist'] = file:gsub('^(.*)[%.]DEF$', '%1')
		end
	end
	t_storyboardList[#t_storyboardList+1] = {id = '', playlist = '          BACK'}
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			if storyboardMenu == #t_storyboardList then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			else
				storyboardFile = ('data/storyboards/' .. t_storyboardList[storyboardMenu].playlist .. '.def')
				cmdInput()
				f_storyboard(storyboardFile)
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
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 14 then
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
		animDraw(f_animVelocity(storyboardBG0, -1, -1))
		animSetScale(storyboardBG1, 220, maxStoryboards*15)
		animSetWindow(storyboardBG1, 80,20, 160,210)
		animDraw(storyboardBG1)
		textImgDraw(txt_storyboard)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))		
		for i=1, maxStoryboards do
			if t_storyboardList[i].playlist:len() > 26 then
				storyboardText = string.sub(t_storyboardList[i].playlist, 1, 24)
				storyboardText = tostring(storyboardText .. '...')
			else
				storyboardText = t_storyboardList[i].playlist
			end
			if i > storyboardMenu - cursorPosY then
				t_storyboardList[i].id = createTextImg(font2, 0, 1, storyboardText, 85, 15+i*15-moveTxt)
				textImgDraw(t_storyboardList[i].id)
			end
		end
		if maxStoryboards > 14 then
			animDraw(storyboardUpArrow)
			animUpdate(storyboardUpArrow)
		end
		if #t_storyboardList > 14 and maxStoryboards < #t_storyboardList then
			animDraw(storyboardDownArrow)
			animUpdate(storyboardDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; REPLAY SCREENPACK
--;===========================================================
txt_replay = createTextImg(jgFnt, 0, 0, 'REPLAY SELECT', 159, 13)

--Scrolling background
replayBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(replayBG0, 160, 0)
animSetTile(replayBG0, 1, 1)
animSetColorKey(replayBG0, -1)

--Transparent background
replayBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(replayBG1, 20, 20)
animSetAlpha(replayBG1, 20, 100)
animUpdate(replayBG1)

--Up Arrow
replayUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(replayUpArrow, 228, 11)
animUpdate(replayUpArrow)
animSetScale(replayUpArrow, 0.5, 0.5)

--Down Arrow
replayDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(replayDownArrow, 228, 231)
animUpdate(replayDownArrow)
animSetScale(replayDownArrow, 0.5, 0.5)

--Replay Title Transparent background
replayMenuBG = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(replayMenuBG, -5.5, 41)
animSetAlpha(replayMenuBG, 20, 100)
animUpdate(replayMenuBG)

--Replay Option background
replayMenuBG2 = animNew(sysSff, [[
250,0, 0,0,
]])
animSetPos(replayMenuBG2, -40, 60)
animUpdate(replayMenuBG2)

--;===========================================================
--; REPLAY MENU
--;===========================================================
t_replayOption = {
	{id = '', text = 'DELETE'}, {id = '', text = 'WATCH'}, {id = '', text = 'RETURN'},
}
for i=1, #t_replayOption do
	t_replayOption[i].id = createTextImg(jgFnt, 0, 1, t_replayOption[i].text, -136+i*140, 172)
end

function f_replayTable()
	t_replayList = {}
	for file in lfs.dir[[.\\saved\\replays\\]] do
		if file:match('^.*(%.)replay$') and not file:match('^data.replay$') then
			row = #t_replayList+1
			t_replayList[row] = {}
			t_replayList[row]['id'] = ''
			t_replayList[row]['playlist'] = file:gsub('^(.*)[%.]replay$', '%1')
		elseif file:match('^.*(%.)REPLAY$') and not file:match('^data.replay$') then
			row = #t_replayList+1
			t_replayList[row] = {}
			t_replayList[row]['id'] = ''
			t_replayList[row]['playlist'] = file:gsub('^(.*)[%.]REPLAY$', '%1')
		end
	end
	t_replayList[#t_replayList+1] = {id = '', playlist = '          BACK'}
end

function f_mainReplay()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local mainReplay = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	netPlayer = 'Host'
	coinSystem = false
	f_replayTable() --Load table
	while true do
		if esc() then
			onlinegame = false --only for identify purposes
			coinSystem = true --only for identify purposes
			--netPlayer = '' Bloquea el acceso al menu de online en offline dejarlo comentado solo para devs
			assert(loadfile('saved/data_sav.lua'))()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay + 1
		elseif btnPalNo(p1Cmd) > 0 then
		--BACK
			if mainReplay == #t_replayList then
				onlinegame = false --only for identify purposes
				coinSystem = true --only for identify purposes
				--netPlayer = '' Bloquea el acceso al menu de online en offline dejarlo comentado solo para devs
				assert(loadfile('saved/data_sav.lua'))()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
		--OPEN REPLAY CONTROL MENU
			else
				sndPlay(sysSnd, 100, 1)
				txt_replayName = createTextImg(jgFnt, 0, 0, ''.. t_replayList[mainReplay].playlist ..'', 159, 51)--Show Replay Selected Name
				local fileSize = lfs.attributes('saved/replays/' .. t_replayList[mainReplay].playlist .. '.replay').size --Size Logic
				local replaySize = (math.floor(((fileSize/1048576) + 0.50)))--Conversion of Bytes to Megabytes
				txt_replaySize = createTextImg(jgFnt, 0, 0, 'SIZE:'.. replaySize .. 'MB', 159, 62)--Show Replay Selected Size
				local replayOption = 2
				cmdInput()
				while true do
					if esc() then
						sndPlay(sysSnd, 100, 2)
						break
					elseif commandGetState(p1Cmd, 'r') then
						sndPlay(sysSnd, 100, 0)
						replayOption = replayOption + 1
					elseif commandGetState(p1Cmd, 'l') then
						sndPlay(sysSnd, 100, 0)
						replayOption = replayOption - 1
					end
					if replayOption < 1 then replayOption = 3 elseif replayOption > 3 then replayOption = 1 end
					if btnPalNo(p1Cmd) > 0 then
					--DELETE SELECTED REPLAY
						if replayOption == 1 then
							sndPlay(sysSnd, 100, 1)
							os.remove('saved/replays/' .. t_replayList[mainReplay].playlist .. '.replay')
							t_replayList = nil --Delete the Table an Idea by Strong FS
							f_replayTable() --Just reload the table with applied changes
							break
					--WATCH SELECTED REPLAY
						elseif replayOption == 2 then
							onlinegame = true --only for identify purposes
							data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
							sndPlay(sysSnd, 100, 1)	
							--Set Default values to prevent desync.
							script.options.f_onlineDefault()
							script.options.f_netsaveCfg()
							enterReplay('saved/replays/' .. t_replayList[mainReplay].playlist .. '.replay')
							synchronize()
							math.randomseed(sszRandom())
							script.options.f_onlineCfg()
							exitNetPlay()
							exitReplay()
							commandBufReset(p1Cmd, 1)
					--RETURN TO REPLAY SELECT MENU
						elseif replayOption == 3 then
							sndPlay(sysSnd, 100, 2)
							break
						end
					end
					animDraw(f_animVelocity(replayBG0, -1, -1))
				--Draw Replay Title
					animSetScale(replayMenuBG, 320, 94)
					animSetWindow(replayMenuBG, 0,20, 320,46)
					animDraw(replayMenuBG)
					textImgDraw(txt_replayName)
					textImgDraw(txt_replaySize)
				--Draw Mini Menu BG
					animDraw(replayMenuBG2)
					animUpdate(replayMenuBG2)
				--Draw Replay Option Text
					for i=1, #t_replayOption do
						if i == replayOption + 0 then -- +0 To start center
							textImgSetBank(t_replayOption[i].id, 5)
						else
							textImgSetBank(t_replayOption[i].id, 0)
						end
						textImgDraw(t_replayOption[i].id)
					end
					animDraw(data.fadeTitle)
					animUpdate(data.fadeTitle)
					cmdInput()
					refresh()
				end
			end
		end
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
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 14 then
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
		animDraw(f_animVelocity(replayBG0, -1, -1))
		animSetScale(replayBG1, 220, maxReplays*15)
		animSetWindow(replayBG1, 80,20, 160,210)
		animDraw(replayBG1)
		textImgDraw(txt_replay)
		--animSetScale(cursorBox, 160,maxReplays*15) --For Optimized Cursor Box
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxReplays do
			if t_replayList[i].playlist:len() > 26 then
				replayText = string.sub(t_replayList[i].playlist, 1, 24)
				replayText = tostring(replayText .. '...')
			else
				replayText = t_replayList[i].playlist
			end
			if i > mainReplay - cursorPosY then
				t_replayList[i].id = createTextImg(font2, 0, 1, replayText, 85, 15+i*15-moveTxt)
				textImgDraw(t_replayList[i].id)
			end
		end
		if maxReplays > 14 then
			animDraw(replayUpArrow)
			animUpdate(replayUpArrow)
		end
		if #t_replayList > 14 and maxReplays < #t_replayList then
			animDraw(replayDownArrow)
			animUpdate(replayDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ONLINE MENU
--;===========================================================
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local cancel = false
	while true do
		if esc() then
			onlinegame = false --only for identify purposes
			assert(loadfile('saved/data_sav.lua'))()
			sndPlay(sysSnd, 100, 2)
			return
		end
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainNetplay = mainNetplay - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainNetplay = mainNetplay + 1
		end
		if mainNetplay < 1 then
			mainNetplay = #t_mainNetplay
			if #t_mainNetplay > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_mainNetplay-1
			end
		elseif mainNetplay > #t_mainNetplay then
			mainNetplay = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (mainNetplay - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainNetplay - 1) * 13
		end
		if #t_mainNetplay <= 5 then
			maxMainNetplay = #t_mainNetplay
		elseif mainNetplay - cursorPosY > 0 then
			maxMainNetplay = mainNetplay + 5 - cursorPosY
		else
			maxMainNetplay = 5
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
				cancel = f_OLDconnect()
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
			textImgDraw(f_updateTextImg(t_mainNetplay[i].id, jgFnt, bank, 0, t_mainNetplay[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'ONLINE MODE')
		textImgDraw(txt_version)
		f_sysTime()
		if maxMainNetplay > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_mainNetplay > 6 and maxMainNetplay < #t_mainNetplay then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		exitNetPlay()
    	exitReplay()		
		cmdInput()
		refresh()		
	end
end

--;===========================================================
--; HOST MENU
--;===========================================================
txt_hosting = createTextImg(jgFnt, 0, 1, '', 22, 228)

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

function f_create()
	cmdInput()
	textImgSetText(txt_hosting, 'Waiting for Player 2... ' .. 'Port: ' .. getListenPort())
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
		textImgDraw(txt_hosting)
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
--; OLD CLIENT/JOIN MENU
--;===========================================================
function f_OLDconnect()
	inputDialogPopup(inputdia, 'To Join enter IP address of your Host')
	while not inputDialogIsDone(inputdia) do
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		refresh()
	end
	sndPlay(sysSnd, 100, 1)
	textImgSetText(txt_connecting, 'Now connecting with Host ' .. inputDialogGetStr(inputdia) .. ' Port: ' .. getListenPort())
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

--;===========================================================
--; CLIENT/JOIN MENU (WIP)
--;===========================================================
txt_client = createTextImg(jgFnt, 0, 0, 'Enter Host\'s IPv4', 155, 90)
txt_bar = createTextImg(opFnt, 0, 0, '|', 160, 128,.5,.5,255,255)
txt_ip = createTextImg(font14, 0, 0, '', 160, 128)
txt_conOption = createTextImg(jgFnt, 0, 0, '', 0, 0)
txt_connecting = createTextImg(jgFnt, 0, 1, '', -40, 228)

function f_connect()
	local ip = ''
	local done = false
	local conSel = 1 -- Ok/Cancel Buttons
	local i = 0
	joinExit = false
	while true do
		if (esc() or (btnPalNo(p1Cmd) > 0 and conSel == 2)) and not done then
			clearInputText()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			joinExit = true
			netPlayer = ''
		elseif not done then
			ip = inputText('num',true)
			if clipboardPaste() then
				if string.match(getClipboardText(),'^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$') then
					setInputText(getClipboardText())				
				else
					sndPlay(sysSnd, 100, 5)
				end
			end
			if ip:match('^%.') then
				ip = ''
				setInputText(ip)
			elseif ip:len() > 15 then
				ip = ip:sub(1,15)
				setInputText(ip)
			elseif ip:match('%.%.+') then
				ip = ip:gsub('%.%.+','.')
				setInputText(ip)
			elseif ip:match('%d%d%d%d+') then
				ip = ip:gsub('(%d%d%d)%d+','%1')
				setInputText(ip)
			elseif ip:match('%d+%.%d+%.%d+%.%d+%.') then
				ip = ip:gsub('(%d+%.%d+%.%d+%.%d+)%.','%1')
				setInputText(ip)
			end
			if commandGetState(p1Cmd, 'l') or commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				conSel = conSel == 1 and 2 or 1
			end
			if (btnPalNo(p1Cmd) > 0 and conSel == 1) then
				if ip:match('^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$') then
					sndPlay(sysSnd, 100, 1)
					enterNetPlay(ip) --Connect to entered IP address
					netPlayer = 'Client'
					done = true
				else
					sndPlay(sysSnd, 100, 5)
				end
			end
		end
		textImgDraw(txt_client)
		textImgSetText(txt_ip,ip)
		textImgDraw(txt_ip)
		textImgSetWindow(txt_bar, 121, 115, 78.5, 12)
		if i%60 < 30 then 
			textImgPosDraw(txt_bar,160+(textImgGetWidth(txt_ip)*0.5)+(textImgGetWidth(txt_ip)>0 and 2 or 0),128)
		end
		for i=1, 2 do
			textImgDraw(f_updateTextImg(txt_conOption, jgFnt, (i == conSel and 1 or 0), 0, (i == 1 and 'ENTER' or 'BACK'), 40+i*80, 162))
		end
		if joinExit == true then
			netPlayer = ''
			return true
		end
		if done == true then
			while not connected() do
				if esc() then
					clearInputText()
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 2)
					netPlayer = ''
					joinExit = true
					return true
				end
				textImgSetText(txt_connecting, 'Now connecting with Host ' .. ip .. 'Port: ' .. getListenPort())
				textImgDraw(txt_connecting)
				animDraw(wirelessBG)
				animUpdate(wirelessBG)
				refresh()
				animDraw(data.fadeTitle)
				animUpdate(data.fadeTitle)
			end
		end
		cmdInput()
		refresh()
	end
	clearInputText()
	return false
end

--;===========================================================
--; HOST ONLINE MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local cancel = false
	while true do
		if esc() or rankedEnd == true then
			sndPlay(sysSnd, 100, 2)
			break
		end
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainHost = mainHost - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainHost = mainHost + 1
		end
		if mainHost < 1 then
			mainHost = #t_mainHost
			if #t_mainHost > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_mainHost-1
			end
		elseif mainHost > #t_mainHost then
			mainHost = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (mainHost - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainHost - 1) * 13
		end
		if #t_mainHost <= 5 then
			maxMainHost = #t_mainHost
		elseif mainHost - cursorPosY > 0 then
			maxMainHost = mainHost + 5 - cursorPosY
		else
			maxMainHost = 5
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
				data.rosterMode = 'versus'
				if data.ftcontrol > 0 then
					textImgSetText(txt_mainSelect, 'ONLINE RANKED VERSUS')
				else
					textImgSetText(txt_mainSelect, 'ONLINE VERSUS')
				end
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
				data.rosterMode = 'training'
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
				data.serviceScreen = true
				data.gameMode = 'arcade'
				data.rosterMode = 'arcade'
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
				data.rosterMode = 'survival'
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
				data.rosterMode = 'endless'
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
					data.rosterMode = 'bossrush'
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
					data.rosterMode = 'bonusrush'
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
				data.gameMode = 'allroster'
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
				data.gameMode = 'allroster'
				data.rosterMode = 'timeattack'
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
			textImgDraw(f_updateTextImg(t_mainHost[i].id, jgFnt, bank, 0, t_mainHost[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'ONLINE MENU')
		textImgDraw(txt_version)
		f_sysTime()
		if maxMainHost > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_mainHost > 6 and maxMainHost < #t_mainHost then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CLIENT/JOIN ONLINE MENU
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
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local cancel = false
	while true do
		if esc() or rankedEnd == true then
			sndPlay(sysSnd, 100, 2)
			break
		end
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainJoin = mainJoin - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainJoin = mainJoin + 1
		end
		if mainJoin < 1 then
			mainJoin = #t_mainJoin
			if #t_mainJoin > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_mainJoin-1
			end
		elseif mainJoin > #t_mainJoin then
			mainJoin = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (mainJoin - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainJoin - 1) * 13
		end
		if #t_mainJoin <= 5 then
			maxMainJoin = #t_mainJoin
		elseif mainJoin - cursorPosY > 0 then
			maxMainJoin = mainJoin + 5 - cursorPosY
		else
			maxMainJoin = 5
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
				data.rosterMode = 'versus'
				if data.ftcontrol > 0 then
					textImgSetText(txt_mainSelect, 'ONLINE RANKED VERSUS')
				else
					textImgSetText(txt_mainSelect, 'ONLINE VERSUS')
				end
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
				data.rosterMode = 'training'
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
				data.serviceScreen = true
				data.gameMode = 'arcade'
				data.rosterMode = 'arcade'
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
				data.rosterMode = 'survival'
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
				data.rosterMode = 'endless'
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
					data.rosterMode = 'bossrush'
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
					data.rosterMode = 'bonusrush'
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
				data.gameMode = 'allroster'
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
				data.gameMode = 'allroster'
				data.rosterMode = 'timeattack'
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
			textImgDraw(f_updateTextImg(t_mainJoin[i].id, jgFnt, bank, 0, t_mainJoin[i].text, 159, 142+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,145+cursorPosY*13, 316,13)
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
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, 'ONLINE MENU')
		textImgDraw(txt_version)
		f_sysTime()
		if maxMainJoin > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_mainJoin > 6 and maxMainJoin < #t_mainJoin then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; UNLOCK INFO SCREEN
--;===========================================================
txt_msgMenu = createTextImg(jgFnt, 0, 1, '', 0, 0) --Text that appears in black screens important message

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
--; NETPLAY INFO SCREEN
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
--; REPLAY INFO SCREEN
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
--; COMING SOON INFO SCREEN
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
--; LOAD STATISTICS DATA
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
		['data.legionmodeCnt'] = data.legionmodeCnt,
		['data.towermodeCnt'] = data.towermodeCnt,
		['data.storymodeCnt'] = data.storymodeCnt,
		['data.tourneymodeCnt'] = data.tourneymodeCnt,
		['data.adventuremodeCnt'] = data.adventuremodeCnt,
		['data.eventsProgress'] = data.eventsProgress,
		['data.missionsProgress'] = data.missionsProgress,
		['data.event1Status'] = data.event1Status,
		['data.mission1Status'] = data.mission1Status,
		['data.mission2Status'] = data.mission2Status,
		['data.mission3Status'] = data.mission3Status
	}
	s_dataLUA = f_strSub(s_dataLUA, t_progress)
	local file = io.open("saved/stats_sav.lua","w+")
	file:write(s_dataLUA)
	file:close()
end

--;===========================================================
--; STATISTICS LOGIC
--;===========================================================
--Time Variable
gameTime = 0

function f_playTime()
	gameTime = os.clock() - gameTime
	data.playTime = (data.playTime + gameTime)
	f_saveProgress()
	assert(loadfile('saved/stats_sav.lua'))()
end

--Progress Variables
data.missionsProgress = 0
data.eventsProgress = 0

--;===========================================================
--; INITIALIZE LOOPS
--;===========================================================
f_mainStart() --Start Menu
