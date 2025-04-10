﻿sprShop = sffNew("script/mods/shop/shop.sff") --Load shop Sprites
bgmVault = "script/mods/shop/The Vault.ogg" --Set The Vault BGM
--;===========================================================
--; SHOP MENU SCREENPACK DEFINITION
--;===========================================================
--Insert new item to t_mainMenu table loaded by screenpack.lua
table.insert(t_mainMenu,#t_mainMenu-2,{id = textImgNew(), text = "SHOP", gotomenu = "f_theVault()"})
t_shopMenu = {
	{id = textImgNew(), text = "TEST"},
	{id = textImgNew(), text = "???"},
	{id = textImgNew(), text = "???"},
}

--;===========================================================
--; THE VAULT SCREENPACK DEFINITION
--;===========================================================
txt_vaultTitle = createTextImg(font6, 0, 0, "THE VAULT", 159, 28)
txt_vaultBar = createTextImg(opFnt, 0, 0, "|", 160, 130, 0.65, 0.65)
txt_vaultText = createTextImg(font14, 0, 0, "", 160, 117)
txt_vaultWords = createTextImg(jgFnt, 0, 0, "", 0, 0,0.9,0.9)

t_vaultMenu = {
	{id = textImgNew(), text = "BACK"}, {id = textImgNew(), text = "ENTER"},
}
for i=1, #t_vaultMenu do
	t_vaultMenu[i].id = createTextImg(jgFnt, 0, 0, t_vaultMenu[i].text, 56+i*70, 230)
end

function f_getVaultWords()
t_vaultMsg = nil --Reset Table
t_vaultMsg = {
"Don't touch!",
"Just, stop.",
"No one seems to be home.",
"zzzZZZ...",
"Go away!",
"No!",
"It's a secret...",
"Stop it!",
"Not allowed!",
"Nothing to see here...",
'"CD3" is a joke alias of evil CD2.',
"Ready to leave yet?",
"Whenever you're ready...",
"Fine, I can wait.",
"So... what's up?",
"Are you always like this?",
"I mean, what's the point?",
"Let me guess, you're gonna push the button?",
"What a surprise...",
"Don't push the button!",
"I'm gonna stop talking",
"...",
"......",
"GAH!",
"I have heard about you "..data.userName..".",
"Do you know what name of this Ikemen Plus was going to be?",
"It was actually going to be called Ikemen Plus ???",
"Zen is the search for enlightenment",
"SSZ is a programming language written by Suehiro",
"OpenGL? what's that?",
"Who would thought that Ikemen Go had a Plus Version",
"Go beyond, plus ULTRA!",
"PlasmoidThunder? he is one of the greats devs",
"If I could have access to an internet database...",
"CD2 likes Geometry Dash so much that it occurred to him to imitate this screen",
"I am a Legend?", "This is not supposed to be here but yes in the USX Project..",
"I debuted in v1.3 of Ikemen Plus Ultra",
"Is CD2 really planning to make all those changes from it TODO List?",
"Did you know that this guy who programmed me started learning this in 2021?",
"Let's play hangman S- _ _ _ E",
"Let's play hangman U _ _ R _",
"Let's play hangman _ _ N",
"Press Start To Select an Option",
"You can Write below",
"Saquen a CD2 de Latinoamerica JAJAJA, mas bien por estar alli esto surgio",
"Strong FS? is the guy that inspired CD2",
"Greetings! "..data.userName,
data.userName.." Add your messages here."
}
end

function f_getVaultPrize()
t_vaultPrizeMsg = nil --Reset Table
t_vaultPrizeMsg = {
"YES! YOU DID IT. If you go back to Main Menu you might find a surprise 0_0",
"Well, this is a little Minigame to show you what the LUA is capable of",
data.userName.." Add your prize message here!"
}
end

--Background
vaultBG0 = animNew(sprShop, [[
20,0, 0,0, -1
]])
animSetPos(vaultBG0, 160, 119)
animUpdate(vaultBG0)
animSetScale(vaultBG0, 0.30, 0.305)

--Text Window BG
vaultWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(vaultWindowBG, 20, 100)
animSetAlpha(vaultWindowBG, 20, 100)
animUpdate(vaultWindowBG)

--;===========================================================
--; SHOP MENU (Buy/Unlock features using in-game currency.)
--;===========================================================
function f_shopMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local shopMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	f_sideReset()
	f_infoReset()
	while true do
		if not sideScreen and not infoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				shopMenu = shopMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				shopMenu = shopMenu + 1
			end
			if shopMenu < 1 then
				shopMenu = #t_shopMenu
				if #t_shopMenu > 5 then
					cursorPosY = 5
				else
					cursorPosY = #t_shopMenu-1
				end
			elseif shopMenu > #t_shopMenu then
				shopMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 5 then
				moveTxt = (shopMenu - 6) * 13
			elseif cursorPosY == 0 then
				moveTxt = (shopMenu - 1) * 13
			end
			if #t_shopMenu <= 5 then
				maxshopMenu = #t_shopMenu
			elseif shopMenu - cursorPosY > 0 then
				maxshopMenu = shopMenu + 5 - cursorPosY
			else
				maxshopMenu = 5
			end
		--Enter Actions
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sndSys, 100, 1)
				f_gotoFunction(t_shopMenu[shopMenu])
			end
		end
		drawBottomMenuSP()
		for i=1, #t_shopMenu do
			if i == shopMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_shopMenu[i].id, jgFnt, bank, 0, t_shopMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not infoScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if maxshopMenu > 6 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_shopMenu > 6 and maxshopMenu < #t_shopMenu then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		if not infoScreen then drawMenuInputHints() end
		if infoScreen then f_infoMenu() end
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

--;===========================================================
--; THE VAULT MENU (insert secret codes to unlock things)
--;===========================================================
function f_theVault()
	local word = ""
	local vaultMenu = 2
	local i = 0
	local t = 0
	local prize = false
	f_randomWords() --Get Random Words
	vaultExit = false
	cmdInput()
	playBGM(bgmVault)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		--EXIT LOGIC
		if vaultExit == true then
			clearInputText()
			sndPlay(sndSys, 100, 2)
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			f_menuMusic()
			f_unlock(false)
			f_updateUnlocks()
			break
		end
		--MAIN SCREEN
		if esc() then
			vaultExit = true
		elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') then
			sndPlay(sndSys, 100, 0)
			vaultMenu = vaultMenu + 1
		elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') then
			sndPlay(sndSys, 100, 0)
			vaultMenu = vaultMenu - 1
		end
		if vaultMenu < 1 then vaultMenu = 2 elseif vaultMenu > 2 then vaultMenu = 1 end
		word = inputText('',true)
		if clipboardPaste() then
			if string.match(getClipboardText(),'^(.*)') then
				setInputText(getClipboardText())
			else
				sndPlay(sndSys, 100, 5)
			end
		end
		if word:len() > 5 then
			word = word:sub(1,18)
			setInputText(word)
		end
		if word ~= '' and word ~= nil then
			if word:match('^0(%d+)$') then
				word = word:gsub('^0(%d+)$','%1')
				setInputText(word)
			end
		end
		--BUTTON SELECT
		if commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
			--BACK
			if vaultMenu == 1 then
				vaultExit = true
			--ENTER
			elseif vaultMenu == 2 then
				t = 0 --Reset Vault Words Delay Time
				if word ~= '' and word ~= nil then
					vaultKey = (tostring(word))
					if vaultKey == "ultra" or vaultKey == "Ultra" or vaultKey == "ULTRA" then
						sndPlay(sndSys, 100, 1)
						stats.vault = "Ultra"
						f_saveStats()
						prize = true
					elseif vaultKey == "zen" or vaultKey == "Zen" or vaultKey == "ZEN" then
						sndPlay(sndSys, 100, 1)
						stats.vault = "Zen"
						f_saveStats()
						prize = true
					elseif vaultKey == "ssz" or vaultKey == "Ssz" or vaultKey == "SSZ" then
						sndPlay(sndSys, 100, 1)
						stats.vault = "SSZ"
						f_saveStats()
						prize = true
					else
						prize = false
					end
					clearInputText()
				else
					clearInputText()
					prize = false
				end
				if not prize then f_randomWords() else f_prizeWords() end
			end
		end
		--Draw BG
		animDraw(vaultBG0)
		animUpdate(vaultBG0)
		--Draw Menu Title
		textImgDraw(txt_vaultTitle)
		--Draw Text Window BG
		animSetScale(vaultWindowBG, 220, 30)
		animSetWindow(vaultWindowBG, 80,100, 160,30)
		animDraw(vaultWindowBG)
		--Draw Valt Words
		f_textRender(txt_vaultWords, txtRandom, t, 160, 78, 15, 2.5, 45)
		--Draw Text
		textImgSetText(txt_vaultText,word)
		textImgDraw(txt_vaultText)
		if i%60 < 30 then
			textImgPosDraw(txt_vaultBar, 160 +(textImgGetWidth(txt_vaultText)*0.5)+(textImgGetWidth(txt_vaultText)> 0 and 2 or 0), 120)
		end
		--Draw Button Option Text
		for i=1, #t_vaultMenu do
			if i == vaultMenu then
				textImgSetBank(t_vaultMenu[i].id, 5)
			else
				textImgSetBank(t_vaultMenu[i].id, 0)
			end
			textImgDraw(t_vaultMenu[i].id)
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		i = i >= 60 and 0 or i + 1
		t = t + 1
		cmdInput()
		refresh()
	end
	clearInputText()
end

function f_randomWords()
	textImgSetBank(txt_vaultWords,0) --Reset Color after prize word
	f_getVaultWords()
	if data.userName == "Strong FS" or data.userName == "strong fs" or data.userName == "StrongFS" or data.userName == "strongfs" or data.userName == "Strong Fs" or data.userName == "STRONG FS" or data.userName == "STRONGFS" then
		table.insert(t_vaultMsg,1, "Hey Strong! CD2 te manda Saludoss")
		table.insert(t_vaultMsg,2, "Hmmm Strong XD")
	end
	txtRandom = (t_vaultMsg[math.random(1, #t_vaultMsg)])
end

function f_prizeWords()
	textImgSetBank(txt_vaultWords,5) --Set new color when you get the prize
	f_getVaultPrize()
	txtRandom = (t_vaultPrizeMsg[math.random(1, #t_vaultPrizeMsg)])
end