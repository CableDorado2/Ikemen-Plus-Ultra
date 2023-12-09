
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

--Background
storyBG1 = animNew(sysSff, [[
104,0, 0,0,
]])
animAddPos(storyBG1, 160, 0)
animUpdate(storyBG1)

--Below Wood background
woodBG1 = animNew(sysSff, [[
105,0, 0,0,
]])
animSetPos(woodBG1, -45, 95)
animSetScale(woodBG1, 1.55, 1.5)
animUpdate(woodBG1)

--Below Bamboo background
bambooBG1 = animNew(sysSff, [[
106,0, 0,0, -1
]])
animSetPos(bambooBG1, -46, 86)
animSetScale(bambooBG1, 0.72, 0.6)
animUpdate(bambooBG1)

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

--Arc Icon
--function f_arcPreview()
	--arcPreview = ''
	--arcPreview = '0,' .. arcList-1 .. ', 0,0, 0'
	--arcPreview = animNew(storySff, arcPreview)
	--animSetScale(arcPreview, 0.4, 0.25)
	--animSetPos(arcPreview, 50, 21)
	--animUpdate(arcPreview)
	--animDraw(arcPreview)
	--return arcPreview
--end

t_storySelect = {
	{Name = 'KUNG FU MAN',		Img = arc1, 	  Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '100%'},
	{Name = 'KUNG FU GIRL',	    Img = arc2, 	  Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '28%'},
	{Name = 'SUAVE DUDE',  		Img = arc3, 	  Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '0%'},
	{Name = 'YOUR ARC HERE', 	Img = arcUnknown, Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '0%'},
	{Name = 'YOUR ARC HERE', 	Img = arcUnknown, Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '0%'},
	{Name = 'YOUR ARC HERE', 	Img = arcUnknown, Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '0%'},
	{Name = 'YOUR ARC HERE', 	Img = arcUnknown, Sel = arcSel, File = arcFolder, ID = textImgNew(), Status = '0%'},
}

--;===========================================================
--; CHAPTER SELECT
--;===========================================================
txt_storyText = createTextImg(font6, 0, 1, '', 0, 0,0.65,0.65)

--Chapter Preview
--function f_chapterPreview()
	--chapterPreview = ''
	--chapterPreview = '0,' .. chapterList-1 .. ', 0,0, 0'
	--chapterPreview = animNew(storySff, chapterPreview)
	--animSetScale(chapterPreview, 0.4, 0.25)
	--animSetPos(chapterPreview, 50, 21)
	--animUpdate(chapterPreview)
	--animDraw(chapterPreview)
	--return chapterPreview
--end

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

t_arc1 = {
	{Name = 'PROLOGUE',		       		Img = '', ID = textImgNew(), Status = ''},
	{Name = 'KIDNAPPING',		     	Img = '', ID = textImgNew(), Status = ''},
	{Name = 'KILLER MIRROR',  			Img = '', ID = textImgNew(), Status = ''},
	{Name = 'THE ROOF OF TRUTH',		Img = '', ID = textImgNew(), Status = ''},
	{Name = 'BROKEN SPIRIT', 			Img = '', ID = textImgNew(), Status = ''},
	{Name = 'FOR THE OLD TIMES',  		Img = '', ID = textImgNew(), Status = ''},
	{Name = 'LIFE LESSON',		   		Img = '', ID = textImgNew(), Status = ''},
	{Name = 'THE FALL OF A MASTER', 	Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE',	Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE',	Img = '', ID = textImgNew(), Status = ''},
}

t_arc2 = {
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
}

t_arc3 = {
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
	{Name = 'YOUR STORY CHAPTER HERE', Img = '', ID = textImgNew(), Status = ''},
}

t_arcNull = {
	{Name = 'NO DATA', Img = '', ID = textImgNew(), Status = ''},
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
	--arcList = 0 --Important to avoid errors when read arcPreview
	playBGM(bgmStory)
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
--Story Progress Logic
	--if data.story1Status == 1 then story1Progress = 'COMPLETED' elseif data.story1Status == 0 then story1Progress = 'INCOMPLETE' end
	--if data.story2Status == 1 then story2Progress = 'COMPLETED' elseif data.story2Status == 0 then story2Progress = 'INCOMPLETE' end
	--if data.story3Status == 1 then story3Progress = 'COMPLETED' elseif data.story3Status == 0 then story3Progress = 'INCOMPLETE' end
	--data.storysProgress = data.story1Status + data.story2Status + data.story3Status
	--storyData = (math.floor((data.storysProgress * 100 / 3) + 0.5)) --The number (3) is the amount of all data.storyStatus
	storyData = 100
	txt_storyMenu = createTextImg(font14, 0, -1, 'STORY SELECT:', 188, 13)
	txt_storyProgress = createTextImg(jgFnt, 2, 1, '['..storyData..'%]', 193.5, 13) --needs to be inside of story Menu function, to load story data %
	--BACK
		if esc() then
			--f_saveProgress()
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
			t = 0
			sndPlay(sysSnd, 100, 0)
			chapterMenu = chapterMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			t = 0
			sndPlay(sysSnd, 100, 0)
			chapterMenu = chapterMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			f_default()
		--PROLOGUE
			if storyMenu == 1 and chapterMenu == 1 then f_arc1_prologue()
			--elseif storyMenu == 2 and chapterMenu == 1 then f_arc2_prologue()
		--CHAPTER 1
			elseif storyMenu == 1 and chapterMenu == 2 then f_arc1_chapter1()
		--CHAPTER 2
			elseif storyMenu == 1 and chapterMenu == 3 then f_arc1_chapter2()
		--CHAPTER 3.1
			elseif storyMenu == 1 and chapterMenu == 4 then f_arc1_chapter3_1()
		--CHAPTER 3.2
			elseif storyMenu == 1 and chapterMenu == 5 then f_arc1_chapter3_2()
		--CHAPTER 4.1
			elseif storyMenu == 1 and chapterMenu == 6 then f_arc1_chapter4_1()
		--CHAPTER 4.2
			elseif storyMenu == 1 and chapterMenu == 7 then f_arc1_chapter4_2()
		--CHAPTER 4.3
			elseif storyMenu == 1 and chapterMenu == 8 then f_arc1_chapter4_3()
		--NO DATA
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
	--Chapter Cursor position calculation
		if storyMenu == 1 then t_chapter = t_arc1
		elseif storyMenu == 2 then t_chapter = t_arc2
		elseif storyMenu == 3 then t_chapter = t_arc3
		else t_chapter = t_arcNull
		end
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
		animDraw(f_animVelocity(storyBG0, -1, -1)) --animDraw(storyBG1)
	--Draw Title Menu
		textImgDraw(txt_storyMenu)
		textImgDraw(txt_storyProgress)
	--Draw Chapter Text BG
		--animSetScale(storyBG2, 205, 137)
		--animSetWindow(storyBG2, 156,94, 269,210)
		animDraw(storyBG2)
	--Draw Chapter Wood BG
		animDraw(woodBG1)
	--Draw Below Bamboo BG
		animDraw(bambooBG1)
	--Draw Chapter Table Cursor
		animSetWindow(cursorBox, -45,79+cursorPosY*20, 198,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--arcList = storyMenu --Uses menu position to show image in these order
		--f_arcPreview() --Show story image preview
	--Set Arc status
		--t_storySelect[1].Status = story1Progress
		--t_storySelect[2].Status = story2Progress
		--t_storySelect[3].Status = story3Progress
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
	--Set Chapter Info
		if storyMenu == 1 and chapterMenu == 1 then
			chaptPreview = chapt0
			txt_storyInfo = "THIS IS THE STORY OF A MAN WHO CHANGED THE VISION OF CASUAL FIGHTING GAMES."
		elseif storyMenu == 1 and chapterMenu == 2 then
			chaptPreview = chapt1
			txt_storyInfo = "KUNG FU MAN ENJOYS A DAY WITH HIS GIRLFRIEND. HOWEVER, SOMEONE UNEXPECTED WILL TAKE HIM ON A VIOLENT ADVENTURE..."
		elseif storyMenu == 1 and chapterMenu == 3 then
			chaptPreview = chapt2
			txt_storyInfo = "AFTER FIGHTING HIS WAY THROUGH THE FOREST AGAINST WAVES OF SUAVE'S MINIONS, KUNG FU MAN MANAGES TO REACH MOUNTAINSIDE TEMPLE. BUT SOMEONE VERY SIMILAR TO HIM WAS WAITING FOR HIM..."
		elseif storyMenu == 1 and chapterMenu == 4 then
			chaptPreview = chapt3_1
			txt_storyInfo = "AFTER DEFEATING HIS EVIL COPY, KUNG FU MAN HEADS TO THE ROOF OF THE MOUNTAINSIDE TEMPLE TO TAKE OUT SUAVE DUDE BUT HE WILL NOT BE ALONE..."
		elseif storyMenu == 1 and chapterMenu == 5 then
			chaptPreview = chapt3_2
			txt_storyInfo = "KUNG FU MAN HAS NOT BEEN STRONG ENOUGH TO DEFEAT HIS CLONE, NOW HE MUST FACE THE CONSEQUENCES OF HIS PAST ACTIONS..."
		elseif storyMenu == 1 and chapterMenu == 6 then
			chaptPreview = chapt4_1
			txt_storyInfo = "KUNG FU MAN RESCUE HIS GIRLFRIEND BUT ALSO RETURNS TRAINING WITH KUNG FU GIRL!"
		elseif storyMenu == 1 and chapterMenu == 7 then
			chaptPreview = chapt4_2
			txt_storyInfo = "THERE IS NOTHING SADER THAN A MAN WHO HAS LOST HIS LOVE..."
		elseif storyMenu == 1 and chapterMenu == 8 then
			chaptPreview = chapt4_3
			txt_storyInfo = "THE RAWEST END FOR ELECBYTE'S CHARACTER"
		else
			chaptPreview = chaptUnknown
			txt_storyInfo = ""
		end
	--Draw Chapter Preview Image
		animSetPos(chaptPreview, 161, 91)
		animSetScale(chaptPreview, 0.113, 0.106)
		animUpdate(chaptPreview)
		animDraw(chaptPreview)
	--Draw Chapter Info
		f_textRender(txt_storyText, txt_storyInfo, t, 160, 160, 15, 1.2, 40)
	--Set Chapters Scroll Logic
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
	playVideo("movie/KFM-Prologue.wmv") --Play Video Cutscene
	f_arc1_chapter1() --Launch Next Story Fight
end

function f_arc1_chapter1()
	playVideo("movie/KFM-Chapter 1.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1} --Set P1 Team Mode (0=Single, 1=Simul, 2=Turns)
	data.p1Char = {t_charAdd['kung fu man']} --Set P1 Characters
	data.p1Pal = 1 --Set P1 Character Palette
	--setTeamMode(1, 0, 1) --Set Team Config [Player, teamMode(0..2), numChars(1..4)]??
	data.p2TeamMenu = {mode = 1, chars = 2}
	data.p2Char = {t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def']}
	data.p2Pal = 1
	--setTeamMode(2, 2, 3)
	setRoundTime(-1)
	data.stageMenu = false
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stageNo = 4 --Set Stage via Select.def List Number
	--data.stage = {t_stageDef['training room']} --TODO
	data.rosterMode = 'story'
	setGameMode('story1')
	script.select.f_selectStory() --Launch Story Fight
	if script.select.winner == 1 then f_arc1_chapter2() end --Launch Next Story Fight only if you win
end

function f_arc1_chapter2()
	playVideo("movie/KFM-Chapter 2.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_charAdd['kung fu man']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd['kung fu man/evil/evil kung fu man.def']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.stageMenu = false
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stageNo = 15
	data.rosterMode = 'story'
	setGameMode('story2')
	script.select.f_selectStory()
	if script.select.winner == 1 then
		f_arc1_chapter3_1()
	elseif script.select.winner == 2 then
		f_arc1_chapter3_2()
	end
end

function f_arc1_chapter3_1()
	playVideo("movie/KFM-Chapter 3.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 1, chars = 2}
	data.p1Char = {t_charAdd['kung fu man/master/master kung fu man.def'], t_charAdd['kung fu girl']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 2, chars = 4}
	data.p2Char = {t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude/minion/minion.def'], t_charAdd['suave dude']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.stageMenu = false
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.rosterMode = 'story'
	data.stageNo = 14
	setGameMode('story3_1')
	script.select.f_selectStory()
	if script.select.winner == 1 then
		f_arc1_chapter4_1()
	elseif script.select.winner == 2 then
		f_arc1_chapter4_2()
	end
end

function f_arc1_chapter3_2()
	--playVideo("movie/KFM-Chapter 3-2.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_charAdd['kung fu man']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 2, chars = 3}
	data.p2Char = {t_charAdd['suave dude'], t_charAdd['kung fu man/evil/evil kung fu man.def'], t_charAdd['kung fu girl']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.stageMenu = false
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stageNo = 14
	data.rosterMode = 'story'
	setGameMode('story3_2')
	script.select.f_selectStory()
	if script.select.winner == 1 then
		f_arc1_chapter4_2()
	elseif script.select.winner == 2 then
		f_arc1_chapter4_3()
	end
end

function f_arc1_chapter4_1()
	playVideo("movie/KFM-Chapter 4.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_charAdd['kung fu man/master/master kung fu man.def']}
	data.p1Pal = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_charAdd['kung fu girl']}
	data.p2Pal = 1
	setRoundTime(-1)
	data.stageMenu = false
	data.orderSelect = false
	data.versusScreen = false
	data.victoryscreen = false
	data.stageNo = 13
	data.rosterMode = 'story'
	setGameMode('story4_1')
	script.select.f_selectStory()
	f_playCredits() --Go to credits screen
end

function f_arc1_chapter4_2()
	--playVideo("movie/KFM-Chapter 4-2.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.rosterMode = 'story'
	f_playCredits()
end

function f_arc1_chapter4_3()
	--playVideo("movie/KFM-Chapter 4-3.wmv")
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	data.rosterMode = 'story'
	f_playCredits()
end