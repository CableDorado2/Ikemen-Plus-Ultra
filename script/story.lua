
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

--Arc Folder Empty Icon
arcFolderEmpty = animNew(storySff, [[0,2, 0,0, -1]])
animSetAlpha(arcFolderEmpty, 20, 100) --Transparent Color

--Arc Folder Complete Icon
arcFolderComplete = animNew(storySff, [[0,2, 0,0, -1]])

--Unknown Arc Icon
arcUnknown = animNew(storySff, [[0,0, 0,0,]])

--Arc Selected
arcSel = animNew(storySff, [[0,1, 0,0,]])

--Chapter Complete Icon
checkIco = animNew(sysSff, [[104,0, 0,0,]])

checkNA = animNew(sysSff, [[9999,9999, 0,0,]])

--Unknown Chapter Preview
chaptUnknown = animNew(sysSff, [[110,4, 0,0,]])

--Unknown Chapter Arc
t_arcNull = {
	{ID = textImgNew(), Name = "YOUR STORY CHAPTER HERE", Preview = chaptUnknown, Status = checkNA, Info = "NO DESCRIPTION PROVIDED."},
}

--;===========================================================
--; ARC SELECT
--;===========================================================
--Arc 1 Icon
arc1 = animNew(storySff, [[0,4, 0,0,]])

--Arc 2 Icon
arc2 = animNew(storySff, [[0,5, 0,0,]])

--Arc 3 Icon
arc3 = animNew(storySff, [[0,6, 0,0,]])

t_storySelect = {
	{ID = textImgNew(), Name = "KUNG FU MAN", 	Icon = arc1, 	   Sel = arcSel, File = arcFolderEmpty, Status = ""}, --Add Arc Slot
	{ID = textImgNew(), Name = "???", 			Icon = arcUnknown, Sel = arcSel, File = arcFolderEmpty, Status = ""},
	{ID = textImgNew(), Name = "???", 			Icon = arcUnknown, Sel = arcSel, File = arcFolderEmpty, Status = ""},
	{ID = textImgNew(), Name = "YOUR ARC HERE", Icon = arcUnknown, Sel = arcSel, File = arcFolderEmpty, Status = ""},
	{ID = textImgNew(), Name = "YOUR ARC HERE", Icon = arcUnknown, Sel = arcSel, File = arcFolderEmpty, Status = ""},
	{ID = textImgNew(), Name = "YOUR ARC HERE", Icon = arcUnknown, Sel = arcSel, File = arcFolderEmpty, Status = ""},
	{ID = textImgNew(), Name = "YOUR ARC HERE", Icon = arcUnknown, Sel = arcSel, File = arcFolderEmpty, Status = ""},
}

--;===========================================================
--; ARC 1 CHAPTER SELECT
--;===========================================================
--Arc 1 - Prologue Preview
st1_0 = animNew(storySff, [[1,0, 0,0,]])

--Arc 1 - Chapter 1 Preview
st1_1 = animNew(storySff, [[1,10, 0,0,]])

--Arc 1 - Chapter 2 Preview
st1_2 = animNew(storySff, [[1,20, 0,0,]])

--Arc 1 - Chapter 3A Preview
st1_3A = animNew(storySff, [[1,30, 0,0,]])

--Arc 1 - Chapter 3B Preview
st1_3B = animNew(storySff, [[1,31, 0,0,]])

--Arc 1 - Chapter 4A Preview
st1_4A = animNew(storySff, [[1,40, 0,0, 40]])

--Arc 1 - Chapter 4B Preview
st1_4B = animNew(storySff, [[1,41, 0,0,]])

--Arc 1 - Chapter 4C Preview
st1_4C = animNew(storySff, [[1,42, 0,0,]])

--Arc 1 - Chapter 4D Preview
st1_4D = animNew(storySff, [[1,43, 0,0,]])

t_arc1 = {
	{ID = textImgNew(), Name = "PROLOGUE", 			   	   Preview = st1_0, 	   Status = checkNA, Info = "THIS IS THE STORY OF A MAN WHO CHANGED THE VISION OF INDIE FIGHTING GAMES."}, --Add Chapter Slot for Arc 1
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "COMPLETE KUNG FU MAN'S PROLOGUE TO UNLOCK THIS CHAPTER!"},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "COMPLETE THE PREVIOUS CHAPTER TO UNLOCK THIS ONE."},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = "A FATE IS REQUIRED TO UNLOCK THIS CHAPTER..."},
	{ID = textImgNew(), Name = "YOUR STORY CHAPTER HERE",  Preview = chaptUnknown, Status = checkNA, Info = "TEST"},
}

--;===========================================================
--; ARC 2 CHAPTER SELECT
--;===========================================================
--Arc 2 - Prologue Preview
st2_0 = animNew(storySff, [[2,0, 0,0,]])

--Arc 2 - Chapter 1 Preview
st2_1 = animNew(storySff, [[2,10, 0,0,]])

--Arc 2 - Chapter 2 Preview
st2_2 = animNew(storySff, [[2,20, 0,0,]])

t_arc2 = {
	{ID = textImgNew(), Name = "YOUR STORY CHAPTER HERE",  Preview = chaptUnknown, Status = checkNA, Info = "COMPLETE KUNG FU MAN'S PROLOGUE TO UNLOCK THIS STORY!"}, --Add Chapter Slot for Arc 2
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = ""},
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = ""},
}

--;===========================================================
--; ARC 3 CHAPTER SELECT
--;===========================================================
--Arc 3 - Prologue Preview
st3_0 = animNew(storySff, [[3,0, 0,0,]])

--Arc 3 - Chapter 1 Preview
st3_1 = animNew(storySff, [[3,10, 0,0,]])

t_arc3 = {
	{ID = textImgNew(), Name = "YOUR STORY CHAPTER HERE",  Preview = chaptUnknown, Status = checkNA, Info = "COMPLETE KUNG FU MAN'S PROLOGUE TO UNLOCK THIS STORY!"}, --Add Chapter Slot for Arc 3
	{ID = textImgNew(), Name = "???", 					   Preview = chaptUnknown, Status = checkNA, Info = ""},
}

function f_resetChaptSel()
chapterMenu = 1
cursorPosY = 1
moveChapter = 0
end

--;===========================================================
--; STORY MENU
--;===========================================================
function f_storyMenu()
	cmdInput()
	storyMenu = 1
	local cursorPosX = 1
	local moveArc = 0
	f_resetChaptSel()
	t_arcSelect = nil
	local t = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local lockedStory = false
	playBGM(bgmStory)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	while true do
--Load Chapters Progress
	data.story1Progress = data.story1_0Status + data.story1_1Status + data.story1_2Status + data.story1_3AStatus + data.story1_3BStatus + data.story1_4AStatus + data.story1_4BStatus + data.story1_4CStatus + data.story1_4DStatus
	data.story2Progress = data.story2_0Status + data.story2_1Status + data.story2_2Status
	data.story3Progress = data.story3_0Status + data.story3_1Status
--Arcs Progress Logic
	story1Data = (math.floor((data.story1Progress * 100 / 9) + 0.5)) --The number (9) is the amount of all data.story1Progress
	story2Data = (math.floor((data.story2Progress * 100 / 3) + 0.5))
	story3Data = (math.floor((data.story3Progress * 100 / 2) + 0.5))
--Story Mode Progress Logic
	data.storiesProgress = story1Data + story2Data + story3Data
	storyData = (math.floor((data.storiesProgress / 3) + 0.5)) --The number (3) is the amount of all data.storiesProgress
	txt_storyMenu = createTextImg(font14, 0, -1, "STORY SELECT:", 188, 13)
	txt_storyProgress = createTextImg(jgFnt, 2, 1, "["..storyData.."%]", 193.5, 13) --needs to be inside of story Menu function, to load story data %
	--BACK
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			f_saveProgress()
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			f_menuMusic()
			break
	--Arc Selection
		elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
			t = 0 --Reset Story Info Delay Time
			sndPlay(sysSnd, 100, 3)
			storyMenu = storyMenu - 1
			f_resetChaptSel()
		elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
			t = 0
			sndPlay(sysSnd, 100, 3)
			storyMenu = storyMenu + 1
			f_resetChaptSel()
	--Chapter Selection
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			if lockedStory == false then
				t = 0
				sndPlay(sysSnd, 100, 0)
				chapterMenu = chapterMenu - 1
			end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			if lockedStory == false then
				t = 0
				sndPlay(sysSnd, 100, 0)
				chapterMenu = chapterMenu + 1
			end
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--SLOT 1
			if storyMenu == 1 and chapterMenu == 1 then f_arc1_prologue() --Unlocked By Default
			elseif storyMenu == 2 and chapterMenu == 1 and data.story1_1Unlock == true then f_arc2_prologue()
			elseif storyMenu == 3 and chapterMenu == 1 and data.story1_1Unlock == true then f_arc3_prologue()
		--SLOT 2
			elseif storyMenu == 1 and chapterMenu == 2 and data.story1_1Unlock == true then f_arc1_chapter1()
			elseif storyMenu == 2 and chapterMenu == 2 and data.story2_1Unlock == true then f_arc2_chapter1()
			elseif storyMenu == 3 and chapterMenu == 2 and data.story3_1Unlock == true then f_arc3_chapter1()
		--SLOT 3
			elseif storyMenu == 1 and chapterMenu == 3 and data.story1_2Unlock == true then f_arc1_chapter2()
			elseif storyMenu == 2 and chapterMenu == 3 and data.story2_2Unlock == true then f_arc2_chapter2()
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
			elseif storyMenu == 1 and chapterMenu == 9 and data.story1_4DUnlock == true then f_arc1_chapter4_4()
		--SLOT 10
			elseif storyMenu == 1 and chapterMenu == 10 then f_storyRosterTest()
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
		elseif ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30)) and cursorPosX > 1 then
			cursorPosX = cursorPosX - 1
		elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30)) and cursorPosX < 3 then
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
			t_arcSelect = t_arc1 --Load Arc 1 Slots
			lockedStory = false --This Arc always is unlocked
		--Set Unlocked Chapters Names
			if data.story1_1Unlock == true then t_arc1[2].Name = "KIDNAPPING" end
			if data.story1_2Unlock == true then t_arc1[3].Name = "KILLER MIRROR" end
			if data.story1_3AUnlock == true then t_arc1[4].Name = "THE ROOF OF TRUTH" end
			if data.story1_3BUnlock == true then t_arc1[5].Name = "BROKEN SPIRIT" end
			if data.story1_4AUnlock == true then t_arc1[6].Name = "FINAL DESTINATION" end
			if data.story1_4BUnlock == true then t_arc1[7].Name = "FAKE WORLD" end
			if data.story1_4CUnlock == true then t_arc1[8].Name = "ZERO HOUR" end
			if data.story1_4DUnlock == true then t_arc1[9].Name = "THE FALL OF A LEGEND" end
	--Arc 2 Menu Settings
		elseif storyMenu == 2 then
			t_arcSelect = t_arc2
			if data.story1_1Unlock == true then
				lockedStory = false
				if data.story2_1Unlock == true then t_arc2[2].Name = "YOUR UNLOCKED NAME HERE" end
				if data.story2_2Unlock == true then t_arc2[3].Name = "YOUR UNLOCKED NAME HERE" end
			else
				lockedStory = true --This Arc needs to be unlocked
			end
	--Arc 3 Menu Settings
		elseif storyMenu == 3 then
			t_arcSelect = t_arc3
			if data.story1_1Unlock == true then
				lockedStory = false
				if data.story3_1Unlock == true then t_arc3[2].Name = "YOUR UNLOCKED NAME HERE" end
			else
				lockedStory = true
			end
	--Empty Arc Menu Settings
		else
			t_arcSelect = t_arcNull
			lockedStory = false
		end
	--Chapter Cursor position calculation
		if lockedStory == false then
			if chapterMenu < 1 then
				chapterMenu = #t_arcSelect
				if #t_arcSelect > 6 then
					cursorPosY = 6
				else
					cursorPosY = #t_arcSelect
				end
			elseif chapterMenu > #t_arcSelect then
				chapterMenu = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 6 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 6 then
				moveChapter = (chapterMenu - 6) * 20
			elseif cursorPosY == 1 then
				moveChapter = (chapterMenu - 1) * 20
			end
			if #t_arcSelect <= 6 then
				maxchapters = #t_arcSelect
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
	--Set Arc Info
		if data.story1_1Unlock == true then
			t_storySelect[2].Name = "KUNG FU GIRL"
			t_storySelect[2].Icon = arc2
			t_storySelect[3].Name = "SUAVE DUDE"
			t_storySelect[3].Icon = arc3
		end
	--Set Arc status
		t_storySelect[1].Status = story1Data.."%"
		t_storySelect[2].Status = story2Data.."%"
		t_storySelect[3].Status = story3Data.."%"
	--Set Arc Folder Icon Based on status
		if story1Data == 100 then --When you complete this story
			t_storySelect[1].File = arcFolderComplete
		end
		if story2Data == 100 then
			t_storySelect[2].File = arcFolderComplete
		end
		if story3Data == 100 then
			t_storySelect[3].File = arcFolderComplete
		end
	--Set Arcs Scroll Logic
		for i=1, maxarcs do
			if i > storyMenu - cursorPosX then
				--Draw Arc Folder BG
				animSetPos(t_storySelect[i].File, -95+i*105-moveArc, 20)
				animSetScale(t_storySelect[i].File, 0.05, 0.05)
				animUpdate(t_storySelect[i].File)
				animDraw(t_storySelect[i].File)
				--Draw Arc Preview Image
				animSetPos(t_storySelect[i].Icon, -62+i*105-moveArc, 31.5)
				animUpdate(t_storySelect[i].Icon)
				animDraw(t_storySelect[i].Icon)
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
			if data.story1_0Status == 1 then t_arc1[1].Status = checkIco end --Load Chapter Status Icon
		elseif storyMenu == 1 and chapterMenu == 2 then
			if data.story1_1Status == 1 then t_arc1[2].Status = checkIco end
			if data.story1_1Unlock == true then --If this chapters is unlocked
				t_arc1[2].Preview = st1_1 --Load Chapter Preview
				t_arc1[2].Info = "WHILE KUNG FU MAN WAS LOOKING FOR HIS GIRLFRIEND. SOMEONE UNEXPECTED WILL TAKE HIM ON A BIZARRE ADVENTURE..." --Set Chapter Description
			end
		elseif storyMenu == 1 and chapterMenu == 3 then
			if data.story1_2Status == 1 and data.story1_3AUnlock == true and data.story1_3BUnlock == true then t_arc1[3].Status = checkIco end
			if data.story1_2Unlock == true then
				t_arc1[3].Preview = st1_2
				t_arc1[3].Info = "AFTER FIGHTING HIS WAY THROUGH THE FOREST AGAINST WAVES OF SUAVE'S MINIONS, KUNG FU MAN MANAGES TO REACH MOUNTAINSIDE TEMPLE. BUT SOMEONE WAS WAITING FOR HIM..."
			end
		elseif storyMenu == 1 and chapterMenu == 4 then
			if data.story1_3AStatus == 1 and data.story1_4AUnlock == true and data.story1_4CUnlock == true then t_arc1[4].Status = checkIco end
			if data.story1_3AUnlock == true then
				t_arc1[4].Preview = st1_3A
				t_arc1[4].Info = "AFTER DEFEATING HIS EVIL COPY, KUNG FU MAN HEADS TO THE ROOF OF THE MOUNTAINSIDE TEMPLE TO DEFEAT HIS NEMESIS: SUAVE DUDE..."
			end
		elseif storyMenu == 1 and chapterMenu == 5 then
			if data.story1_3BStatus == 1 and data.story1_4BUnlock == true and data.story1_4DUnlock == true then t_arc1[5].Status = checkIco end
			if data.story1_3BUnlock == true then
				t_arc1[5].Preview = st1_3B
				t_arc1[5].Info = "KUNG FU MAN HAS NOT BEEN STRONG ENOUGH TO DEFEAT HIS CLONE, NOW HE MUST FACE THE CONSEQUENCES OF HIS PAST ACTIONS..."
			end
		elseif storyMenu == 1 and chapterMenu == 6 then
			if data.story1_4AStatus == 1 then t_arc1[6].Status = checkIco end
			if data.story1_4AUnlock == true then
				t_arc1[6].Preview = st1_4A
				t_arc1[6].Info = "KUNG FU MAN DEFEAT SUAVE DUDE BUT HE CAN'T FIND HIS GIRLFRIEND..."
			end
		elseif storyMenu == 1 and chapterMenu == 7 then
			if data.story1_4BStatus == 1 then t_arc1[7].Status = checkIco end
			if data.story1_4BUnlock == true	then
				t_arc1[7].Preview = st1_4B
				t_arc1[7].Info = "THE FUN IS ENDLESS.                IKEMEN IS LOVE, IKEMEN IS LIFE."
			end
		elseif storyMenu == 1 and chapterMenu == 8 then
			if data.story1_4CStatus == 1 then t_arc1[8].Status = checkIco end
			if data.story1_4CUnlock == true then
				t_arc1[8].Preview = st1_4C
				t_arc1[8].Info = "THE COUNTDOWN IS OVER, WHAT'S IN STORE FOR KUNG FU MAN?"
			end
		elseif storyMenu == 1 and chapterMenu == 9 then
			if data.story1_4DStatus == 1 then t_arc1[9].Status = checkIco end
			if data.story1_4DUnlock == true then
				t_arc1[9].Preview = st1_4D
				t_arc1[9].Info = "A BRUTAL END FOR ELECBYTE'S CHARACTER."
			end
	--Set Arc 2 - Chapter Info
		elseif storyMenu == 2 and chapterMenu == 1 then
			if data.story2_0Status == 1 then t_arc2[1].Status = checkIco end
			if data.story1_1Unlock == true then
				--t_arc2[1].Preview = st2_0
				t_arc2[1].Info = "YOUR CHAPTER DESCRIPTION HERE."
			end
		elseif storyMenu == 2 and chapterMenu == 2 then
			if data.story2_1Status == 1 then t_arc2[2].Status = checkIco end
			if data.story2_1Unlock == true then
				--t_arc2[2].Preview = st2_1
				t_arc2[2].Info = "YOUR CHAPTER DESCRIPTION HERE."
			end
		elseif storyMenu == 2 and chapterMenu == 3 then
			if data.story2_2Status == 1 then t_arc2[3].Status = checkIco end
			if data.story2_2Unlock == true then
				--t_arc2[3].Preview = st2_2
				t_arc2[3].Info = "YOUR CHAPTER DESCRIPTION HERE."
			end
	--Set Arc 3 - Chapter Info
		elseif storyMenu == 3 and chapterMenu == 1 then
			if data.story3_0Status == 1 then t_arc3[1].Status = checkIco end
			if data.story1_1Unlock == true then
				--t_arc3[1].Preview = st3_0
				t_arc3[1].Info = "YOUR CHAPTER DESCRIPTION HERE."
			end
		elseif storyMenu == 3 and chapterMenu == 2 then
			if data.story3_1Status == 1 then t_arc3[2].Status = checkIco end
			if data.story3_1Unlock == true then
				--t_arc3[2].Preview = st3_1
				t_arc3[2].Info = "YOUR CHAPTER DESCRIPTION HERE."
			end
		end
	--Draw Chapter Preview Image
		if lockedStory == false then --If some arc is unlocked:
			animSetPos(t_arcSelect[chapterMenu].Preview, 161, 91)
			animSetScale(t_arcSelect[chapterMenu].Preview, 0.113, 0.106)
			animUpdate(t_arcSelect[chapterMenu].Preview)
			animDraw(t_arcSelect[chapterMenu].Preview)
		--Draw Chapter Info
			txt_storyText = createTextImg(font6, 0, 1, "", 0, 0,0.65,0.65)
			f_textRender(txt_storyText, t_arcSelect[chapterMenu].Info, t, 160, 160, 15, 1.2, 40)
		--Draw Check Chapter Status Icon
			animSetPos(t_arcSelect[chapterMenu].Status, 320, 105)
			animSetScale(t_arcSelect[chapterMenu].Status, 0.4, 0.4)
			animUpdate(t_arcSelect[chapterMenu].Status)
			animDraw(t_arcSelect[chapterMenu].Status)
		else --If some arc is locked, don't draw preview, status and draw text in another position
			txt_storyText = createTextImg(font6, 0, 0, "", 0, 0,0.65,0.65)
			f_textRender(txt_storyText, t_arcSelect[chapterMenu].Info, t, 150, 110, 15, 1.5, 40)
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
					if t_arcSelect[i].ID ~= nil then
						textImgDraw(f_updateTextImg(t_arcSelect[i].ID, jgFnt, bank, 1, t_arcSelect[i].Name, -36, 89.5+i*20-moveChapter))
					end
				end
			end
		--Draw Up Animated Cursor
			if maxchapters > 6 then
				animDraw(storyUpArrow)
				animUpdate(storyUpArrow)
			end
		--Draw Down Animated Cursor
			if #t_arcSelect > 6 and maxchapters < #t_arcSelect then
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
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		t = t + 1
		if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		elseif commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufu = 0
			bufd = 0
			bufr = 0
			bufl = 0
		end
		cmdInput()
		refresh()
	end
end

function f_backStorySel()
	data.VNbreak = false --Reset visual novel back to main menu
	--f_saveTemp()
	playBGM(bgmStory)
	data.fadeTitle = f_fadeAnim(40, 'fadein', 'black', fadeSff)
end

--;===========================================================
--; ARC 1 FIGHTS
--;===========================================================
kfmVN = "data/visualnovel/arc1.def"
kfmVNtxtStart = 1

--PROLOGUE
function f_arc1_prologue()
	playVideo("movie/KFM-Prologue.wmv") --Play video cutscene
	data.storyNo = "1-0"
	data.story1_1Unlock = true --Unlock next chapter
	f_storyStatus() --Save progress
	f_arc1_chapter1() --Launch next story fight
end

--KIDNAPPING
function f_arc1_chapter1()
	--Part 1
	script.visualnovel.f_vnScene(kfmVN,1,kfmVNtxtStart) --Start Visual Novel Mode, each paramvalues that this functions returns are explained in visualnovel.lua script
	if not data.VNbreak then --Only show the fight if not back to main menu in pause menu from visual novel
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.p1TeamMenu = {mode = 0, chars = 1}
		data.p1Char = {t_charAdd["kung fu man"]}
		data.p1Pal = 1
		data.p2TeamMenu = {mode = 0, chars = 1}
		data.p2Char = {t_charAdd["mako mayama/vnfight.def"]}
		data.p2Pal = 1
		setRoundTime(-1)
		setRoundsToWin(1)
		data.versusScreen = false
		data.victoryscreen = false
		data.stage = {t_stageDef["stages/mountain valley.def"]}
		data.songSelect = false --Star fight using music played in visual novel mode
		data.rosterMode = "story"
		setGameMode('story')
		setPlayerSide('p1left')
		setPauseVar("giveup")
		script.select.f_selectStory() --Start Fight with previous settings
		--Part 2
		script.visualnovel.f_vnScene(kfmVN,1,16)
		if not data.VNbreak then
			f_default() --Reset settings for the custom fight
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			data.p1TeamMenu = {mode = 0, chars = 1} --Set P1 Team Mode (0=Single, 1=Simul, 2=Turns)
			data.p1Char = {t_charAdd["kung fu man"]} --Set P1 Characters (needs to be loaded in select.def)
			data.p1Pal = 1 --Set P1 Character Palette
			data.p2TeamMenu = {mode = 1, chars = 4}
			data.p2Char = {t_charAdd["suave dude/minion/minion.def"], t_charAdd["suave dude/minion/minion.def"], t_charAdd["suave dude/minion/minion.def"], t_charAdd["suave dude/minion/minion.def"]}
			data.p2Pal = 1
			setRoundTime(-1)
			setRoundsToWin(1)
			data.orderSelect = false
			data.versusScreen = false
			data.victoryscreen = false
			data.stage = {t_stageDef["stages/mountainside temple/hidden path.def"]} --Set stage (needs to be loaded in select.def)
			data.bgm = "sound/Pearl In The Sky.mp3" --Set Custom Stage Song
			data.rosterMode = "story"
			data.storyNo = "1-1"
			setGameMode('story')
			setService("undefeatable") --You can't lose with this service, basically is a battle where you always win.
			setPlayerSide('p1left')
			script.select.f_selectStory() --Start Fight with previous settings
			if script.select.winner == 1 then --Only if you win do:
				data.story1_2Unlock = true --Unlock next chapter
				f_storyStatus() --Save progress
				f_arc1_chapter2() --Launch next story fight
			end
		else
			f_backStorySel()
		end
	else --Back to Main Menu if this option is selected in Visual Novel Pause Menu
		f_backStorySel()
	end
end

--KILLER MIRROR
function f_arc1_chapter2()
	script.visualnovel.f_vnScene(kfmVN,2,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.p1TeamMenu = {mode = 0, chars = 1}
		data.p1Char = {t_charAdd["kung fu man"]}
		data.p1Pal = 1
		data.p2TeamMenu = {mode = 0, chars = 1}
		data.p2Char = {t_charAdd["kung fu man/evil/evil kung fu man.def"]}
		data.p2Pal = 1
		setRoundTime(-1)
		setRoundsToWin(1)
		setLifeMul(1) --Force life at 100% (just in case that Life has been changed via options)
		data.versusScreen = false
		data.victoryscreen = false
		--data.stage no needed because this chapter will use the auto stage of evil kfm
		data.songSelect = false
		data.rosterMode = "story"
		data.storyNo = "1-2"
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
	else
		f_backStorySel()
	end
end

--THE ROOF OF TRUTH
function f_arc1_chapter3_1()
	script.visualnovel.f_vnScene(kfmVN,3,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.p1TeamMenu = {mode = 0, chars = 1}
		data.p1Char = {t_charAdd["kung fu man/master/master kung fu man.def"]}
		data.p1Pal = 1
		data.p2TeamMenu = {mode = 0, chars = 1}
		data.p2Char = {t_charAdd["suave dude"]}
		data.p2Pal = 1
		setRoundTime(60*60)
		setRoundsToWin(1)
		setLifeMul(1)
		data.versusScreen = false
		data.victoryscreen = false
		data.stage = {t_stageDef["stages/mountainside temple/suave's corridor.def"]}
		data.bgm = "sound/Open War.mp3"
		data.rosterMode = "story"
		data.storyNo = "1-3A"
		setGameMode('story')
		script.select.f_selectStory()
		if script.select.winner == 1 then
			data.story1_4AUnlock = true
			f_storyStatus()
			f_arc1_chapter4_1()
		elseif script.select.winner == 2 then
			data.story1_4CUnlock = true
			f_storyStatus()
			f_arc1_chapter4_3()
		end
	else
		f_backStorySel()
	end
end

--BROKEN SPIRIT
function f_arc1_chapter3_2()
	script.visualnovel.f_vnScene(kfmVN,4,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.p1Pal = 1
		data.p1TeamMenu = {mode = 0, chars = 1}
		data.p1Char = {t_charAdd["kung fu man"]}
		data.p2TeamMenu = {mode = 2, chars = 2}
		data.p2Char = {t_charAdd["kung fu girl/master/master kung fu girl.def"], t_charAdd["suave dude"]}
		data.p2Pal = 1
		setRoundTime(-1)
		setRoundsToWin(3)
		setLifeMul(1)
		data.orderSelect = false
		data.versusScreen = false
		data.victoryscreen = false
		data.stage = {t_stageDef["stages/mountainside temple/roof night.def"]}
		data.bgm = "sound/Death Corridor.mp3"
		data.rosterMode = "story"
		data.storyNo = "1-3B"
		setGameMode('story')
		setService("balance")
		setAutoguard(1, true)
		setAutoguard(2, false)
		script.select.f_selectStory()
		if script.select.winner == 1 then
			data.story1_4BUnlock = true
			f_storyStatus()
			f_arc1_chapter4_2()
		elseif script.select.winner == 2 then
			data.story1_4DUnlock = true
			f_storyStatus()
			f_arc1_chapter4_4()
		end
	else
		f_backStorySel()
	end
end

--FINAL DESTINATION
function f_arc1_chapter4_1()
	script.visualnovel.f_vnScene(kfmVN,5,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.rosterMode = "story"
		data.storyNo = "1-4A"
		--[[
		data.p1TeamMenu = {mode = 0, chars = 1}
		data.p1Char = {t_charAdd["kung fu man/master/master kung fu man.def"]}
		data.p1Pal = 1
		data.p2TeamMenu = {mode = 0, chars = 1}
		data.p2Char = {t_charAdd["kung fu girl/master/master kung fu girl.def"]}
		data.p2Pal = 1
		setRoundTime(-1)
		setRoundsToWin(1)
		data.versusScreen = false
		data.victoryscreen = false
		data.stage = {t_stageDef["stages/sakura.def"]}
		setGameMode('story')
		script.select.f_selectStory()
		]]
		f_storyStatus()
		f_playCredits() --Go to credits screen
	else
		f_backStorySel()
	end
end

--FAKE WORLD
function f_arc1_chapter4_2()
	script.visualnovel.f_vnScene(kfmVN,6,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.rosterMode = "story"
		data.storyNo = "1-4B"
		f_storyStatus()
		f_playCredits()
	else
		f_backStorySel()
	end
end

--ZERO HOUR
function f_arc1_chapter4_3()
	script.visualnovel.f_vnScene(kfmVN,7,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.rosterMode = "story"
		data.storyNo = "1-4C"
		f_storyStatus()
		f_playCredits()
	else
		f_backStorySel()
	end
end

--THE FALL OF A LEGEND
function f_arc1_chapter4_4()
	script.visualnovel.f_vnScene(kfmVN,8,kfmVNtxtStart)
	if not data.VNbreak then
		f_default()
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		data.rosterMode = "story"
		data.storyNo = "1-4D"
		f_storyStatus()
		f_playCredits()
	else
		f_backStorySel()
	end
end

--Character Select Test Chapter
function f_storyRosterTest()
	f_default()
	sndPlay(sysSnd, 100, 1)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd["kung fu man"]}
	data.p2Pal = 1
	setRoundTime(-1)
	setRoundsToWin(1)
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stageMenu = true
	data.rosterMode = "story"
	setGameMode('storyRoster')
	textImgSetText(txt_mainSelect, "STORY MODE")
	script.select.f_selectStory()
end

--;===========================================================
--; ARC 2 FIGHTS (EXAMPLES)
--;===========================================================
--PROLOGUE
function f_arc2_prologue()
	--playVideo("movie/???.wmv")
	data.storyNo = "2-0"
	data.story2_1Unlock = true
	f_storyStatus()
	f_arc2_chapter1()
end

--CHAPTER 1
function f_arc2_chapter1()
	--playVideo("movie/???.wmv")
	data.storyNo = "2-1"
	data.story2_2Unlock = true
	f_storyStatus()
	f_arc2_chapter2()
end

--CHAPTER 2
function f_arc2_chapter2()
	--playVideo("movie/???.wmv")
	data.storyNo = "2-2"
	f_storyStatus()
	--f_playCredits()
end

--;===========================================================
--; ARC 3 FIGHTS (EXAMPLES)
--;===========================================================
--PROLOGUE
function f_arc3_prologue()
	--playVideo("movie/???.wmv")
	data.storyNo = "3-0"
	data.story3_1Unlock = true
	f_storyStatus()
	f_arc3_chapter1()
end

--CHAPTER 1
function f_arc3_chapter1()
	--playVideo("movie/???.wmv")
	data.storyNo = "3-1"
	f_storyStatus()
	--f_playCredits()
end

--;===========================================================
--; STORY SAVE DATA
--;===========================================================
function f_storyStatus()
	--Arc 1
	if data.storyNo == "1-0" then data.story1_0Status = 1
	elseif data.storyNo == "1-1" then data.story1_1Status = 1
	elseif data.storyNo == "1-2" then data.story1_2Status = 1
	elseif data.storyNo == "1-3A" then data.story1_3AStatus = 1
	elseif data.storyNo == "1-3B" then data.story1_3BStatus = 1
	elseif data.storyNo == "1-4A" then data.story1_4AStatus = 1
	elseif data.storyNo == "1-4B" then data.story1_4BStatus = 1
	elseif data.storyNo == "1-4C" then data.story1_4CStatus = 1
	elseif data.storyNo == "1-4D" then data.story1_4DStatus = 1
	--Arc 2
	elseif data.storyNo == "2-0" then data.story2_0Status = 1
	elseif data.storyNo == "2-1" then data.story2_1Status = 1
	elseif data.storyNo == "2-2" then data.story2_2Status = 1
	--Arc 3
	elseif data.storyNo == "3-0" then data.story3_0Status = 1
	elseif data.storyNo == "3-1" then data.story3_1Status = 1
	end
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end
