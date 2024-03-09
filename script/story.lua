
module(..., package.seeall)

--;===========================================================
--; STORY SCREENPACK
--;===========================================================
--Scrolling background
storyBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(storyBG0, 160, 0)
animSetTile(storyBG0, 1, 1)
animSetColorKey(storyBG0, -1)

--Below Wood background
woodBG1 = animNew(sysSff, [[
105,0, 0,0,
]])
animSetScale(woodBG1, 1.55, 1.5)
animUpdate(woodBG1)

--Below Bamboo background
bambooBG1 = animNew(sysSff, [[
106,0, 0,0, -1
]])
animSetScale(bambooBG1, 0.72, 0.6)
animUpdate(bambooBG1)

--Lock
padlock = animNew(sysSff, [[
108,0, 0,0,
]])
animAddPos(padlock, 118, 130)
animSetScale(padlock, 0.20, 0.20)
animUpdate(padlock)

--Below Transparent background
--storyBG2 = animNew(sysSff, [[
--3,0, 0,0, -1
--]])
--animSetPos(storyBG2, 156, 94)
--animSetAlpha(storyBG2, 20, 100)
--animUpdate(storyBG2)

--Below Info Window BG
storyBG2 = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(storyBG2, 158, 87)
animUpdate(storyBG2)

--Arc Left Arrow
storyLeftArrow = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(storyLeftArrow, -10, 48)
animUpdate(storyLeftArrow)
animSetScale(storyLeftArrow, 0.6, 0.6)

--Arc Right Arrow
storyRightArrow = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(storyRightArrow, 320, 48)
animUpdate(storyRightArrow)
animSetScale(storyRightArrow, 0.6, 0.6)

--Chapter Up Arrow
storyUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(storyUpArrow, -40, 85)
animUpdate(storyUpArrow)
animSetScale(storyUpArrow, 0.5, 0.5)

--Chapter Down Arrow
storyDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(storyDownArrow, -40, 218)
animUpdate(storyDownArrow)
animSetScale(storyDownArrow, 0.5, 0.5)

--;===========================================================
--; ARC SELECT
--;===========================================================
--Arc Folder Icon
arcFolder = animNew(storySff, [[0,2, 0,0, -1]])

--Unknown Arc Icon
arcUnknown = animNew(storySff, [[0,0, 0,0,]])

--Arc Selected
arcSel = animNew(storySff, [[0,1, 0,0,]])

--Arc 1 Icon (TODO Load from Character SFF)
arc1 = animNew(storySff, [[0,4, 0,0,]])

--Arc 2 Icon
arc2 = animNew(storySff, [[0,5, 0,0,]])

--Arc 3 Icon
arc3 = animNew(storySff, [[0,6, 0,0,]])

--[[Arc Icon
function f_arcPreview()
	arcPreview = ''
	arcPreview = '0,' .. arcList-1 .. ', 0,0, 0'
	arcPreview = animNew(storySff, arcPreview)
	animSetScale(arcPreview, 0.4, 0.25)
	animSetPos(arcPreview, 50, 21)
	animUpdate(arcPreview)
	animDraw(arcPreview)
	return arcPreview
end
]]

t_storySelect = {
	{Name = '',	Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''}, --Add Arc Slot
	{Name = '',	Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''},
	{Name = '', Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''},
	{Name = '', Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''},
	{Name = '', Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''},
	{Name = '', Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''},
	{Name = '', Img = '', Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = ''},
}

--;===========================================================
--; CHAPTER SELECT
--;===========================================================
--Chapter Complete Icon
checkIco = animNew(sysSff, [[104,0, 0,0,]])

checkNA = animNew(sysSff, [[9999,9999, 0,0,]])

--Unknown Chapter Preview
chaptUnknown = animNew(sysSff, [[110,4, 0,0,]])

--Arc 1 - Prologue Preview
chapt0 = animNew(storySff, [[1,0, 0,0,]])

--Arc 1 - Chapter 1 Preview
chapt1 = animNew(storySff, [[1,10, 0,0,]])

--Arc 1 - Chapter 2 Preview
chapt2 = animNew(storySff, [[1,20, 0,0,]])

--Arc 1 - Chapter 3.1 Preview
chapt3_1 = animNew(storySff, [[1,30, 0,0,]])

--Arc 1 - Chapter 3.1 Preview
chapt3_2 = animNew(storySff, [[1,31, 0,0,]])

--Arc 1 - Chapter 4.1 Preview
chapt4_1 = animNew(storySff,
[[
1,40, 0,0, 40
1,41, 0,0, 40
1,42, 0,0, 40
1,43, 0,0, 40
]])

--Arc 1 - Chapter 4.2 Preview
chapt4_2 = animNew(storySff, [[1,44, 0,0,]])

--Arc 1 - Chapter 4.3 Preview
chapt4_3 = animNew(storySff, [[1,45, 0,0,]])

--[[Chapter Preview
function f_chapterPreview()
	chapterPreview = ''
	chapterPreview = '0,' .. chapterList-1 .. ', 0,0, 0'
	chapterPreview = animNew(storySff, chapterPreview)
	animSetScale(chapterPreview, 0.4, 0.25)
	animSetPos(chapterPreview, 50, 21)
	animUpdate(chapterPreview)
	animDraw(chapterPreview)
	return chapterPreview
end
]]

t_arc1 = {
	{Name = '',	Img = '', ID = textImgNew(), Status = ''}, --Add Chapter Slot
	{Name = '',	Img = '', ID = textImgNew(), Status = ''},
	{Name = '', Img = '', ID = textImgNew(), Status = ''},
	{Name = '',	Img = '', ID = textImgNew(), Status = ''},
	{Name = '', Img = '', ID = textImgNew(), Status = ''},
	{Name = '', Img = '', ID = textImgNew(), Status = ''},
	{Name = '',	Img = '', ID = textImgNew(), Status = ''},
	{Name = '', Img = '', ID = textImgNew(), Status = ''},
	{Name = '',	Img = '', ID = textImgNew(), Status = ''},
	{Name = '',	Img = '', ID = textImgNew(), Status = ''},
}

t_arc2 = {
	{Name = '', Img = '', ID = textImgNew(), Status = ''},
}

t_arc3 = {
	{Name = '', Img = '', ID = textImgNew(), Status = ''},
}

t_arcNull = {
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
}
--;===========================================================
--; STORY MENU
--;===========================================================
function f_storyMenu()
	cmdInput()
	local storyMenu = 1
	local cursorPosX = 1
	local moveArc = 0
	local chapterMenu = 1
	local cursorPosY = 1
	local moveChapter = 0
	local t_chapter = nil
	local t = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local lockedStory = false
	--arcList = 0 --Important to avoid errors when read arcPreview
	playBGM(bgmStory)
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
--Load Chapters Progress
	data.story1Progress = data.story1_0Status + data.story1_1Status + data.story1_2Status + data.story1_3AStatus + data.story1_3BStatus + data.story1_4AStatus + data.story1_4BStatus + data.story1_4CStatus
	data.story2Progress = 0
	data.story3Progress = 0
--Arcs Progress Logic
	story1Data = (math.floor((data.story1Progress * 100 / 8) + 0.5)) --The number (8) is the amount of all data.story1Progress
	story2Data = (math.floor((data.story2Progress * 100 / 1) + 0.5))
	story3Data = (math.floor((data.story3Progress * 100 / 1) + 0.5))
--Story Mode Progress Logic
	data.storiesProgress = story1Data + story2Data + story3Data
	storyData = (math.floor((data.storiesProgress / 3) + 0.5)) --The number (3) is the amount of all data.storiesProgress
	txt_storyMenu = createTextImg(font14, 0, -1, 'STORY SELECT:', 188, 13)
	txt_storyProgress = createTextImg(jgFnt, 2, 1, '['..storyData..'%]', 193.5, 13) --needs to be inside of story Menu function, to load story data %
	--BACK
		if esc() or commandGetState(p1Cmd, 'e') then
			f_saveProgress()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			f_menuMusic()
			break
	--Arc Selection
		elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
			t = 0 --Reset Story Info Delay Time
			sndPlay(sysSnd, 100, 3)
			storyMenu = storyMenu - 1
		elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
			t = 0
			sndPlay(sysSnd, 100, 3)
			storyMenu = storyMenu + 1
	--Chapter Selection
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			if lockedStory == false then
				t = 0
				sndPlay(sysSnd, 100, 0)
				chapterMenu = chapterMenu - 1
			end
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			if lockedStory == false then
				t = 0
				sndPlay(sysSnd, 100, 0)
				chapterMenu = chapterMenu + 1
			end
		elseif btnPalNo(p1Cmd) > 0 then
		--SLOT 1
			if storyMenu == 1 and chapterMenu == 1 then f_arc1_prologue()
			--elseif storyMenu == 2 and chapterMenu == 1 and data.story1_1Unlock == true then f_arc2_prologue()
		--SLOT 2
			elseif storyMenu == 1 and chapterMenu == 2 and data.story1_1Unlock == true then f_arc1_chapter1()
		--SLOT 3
			elseif storyMenu == 1 and chapterMenu == 3 and data.story1_2Unlock == true then f_arc1_chapter2()
		--SLOT 4
			elseif storyMenu == 1 and chapterMenu == 4 and data.story1_3AUnlock == true then f_arc1_chapter3_1()
		--SLOT 5
			elseif storyMenu == 1 and chapterMenu == 5 and data.story1_3BUnlock == true then f_arc1_chapter3_2()
		--SLOT 6
			elseif storyMenu == 1 and chapterMenu == 6 and data.story1_4AUnlock == true then f_arc1_chapter4_1()
		--SLOT 7
			elseif storyMenu == 1 and chapterMenu == 7 and data.story1_4BUnlock == true then f_arc1_chapter4_2()
		--SLOT 8
			elseif storyMenu == 1 and chapterMenu == 8 and data.story1_4CUnlock == true then f_arc1_chapter4_3()
		--SLOT 9
			elseif storyMenu == 1 and chapterMenu == 9 then f_storyRosterTest()
		--EMPTY SLOT OR LOCKED CHAPTER
			else
				sndPlay(sysSnd, 100, 5)
			end
		end
	--Arc Cursor position calculation
		if storyMenu < 1 then
			storyMenu = #t_storySelect
			if #t_storySelect > 3 then
				cursorPosX = 3
			else
				cursorPosX = #t_storySelect
			end
		elseif storyMenu > #t_storySelect then
			storyMenu = 1
			cursorPosX = 1
		elseif (commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30)) and cursorPosX > 1 then
			cursorPosX = cursorPosX - 1
		elseif (commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30)) and cursorPosX < 3 then
			cursorPosX = cursorPosX + 1
		end
		if cursorPosX == 3 then
			moveArc = (storyMenu - 3) * 105
		elseif cursorPosX == 1 then
			moveArc = (storyMenu - 1) * 105
		end
		if #t_storySelect <= 3 then
			maxarcs = #t_storySelect
		elseif storyMenu - cursorPosX > 0 then
			maxarcs = storyMenu + 3 - cursorPosX
		else
			maxarcs = 3
		end
	--Arc 1 Menu Settings
		if storyMenu == 1 then
			t_chapter = t_arc1 --Load Arc 1 Slots
			lockedStory = false --This Arc always is unlocked
			t_arc1[1].Name = 'PROLOGUE' --Set Chapters Names
			if data.story1_1Unlock == true then t_arc1[2].Name = 'KIDNAPPING' else t_arc1[2].Name = '???' end
			if data.story1_2Unlock == true then t_arc1[3].Name = 'KILLER MIRROR' else t_arc1[3].Name = '???' end
			if data.story1_3AUnlock == true then t_arc1[4].Name = 'THE ROOF OF TRUTH' else t_arc1[4].Name = '???' end
			if data.story1_3BUnlock == true then t_arc1[5].Name = 'BROKEN SPIRIT' else t_arc1[5].Name = '???' end
			if data.story1_4AUnlock == true then t_arc1[6].Name = 'FOR THE OLD TIMES' else t_arc1[6].Name = '???' end
			if data.story1_4BUnlock == true then t_arc1[7].Name = 'LIFE LESSON' else t_arc1[7].Name = '???' end
			if data.story1_4CUnlock == true then t_arc1[8].Name = 'THE FALL OF A MASTER' else t_arc1[8].Name = '???' end
			t_arc1[9].Name = 'YOUR STORY CHAPTER HERE'
			t_arc1[10].Name = 'YOUR STORY CHAPTER HERE'
	--Arc 2 Menu Settings
		elseif storyMenu == 2 then
			t_chapter = t_arc2
			if data.story1_1Unlock == true then
				lockedStory = false --This Arc needs to be unlocked
				t_arc2[1].Name = 'COMING SOON?'
			else
				lockedStory = true
				t_arc2[1].Name = '???'
			end
	--Arc 3 Menu Settings
		elseif storyMenu == 3 then
			t_chapter = t_arc3
			if data.story1_1Unlock == true then
				lockedStory = false
				t_arc3[1].Name = 'COMING SOON?'
			else
				lockedStory = true
				t_arc3[1].Name = '???'
			end
	--Empty Arc Menu Settings
		else
			t_chapter = t_arcNull
			lockedStory = false
		end
	--Chapter Cursor position calculation
		if lockedStory == false then
			if chapterMenu < 1 then
				chapterMenu = #t_chapter
				if #t_chapter > 6 then
					cursorPosY = 6
				else
					cursorPosY = #t_chapter
				end
			elseif chapterMenu > #t_chapter then
				chapterMenu = 1
				cursorPosY = 1
			elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 6 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 6 then
				moveChapter = (chapterMenu - 6) * 20
			elseif cursorPosY == 1 then
				moveChapter = (chapterMenu - 1) * 20
			end
			if #t_chapter <= 6 then
				maxchapters = #t_chapter
			elseif chapterMenu - cursorPosY > 0 then
				maxchapters = chapterMenu + 6 - cursorPosY
			else
				maxchapters = 6
			end
		end
		animDraw(f_animVelocity(storyBG0, -1, -1))
	--Draw Title Menu
		textImgDraw(txt_storyMenu)
		textImgDraw(txt_storyProgress)
		if lockedStory == false then
		--Draw Chapter Text BG
			--animSetScale(storyBG2, 205, 137)
			--animSetWindow(storyBG2, 156,94, 269,210)
			animDraw(storyBG2)
		--Draw Chapter Wood BG
			animSetPos(woodBG1, -45, 95)
			animDraw(woodBG1)
		--Draw Below Bamboo BG
			animSetPos(bambooBG1, -46, 86)
			animDraw(bambooBG1)
		--Draw Chapter Table Cursor
			animSetWindow(cursorBox, -45,79+cursorPosY*20, 198,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		else
			animSetPos(woodBG1, 50, 95)
			animDraw(woodBG1)
			animSetPos(bambooBG1, 50, 86)
			animDraw(bambooBG1)
			animDraw(padlock)
			animSetWindow(cursorBox, 50,99, 198,112) --198,30
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		--arcList = storyMenu --Uses menu position to show image in these order
		--f_arcPreview() --Show story image preview
	--Set Arc Info
		t_storySelect[1].Name = 'KUNG FU MAN'
		t_storySelect[1].Img = arc1
		if data.story1_1Unlock == true then
			t_storySelect[2].Name = 'KUNG FU GIRL'
			t_storySelect[2].Img = arc2
			t_storySelect[3].Name = 'SUAVE DUDE'
			t_storySelect[3].Img = arc3
		else
			t_storySelect[2].Name = '???'
			t_storySelect[2].Img = arcUnknown
			t_storySelect[3].Name = '???'
			t_storySelect[3].Img = arcUnknown
		end
		t_storySelect[4].Name = 'YOUR ARC HERE'
		t_storySelect[4].Img = arcUnknown
		t_storySelect[5].Name = 'YOUR ARC HERE'
		t_storySelect[5].Img = arcUnknown
		t_storySelect[6].Name = 'YOUR ARC HERE'
		t_storySelect[6].Img = arcUnknown
		t_storySelect[7].Name = 'YOUR ARC HERE'
		t_storySelect[7].Img = arcUnknown
	--Set Arc status
		t_storySelect[1].Status = story1Data..'%'
		t_storySelect[2].Status = story2Data..'%'
		t_storySelect[3].Status = story3Data..'%'
	--Set Arcs Scroll Logic
		for i=1, maxarcs do
			if i > storyMenu - cursorPosX then
				--Draw Arc BG
				animSetPos(t_storySelect[i].File, -95+i*105-moveArc, 20)
				animSetScale(t_storySelect[i].File, 0.05, 0.05)
				animSetAlpha(t_storySelect[i].File, 20, 100)
				animUpdate(t_storySelect[i].File)
				animDraw(t_storySelect[i].File)
				--Draw Arc Preview Image
				animSetPos(t_storySelect[i].Img, -62+i*105-moveArc, 31.5)
				animUpdate(t_storySelect[i].Img)
				animDraw(t_storySelect[i].Img)
				if i == storyMenu then
					bank = 1
				--Draw Arc Sel Cursor
					animSetPos(t_storySelect[i].Sel, -64+i*105-moveArc, 29.5)
					animUpdate(t_storySelect[i].Sel)
					animDraw(t_storySelect[i].Sel)
				else
					bank = 0
				end
			--Draw Text for Arcs Table
				if t_storySelect[i].ID ~= nil then
					textImgDraw(f_updateTextImg(t_storySelect[i].ID, jgFnt, bank, 0, t_storySelect[i].Name, -51+i*105-moveArc, 68,0.85,0.85))
					textImgDraw(f_updateTextImg(t_storySelect[i].ID, font14, 0, 0, t_storySelect[i].Status, -49.2+i*105-moveArc, 80,0.95,0.95))
				end
			end
		end
	--Set Arc 1 - Chapters Info
		if storyMenu == 1 and chapterMenu == 1 then
			if data.story1_0Status == 1 then chaptCheck = checkIco else chaptCheck = checkNA end --Load Check Icon
			chaptPreview = chapt0 --Load Chapter Preview
			txt_storyInfo = "THIS IS THE STORY OF A MAN WHO CHANGED THE VISION OF INDIE FIGHTING GAMES." --Set Chapter Description
		elseif storyMenu == 1 and chapterMenu == 2 then
			if data.story1_1Status == 1 then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_1Unlock == true then --If this chapters is unlocked
				chaptPreview = chapt1
				txt_storyInfo = "KUNG FU MAN ENJOYS A DAY WITH HIS GIRLFRIEND. HOWEVER, SOMEONE UNEXPECTED WILL TAKE HIM ON A VIOLENT ADVENTURE..."
			else --If this chapters is not unlocked
				chaptPreview = chaptUnknown
				txt_storyInfo = "COMPLETE KUNG FU MAN'S PROLOGUE TO UNLOCK THIS CHAPTER!"
			end
		elseif storyMenu == 1 and chapterMenu == 3 then
			if data.story1_2Status == 1 and data.story1_3AUnlock == true and data.story1_3BUnlock == true then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_2Unlock == true then
				chaptPreview = chapt2
				txt_storyInfo = "AFTER FIGHTING HIS WAY THROUGH THE FOREST AGAINST WAVES OF SUAVE'S MINIONS, KUNG FU MAN MANAGES TO REACH MOUNTAINSIDE TEMPLE. BUT SOMEONE VERY SIMILAR TO HIM WAS WAITING FOR HIM..."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "COMPLETE THE PREVIOUS CHAPTER TO UNLOCK THIS ONE."
			end
		elseif storyMenu == 1 and chapterMenu == 4 then
			if data.story1_3AStatus == 1 and data.story1_4AUnlock == true and data.story1_4BUnlock == true then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_3AUnlock == true then
				chaptPreview = chapt3_1
				txt_storyInfo = "AFTER DEFEATING HIS EVIL COPY, KUNG FU MAN HEADS TO THE ROOF OF THE MOUNTAINSIDE TEMPLE TO TAKE OUT SUAVE DUDE BUT HE WILL NOT BE ALONE..."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."
			end
		elseif storyMenu == 1 and chapterMenu == 5 then
			if data.story1_3BStatus == 1 and data.story1_4BUnlock == true and data.story1_4CUnlock == true then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_3BUnlock == true then
				chaptPreview = chapt3_2
				txt_storyInfo = "KUNG FU MAN HAS NOT BEEN STRONG ENOUGH TO DEFEAT HIS CLONE, NOW HE MUST FACE THE CONSEQUENCES OF HIS PAST ACTIONS..."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."
			end
		elseif storyMenu == 1 and chapterMenu == 6 then
			if data.story1_4AStatus == 1 then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_4AUnlock == true then
				chaptPreview = chapt4_1
				txt_storyInfo = "KUNG FU MAN RESCUE HIS GIRLFRIEND BUT ALSO RETURNS TRAINING WITH KUNG FU GIRL!"
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."
			end
		elseif storyMenu == 1 and chapterMenu == 7 then
			if data.story1_4BStatus == 1 then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_4BUnlock == true	then
				chaptPreview = chapt4_2
				txt_storyInfo = "THERE IS NOTHING SADER THAN A MAN WHO HAS LOST HIS LOVE..."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."
			end
		elseif storyMenu == 1 and chapterMenu == 8 then
			if data.story1_4CStatus == 1 then chaptCheck = checkIco else chaptCheck = checkNA end
			if data.story1_4CUnlock == true then
				chaptPreview = chapt4_3
				txt_storyInfo = "A BRUTAL END FOR ELECBYTE'S CHARACTER."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."
			end
	--Set Arc 2 - Chapter Info
		elseif storyMenu == 2 and chapterMenu == 1 then
			chaptCheck = checkNA
			if data.story1_1Unlock == true then
				chaptPreview = chaptUnknown
				txt_storyInfo = "SUPPORT KUNG FU MAN'S STORY TO WORK IN THIS ONE."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "COMPLETE KUNG FU MAN'S PROLOGUE TO UNLOCK THIS STORY!"
			end
	--Set Arc 3 - Chapter Info
		elseif storyMenu == 3 and chapterMenu == 1 then
			chaptCheck = checkNA
			if data.story1_1Unlock == true then
				chaptPreview = chaptUnknown
				txt_storyInfo = "SUPPORT KUNG FU MAN'S STORY TO WORK IN THIS ONE."
			else
				chaptPreview = chaptUnknown
				txt_storyInfo = "COMPLETE KUNG FU MAN'S PROLOGUE TO UNLOCK THIS STORY!"
			end
	--Set Null Arc - Chapter Info
		else
			chaptCheck = checkNA
			chaptPreview = chaptUnknown
			txt_storyInfo = ""
		end
	--Draw Chapter Preview Image
		if lockedStory == false then
			animSetPos(chaptPreview, 161, 91)
			animSetScale(chaptPreview, 0.113, 0.106)
			animUpdate(chaptPreview)
			animDraw(chaptPreview)
		--Draw Chapter Info
			txt_storyText = createTextImg(font6, 0, 1, '', 0, 0,0.65,0.65)
			f_textRender(txt_storyText, txt_storyInfo, t, 160, 160, 15, 1.2, 40)
		--Draw Check Chapter Status Icon
			animSetPos(chaptCheck, 320, 105)
			animSetScale(chaptCheck, 0.4, 0.4)
			animUpdate(chaptCheck)
			animDraw(chaptCheck)
		else
			txt_storyText = createTextImg(font6, 0, 0, '', 0, 0,0.65,0.65)
			f_textRender(txt_storyText, txt_storyInfo, t, 150, 110, 15, 1.5, 40)
		end
	--Set Chapters Scroll Logic
		if lockedStory == false then
			for i=1, maxchapters do
				if i > chapterMenu - cursorPosY then
					if i == chapterMenu then
						bank = 5
					else
						bank = 0
					end
				--Draw Chapter Name
					if t_chapter[i].ID ~= nil then
						textImgDraw(f_updateTextImg(t_chapter[i].ID, jgFnt, bank, 1, t_chapter[i].Name, -36, 89.5+i*20-moveChapter))
					end
				end
			end
		--Draw Up Animated Cursor
			if maxchapters > 6 then
				animDraw(storyUpArrow)
				animUpdate(storyUpArrow)
			end
		--Draw Down Animated Cursor
			if #t_chapter > 6 and maxchapters < #t_chapter then
				animDraw(storyDownArrow)
				animUpdate(storyDownArrow)
			end
		end
		--Draw Left Animated Cursor
		if maxarcs > 3 then
			animDraw(storyLeftArrow)
			animUpdate(storyLeftArrow)
		end
	--Draw Right Animated Cursor
		if #t_storySelect > 3 and maxarcs < #t_storySelect then
			animDraw(storyRightArrow)
			animUpdate(storyRightArrow)
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
		t = t + 1
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ARC 1 FIGHTS
--;===========================================================
function f_arc1_prologue()
	playVideo("movie/KFM-Prologue.wmv") --Play video cutscene
	data.storyNo = '1-0'
	data.story1_1Unlock = true --Unlock next chapter
	f_storyStatus() --Save progress
	f_arc1_chapter1() --Launch next story fight
end

function f_arc1_chapter1()
	playVideo("movie/KFM-Chapter 1.wmv")
	f_default() --Reset settings for the custom fight
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1} --Set P1 Team Mode (0=Single, 1=Simul, 2=Turns)
	data.p1Char = {t_charAdd['kung fu man']} --Set P1 Characters
	data.p1Pal = 1 --Set P1 Character Palette
	--setTeamMode(1, 0, 1) --Set Team Config [Player, teamMode(0..2), numChars(1..4)]??
	data.p2TeamMenu = {mode = 1, chars = 4}
	data.p2Char = {t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def']}
	data.p2Pal = 1
	--setTeamMode(2, 2, 3)
	setRoundTime(-1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stage = {t_stageDef["stages/mountainside temple/hidden path.def"]} --Set stage (needs to be loaded in select.def)
	data.bgm = 'sound/Ultimate Warrior.mp3' --Set Custom Stage Song
	data.rosterMode = 'story'
	data.storyNo = '1-1'
	setGameMode('story')
	setServiceType(4) --You can't lose with this service, basically is a battle where you always win.
	script.select.f_selectStory() --Start Fight with previous settings
	if script.select.winner == 1 then --Only if you win do:
		data.story1_2Unlock = true --Unlock next chapter
		f_storyStatus() --Save progress
		f_arc1_chapter2() --Launch next story fight
	end
end

function f_arc1_chapter2()
	playVideo("movie/KFM-Chapter 2.wmv")
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_charAdd['kung fu man']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd['kung fu man/evil/evil kung fu man.def']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	--data.stage no needed because this chapter will use the auto stage of evil kfm
	data.bgm = 'sound/Killer Mirror.mp3'
	data.rosterMode = 'story'
	data.storyNo = '1-2'
	setGameMode('story')
	script.select.f_selectStory()
	if script.select.winner == 1 then
		data.story1_3AUnlock = true --Unlock Route A
		f_storyStatus()
		f_arc1_chapter3_1()
	elseif script.select.winner == 2 then
		data.story1_3BUnlock = true --Unlock Route B
		f_storyStatus()
		f_arc1_chapter3_2()
	end
end

function f_arc1_chapter3_1()
	playVideo("movie/KFM-Chapter 3-A.wmv")
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 1, chars = 2}
	data.p1Char = {t_charAdd['kung fu man/master/master kung fu man.def'], t_charAdd['kung fu girl']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 1, chars = 4}
	data.p2Char = {t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stage = {t_stageDef["stages/mountainside temple/Suave's Corridor.def"]}
	data.bgm = 'sound/system/opening.mp3'
	data.rosterMode = 'story'
	data.storyNo = '1-3A'
	setGameMode('story')
	script.select.f_selectStory()
	if script.select.winner == 1 then
		data.story1_4AUnlock = true
		f_storyStatus()
		f_arc1_chapter4_1()
	elseif script.select.winner == 2 then
		data.story1_4BUnlock = true
		f_storyStatus()
		f_arc1_chapter4_2()
	end
end

function f_arc1_chapter3_2()
	playVideo("movie/KFM-Chapter 3-B.wmv")
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	remapInput(1, 2) --P1 controls p2 side
	remapInput(2, 1) --P2 controls p1 side
	setCom(2, 0)
	setPlayerSide('p1right') --set Pause Controls if P1 is in Right Side
	data.p1In = 2
	data.p2In = 2
	data.p1TeamMenu = {mode = 2, chars = 3}
	data.p1Char = {t_charAdd['kung fu man/evil/evil kung fu man.def'], t_charAdd['suave dude'], t_charAdd['kung fu girl']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd['kung fu man']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stage = {t_stageDef["stages/mountainside temple/roof night.def"]}
	data.bgm = "sound/Suave's Corridor.mp3"
	data.rosterMode = 'story'
	data.storyNo = '1-3B'
	setGameMode('story')
	script.select.f_selectStory()
	if script.select.winner == 2 then
		data.story1_4BUnlock = true
		f_storyStatus()
		f_arc1_chapter4_2()
	elseif script.select.winner == 1 then
		data.story1_4CUnlock = true
		f_storyStatus()
		f_arc1_chapter4_3()
	end
end

function f_arc1_chapter4_1()
	playVideo("movie/KFM-Chapter 4-A.wmv")
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_charAdd['kung fu man/master/master kung fu man.def']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd['kung fu girl']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stage = {t_stageDef["stages/Sakura.def"]}
	data.rosterMode = 'story'
	data.storyNo = '1-4A'
	setGameMode('story')
	script.select.f_selectStory()
	f_storyStatus()
	f_playCredits() --Go to credits screen
end

function f_arc1_chapter4_2()
	playVideo("movie/KFM-Chapter 4-B.wmv")
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.rosterMode = 'story'
	data.storyNo = '1-4B'
	f_storyStatus()
	f_playCredits()
end

function f_arc1_chapter4_3()
	playVideo("movie/KFM-Chapter 4-C.wmv")
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.rosterMode = 'story'
	data.storyNo = '1-4C'
	f_storyStatus()
	f_playCredits()
end

function f_storyRosterTest()
	f_default()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd['kung fu man']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stageMenu = true
	data.rosterMode = 'story'
	setGameMode('storyRoster')
	textImgSetText(txt_mainSelect, 'STORY MODE')
	script.select.f_selectStory()
end

--;===========================================================
--; STORY SAVE DATA
--;===========================================================
function f_storyStatus()
	if data.storyNo == '1-0' then data.story1_0Status = 1
	elseif data.storyNo == '1-1' then data.story1_1Status = 1
	elseif data.storyNo == '1-2' then data.story1_2Status = 1
	elseif data.storyNo == '1-3A' then data.story1_3AStatus = 1
	elseif data.storyNo == '1-3B' then data.story1_3BStatus = 1
	elseif data.storyNo == '1-4A' then data.story1_4AStatus = 1
	elseif data.storyNo == '1-4B' then data.story1_4BStatus = 1
	elseif data.storyNo == '1-4C' then data.story1_4CStatus = 1
	end
	f_saveProgress()
	assert(loadfile('save/stats_sav.lua'))()
end
