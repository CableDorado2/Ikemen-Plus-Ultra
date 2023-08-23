
module(..., package.seeall)

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
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'ONLINE MODE')
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
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return
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
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'ONLINE MENU')
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
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return
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
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, 'ONLINE MENU')
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
