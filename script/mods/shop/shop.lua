local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
sprShop = sffNew("script/mods/shop/shop.sff") --Load shop Sprites
bgmShop = "script/mods/shop/Shop.mp3" --Set Shop Menu BGM
bgmVault = "script/mods/shop/The Vault.ogg" --Set The Vault BGM
--Insert new item to t_mainMenu table loaded by screenpack.lua
table.insert(t_mainMenu,#t_mainMenu-2,{id = textImgNew(), text = "SHOP", gotomenu = "f_shopMenu()"})
--;===========================================================
--; SHOP MENU SCREENPACK DEFINITION
--;=========================================================== 
local txt_shopTitle = createTextImg(jgFnt, 0, 0, "", 72, 13)
local txt_shopCurrency = createTextImg(font14, 0, -1, "", 318, 13)
local txt_shopItemInfo = createTextImg(font2, 0, 0, "", 159, 205)
local txt_shopPriceInfo = createTextImg(font14, 0, -1, "", 316, 173)
local txt_shopQuestion = createTextImg(font14, 0, 0, "Do you want to purchase this content?", 160, 35)
local txt_shopMain = "ITEM SHOP"

--Shorcuts
local txt_shopPurchase = "Purchase"
local txt_shopUnlock = "Unlocks "
local txt_shopSold = "Sold Out"
local txt_shopBalance = "Balance"

local txt_shopCharType = "Character: "
local txt_shopStgType = "Stage: "
local txt_shopBGMType = "BGM: "

local t_tempChars = {
	{id = "Reika Murasame", price = 1500, class = 3},
	{id = "Ryu", 			price = 2000, class = 4},
	{id = "Kyo Kusanagi", 	price = 2000, class = 3},
	{id = "Terry", 			price = 2000, class = 4},
	{id = "Ciel", 			price = 4200, class = 4},
}
t_shopChars = {} --Create Real Table
for i=1, #t_tempChars do
	local pathID = t_tempChars[i].id:lower()
	if t_charDef[pathID] ~= nil then --If this char has been registered, add items
		t_shopChars[i] = {}
		t_shopChars[i]['txtID'] = textImgNew()
		t_shopChars[i]['category'] = "chars"
		t_shopChars[i]['class'] = t_tempChars[i].class
		t_shopChars[i]['info'] = txt_shopUnlock..t_selChars[t_charDef[pathID]+1].displayname
		t_shopChars[i]['id'] = t_tempChars[i].id:lower()
		t_shopChars[i]['price'] = t_tempChars[i].price
		t_shopChars[i]['text'] = t_selChars[t_charDef[pathID]+1].displayname
	else --Ignore items that are not recognized
		
	end
end
if data.debugLog then f_printTable(t_shopChars, "save/debug/t_shopChars.log") end

local t_tempStages = {
	{id = "stages/Mountainside Temple/Temple Entrance Afternoon.def", price = 500},
	{id = "stages/Mountainside Temple/Temple Entrance Dusk.def", 	  price = 500},
	{id = "stages/Mountainside Temple/Temple Entrance Night.def", 	  price = 500},
	{id = "stages/Mountainside Temple/Stairs - 1st Floor.def", 	  	  price = 250},
	{id = "stages/Mountainside Temple/Stairs - 2nd Floor.def", 	  	  price = 250},
	{id = "stages/Mountainside Temple/Stairs - 3rd Floor.def", 	  	  price = 250},
	{id = "stages/Mountainside Temple/Secret Hallway.def", 	  		  price = 1500},
	{id = "stages/Mountainside Temple/Clone Laboratory.def", 	  	  price = 2000},
	{id = "stages/Mountainside Temple/Clone Laboratory 2.def", 	  	  price = 2000},
}
t_shopStages = {}
for i=1, #t_tempStages do
	local pathID = t_tempStages[i].id:lower()
	local dayStr = ""
	if t_stageDef[pathID] ~= nil then --If this stage has been registered, add items
		if t_selStages[t_stageDef[pathID]].daytime then dayStr = t_selStages[t_stageDef[pathID]].daytime end
		t_shopStages[i] = {}
		t_shopStages[i]['txtID'] = textImgNew()
		t_shopStages[i]['category'] = "stages"
		t_shopStages[i]['info'] = txt_shopUnlock..t_selStages[t_stageDef[pathID]].name.." "..dayStr
		t_shopStages[i]['id'] = t_tempStages[i].id:lower()
		t_shopStages[i]['price'] = t_tempStages[i].price
		t_shopStages[i]['text'] = t_selStages[t_stageDef[pathID]].name.." "..dayStr
		
	end
end
if data.debugLog then f_printTable(t_shopStages, "save/debug/t_shopStages.log") end

t_shopBGM = {
	
}

t_shopColors = {
	
}

t_shopTitles = {
	
}

t_shopCards = {
	
}

if stats.shopstock == nil then stats.shopstock = {} end --Create space to sell shop items
function f_setShopStock(t)
	for item=1, #t do
	--Add Category to shop stock
		local category = t[item].category
		if stats.shopstock[category] == nil then stats.shopstock[category] = {} end
	--Add item to shop stock
		local itemname = t[item].id
		if stats.shopstock[category][itemname] == nil then stats.shopstock[category][itemname] = true end
	end
end

t_shopMenu = {
	{text = "Characters", 		items = t_shopChars, 	info = txt_shopPurchase.." Playable Characters!", spr = {2,0}},
	{text = "Costumes",   		items = t_shopColors, 	info = txt_shopPurchase.." Colors for your Characters!", spr = {2,1}},
	{text = "Stages",  			items = t_shopStages, 	info = txt_shopPurchase.." Stages!", spr = {2,2}},
	--{text = "Titles",  			items = t_shopTitles, 	info = txt_shopPurchase.." Battle Titles!"},
	--{text = "Profile Designs",  items = t_shopCards, 	info = txt_shopPurchase.." Profile Card Designs!"},
	{text = "Soundtracks",  	items = t_shopBGM, 		info = txt_shopPurchase.." BGM for your Stages!", spr = {2,3}},
}
for i=1, #t_shopMenu do
	t_shopMenu[i]['txtID'] = textImgNew()
	if #t_shopMenu[i].items ~= 0 then
		f_setShopStock(t_shopMenu[i].items)
	end
end
f_saveStats()

--Info BG
local shopInfoBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetPos(shopInfoBG, -56, 190)
animSetScale(shopInfoBG, 2.9, 0.40)
animSetAlpha(shopInfoBG, 155, 22)
animUpdate(shopInfoBG)

--Item BG
local shopItemBG = animNew(sprIkemen, [[
62,0, 0,0, -1
]])
animSetPos(shopItemBG, 169, 20)
animUpdate(shopItemBG)

--Item Stars Class
local shopCharClass = animNew(sprShop, [[
10,0, 0,0, -1
]])

--The Vault Item Access BG
local shopVaultAccessBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(shopVaultAccessBG, 5, 120)
animUpdate(shopVaultAccessBG)

--The Vault Item Access Art
local shopVaultAccessArt = animNew(sprShop, [[
20,1, 0,0, -1
]])
animSetPos(shopVaultAccessArt, 8, 122)
animSetWindow(shopVaultAccessArt, 0,125, 568,274)
animSetScale(shopVaultAccessArt, 0.255, 0.198)
animUpdate(shopVaultAccessArt)

--Confirm Purchase Window BG
confirmShopBG = animNew(sprIkemen, [[
62,0, 0,0, -1
]])
animSetPos(confirmShopBG, 0, 20)
animSetScale(confirmShopBG, 2.13, 1)
animUpdate(confirmShopBG)

t_confirmShop = {
	{id = textImgNew(), text = "YES"}, --{id = textImgNew(), text = "Purchase with Orbs"},
										--{id = textImgNew(), text = "Purchase with Diamons"},
	{id = textImgNew(), text = "NO"}, --{id = textImgNew(), text = "Cancel Order"},
}

function drawShopInputHints(vault)
	local vault = vault
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	local vaultKeyPos = "99999,99999"
	if vault then
		vaultKeyPos = "70,160"
		f_drawQuickText(txt_btnHint, font6, 0, 0, "The Vault", 80, 125)
	end
	drawInputHintsP1("s",vaultKeyPos,"u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
end

--;===========================================================
--; SHOP MENU (Buy/Unlock features using in-game currency.)
--;===========================================================
function f_shopMenu()
	if not startEn then return end
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	shopMenu = 1
	local function f_resetCursor()
		cursorPosY = 1
		moveTxt = 0
		shopMenu = 1
		if data.debugLog then f_printTable(t_shopMenu, "save/debug/t_shopMenu.log") end
	end
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 10
	f_confirmShopReset()
	local inCategory = false
	local vaultAccess = false
	local t_shopMenuBackup = t_shopMenu
	textImgSetText(txt_shopTitle, txt_shopMain)
	playBGM(bgmShop)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	animSetPos(menuArrowUp, 152, 10)
	animSetPos(menuArrowDown, 152, 172)
	while true do
		if not confirmPurchase then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			--Back
				if inCategory then
					textImgSetText(txt_shopTitle, txt_shopMain)
					f_resetCursor()
					t_shopMenu = t_shopMenuBackup --Restore Menu Items
					sndPlay(sndSys, 100, 2)
					inCategory = false
			--Exit
				else
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
					sndPlay(sndSys, 100, 2)
					f_resetMenuArrowsPos()
					f_menuMusic()
					break
				end
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				shopMenu = shopMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				shopMenu = shopMenu + 1
		--Enter Actions
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			--Main Shop
				if not inCategory then
				--Load Available items
					if #t_shopMenu[shopMenu].items ~= 0 then
						sndPlay(sndSys, 100, 1)
						textImgSetText(txt_shopTitle, t_shopMenu[shopMenu].text:upper()) --Change Title
						t_shopMenu = t_shopMenu[shopMenu].items --Load Category selected items
						f_resetCursor()
						inCategory = true
				--No Items Available
					else
						sndPlay(sndSys, 100, 5)
					end
			--Category Shop
				else
				--Purchase
					if stats.shopstock[t_shopMenu[shopMenu].category][t_shopMenu[shopMenu].id] and stats.coins >= t_shopMenu[shopMenu].price then
						sndPlay(sndSys, 100, 1)
						confirmPurchase = true --Show Confirm Purchase
				--Item Sold Out or No enough Money
					else
						sndPlay(sndSys, 100, 5)
					end
				end
		--???
			elseif vaultAccess and (commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's')) then
				f_theVault()
				playBGM(bgmShop)
			end
		--Cursor position calculation
			if shopMenu < 1 then
				shopMenu = #t_shopMenu
				if #t_shopMenu > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_shopMenu
				end
			elseif shopMenu > #t_shopMenu then
				shopMenu = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (shopMenu - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (shopMenu - 1) * 15
			end	
			if #t_shopMenu <= maxItems then
				maxShop = #t_shopMenu
			elseif shopMenu - cursorPosY > 0 then
				maxShop = shopMenu + maxItems - cursorPosY
			else
				maxShop = maxItems
			end
		end
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Transparent Table BG
		animSetScale(commonTBG, 290, maxShop*15)
		animSetWindow(commonTBG, 0,20, 165,150)
		animDraw(commonTBG)
	--Draw Title Menu
		textImgDraw(txt_shopTitle)
		if not confirmPurchase then
			textImgSetText(txt_shopCurrency, stats.coins.." IKC")
			textImgDraw(txt_shopCurrency)
		--Draw Table Cursor
			animSetWindow(cursorBox, 0,5+cursorPosY*15, 165,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Draw Text for Table
		for i=1, maxShop do
			if i > shopMenu - cursorPosY then
				if t_shopMenu[i].txtID ~= nil then
					textImgDraw(f_updateTextImg(t_shopMenu[i].txtID, font2, 0, 1, t_shopMenu[i].text, 5, 15+i*15-moveTxt))
				end
			end
		end
		animDraw(shopItemBG)
	--Draw Items Stuff
		if inCategory then
			vaultAccess = false
			f_drawShopItemPreview(t_shopMenu[shopMenu].category, t_shopMenu[shopMenu].id, shopMenu)
			if stats.shopstock[t_shopMenu[shopMenu].category][t_shopMenu[shopMenu].id] then
				textImgSetText(txt_shopPriceInfo, t_shopMenu[shopMenu].price.." IKC")
			else
				textImgSetText(txt_shopPriceInfo, "Sold Out")
			end
			textImgDraw(txt_shopPriceInfo)
		else
			f_drawShopItemArtwork(shopMenu)
			vaultAccess = true
		end
	--Vault Access Stuff
		if vaultAccess then
			animDraw(shopVaultAccessBG)
			animDraw(shopVaultAccessArt)
		end
	--Draw Info Text Stuff
		drawShopInputHints(vaultAccess)
		animDraw(shopInfoBG)
		textImgSetText(txt_shopItemInfo, t_shopMenu[shopMenu].info)
		textImgDraw(txt_shopItemInfo)
	--Draw Up Animated Cursor
		if maxShop > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
	--Draw Down Animated Cursor
		if #t_shopMenu > maxItems and maxShop < #t_shopMenu then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		if confirmPurchase then f_confirmPurchase() end --Show Purchase Question
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

function f_drawShopItemArtwork(index)
local img = t_shopMenu[index].spr[1] ..','.. t_shopMenu[index].spr[2].. ', 0,0, -1'
	img = animNew(sprShop, img)
	animSetScale(img, 0.21, 0.21)
	animSetPos(img, 173, 25)
	animUpdate(img)
	animDraw(img)
end

function f_drawShopItemPreview(category, id, itemNo, menu)
	local category = category or nil
	local id = id or nil
	local itemNo = itemNo or nil
	local purchaseMenu = menu or false
	local alphaS = nil
	local alphaD = nil
--Character Preview
	if category == "chars" then
	--During Item Select
		if not purchaseMenu then
			for i=1, 5 do
				if i > t_shopMenu[itemNo].class then
					alphaS = 100
					aphaD = 20
				end
				f_drawQuickSpr(shopCharClass, 142+i*30, 25, 0.07, 0.07, alphaS, alphaD)
			end
			f_drawCharAnim(t_selChars[t_charDef[id]+1], 'p1AnimStand', 242, 160, true)
	--During Purchase Confirm
		else
			f_drawCharAnim(t_selChars[t_charDef[id]+1], 'p1AnimStand', 70, 144, false, 0.75, 0.75)
		end
--Stage Preview
	elseif category == "stages" then
		if not purchaseMenu then
			drawStagePortrait(t_stageDef[id]-1, 172.2, 60, 0.113, 0.113)
		else
			drawStagePortrait(t_stageDef[id]-1, 10, 60, 0.113, 0.113)
		end
	end
end

function f_confirmPurchase()
	cmdInput()
--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sndSys, 100, 0)
		confirmShop = confirmShop - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sndSys, 100, 0)
		confirmShop = confirmShop + 1
	end
	if confirmShop < 1 then
		confirmShop = #t_confirmShop
		if #t_confirmShop > 4 then
			cursorYConfirmShop = 4
		else
			cursorYConfirmShop = #t_confirmShop-1
		end
	elseif confirmShop > #t_confirmShop then
		confirmShop = 1
		cursorYConfirmShop = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorYConfirmShop > 0 then
		cursorYConfirmShop = cursorYConfirmShop - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorYConfirmShop < 4 then
		cursorYConfirmShop = cursorYConfirmShop + 1
	end
	if cursorYConfirmShop == 4 then
		moveTxTConfirmShop = (confirmShop - 5) * 13
	elseif cursorYConfirmShop == 0 then
		moveTxTConfirmShop = (confirmShop - 1) * 13
	end
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(confirmShopBG)
--Draw Title
	textImgDraw(txt_shopQuestion)
--Draw Table Text
	for i=1, #t_confirmShop do
		if i == confirmShop then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_confirmShop[i].id, jgFnt, bank, 0, t_confirmShop[i].text, 239, 80+i*13-moveTxTConfirmShop))
	end
--Draw Cursor
	animSetWindow(cursorBox, 167,83+cursorYConfirmShop*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Content
	f_drawQuickText(txt_shpName, jgFnt, 5, 0, t_shopMenu[shopMenu].text, 160, 50)
	f_drawShopItemPreview(t_shopMenu[shopMenu].category, t_shopMenu[shopMenu].id, shopMenu, true)
--Draw Accounting
	f_drawQuickText(txt_shp1, font2, 0, -1, "Price "..t_shopMenu[shopMenu].price.." IKC", 110, 154)
	f_drawQuickText(txt_shp2, font2, 0, -1, "Balance "..stats.coins.." IKC", 310, 154)
	f_drawQuickText(txt_shp3, font2, 0, -1, "Balance after Purchase "..stats.coins-t_shopMenu[shopMenu].price.." IKC", 310, 173)
--Draw Input Hints Panel
	drawConfirmInputHints()
--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sndSys, 100, 2)
		f_confirmShopReset()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
	--YES
		if confirmShop == 1 then
		--Item Purchased (Save Data)
			sndPlay(sndSys, 200, 3)
			stats.coins = stats.coins - t_shopMenu[shopMenu].price
			stats.shopstock[t_shopMenu[shopMenu].category][t_shopMenu[shopMenu].id] = false --Item Sold out
			f_saveStats()
	--NO
		else
			sndPlay(sndSys, 100, 2)
		end
		f_confirmShopReset()
	end
end

function f_confirmShopReset()
	confirmPurchase = false
	moveTxTConfirmShop = 0
--Cursor pos in NO
	cursorYConfirmShop = 1
	confirmShop = 2
end

--;===========================================================
--; THE VAULT SCREENPACK DEFINITION
--;===========================================================
local txt_vaultTitle = createTextImg(font6, 0, 0, "THE VAULT", 159, 28)
local txt_vaultBar = createTextImg(opFnt, 0, 0, "|", 160, 130, 0.65, 0.65)
local txt_vaultText = createTextImg(font14, 0, 0, "", 160, 117)
local txt_vaultWords = createTextImg(jgFnt, 0, 0, "", 0, 0, 0.9, 0.9)

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
"Who would thought that Ikemen GO had a Plus Version",
"Go beyond, PLUS ULTRA!",
"PlasmoidThunder? he is a misterious cool guy",
"If I could have access to an internet database...",
"CD2 likes Geometry Dash so much that it occurred to him to imitate this screen",
"I am a Legend?", "This is not supposed to be here but yes in the USX Project..",
"I debuted in v1.3 of Ikemen Plus Ultra",
"Is CD2 really planning to make all those changes from the Roadmap?",
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
local vaultBG0 = animNew(sprShop, [[
20,0, 0,0, -1
]])
animSetPos(vaultBG0, 160, 119)
animSetScale(vaultBG0, 0.30, 0.305)
animUpdate(vaultBG0)

--Text Window BG
local vaultWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(vaultWindowBG, 80, 100)
animSetScale(vaultWindowBG, 160, 30)
animSetAlpha(vaultWindowBG, 20, 100)
animUpdate(vaultWindowBG)

--;===========================================================
--; THE VAULT MENU (Insert secret codes to unlock things)
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
	--Draw Menu Title
		textImgDraw(txt_vaultTitle)
	--Draw Text Window BG
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