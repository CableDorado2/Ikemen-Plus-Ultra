local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
--Load SFF Data
sprArtworks = sffNew("script/mods/gallery/artworks.sff") --Gallery Artwork Previews
sprStoryboards = sffNew("script/mods/gallery/storyboards.sff") --Gallery Storyboard Previews
sprMovies = sffNew("script/mods/gallery/movies.sff") --Gallery Movie Previews
--Load Definition Data
galleryArtworksDef = "script/mods/gallery/artworks.def" --Gallery Artworks
galleryStoryboardsDef = "script/mods/gallery/storyboards.def" --Gallery Storyboards
galleryMoviesDef = "script/mods/gallery/movies.def" --Gallery Videos
--;===========================================================
--; GALLERY MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_watchMenu,4,{text = "GALLERY", gotomenu = "f_galleryMenu()", id = textImgNew()}) --Insert new item to t_watchMenu table loaded by screenpack.lua
txt_galleryTitle = createTextImg(jgFnt, 0, 0, "GALLERY", 159, 15)
txt_galleryInfo = createTextImg(font5, 0, 0, "", 159, 202) --font2
txt_galleryNoData = "NO SPRITE DATA FOUND."
txt_galleryUnknown = "???"

--Gallery Size Definition
galleryColumns = 3
galleryHiddenColumns = 0
galleryRows = 2
galleryHiddenRows = 3

--Gallery Window
galleryWindowX1 = 0
galleryWindowY1 = 40
galleryWindowX2 = 320
galleryWindowY2 = 178

--Gallery Art Common Values
galleryPreviewArtPosX = 940
galleryPreviewArtPosY = 1270

galleryPreviewArtSpacingX = 950
galleryPreviewArtSpacingY = 218

galleryPreviewArtScaleX = 0.0558
galleryPreviewArtScaleY = 0.0558

--Preview Slot Item
galleryPreviewSlot = animNew(sprIkemen, [[
20,0, 0,0, -1
]])
animSetScale(galleryPreviewSlot, 1.0, 1.0)

galleryPreviewSlotPosX = 5
galleryPreviewSlotPosY = 43

galleryPreviewSlotSizeX = 96
galleryPreviewSlotSizeY = 56

galleryPreviewSlotSpacingX = 6
galleryPreviewSlotSpacingY = 6

--Preview Cursor
galleryPreviewCursor = animNew(sprIkemen, [[
22,0, 0,0, -1
]])
animSetScale(galleryPreviewCursor, 1.0, 1.0)

galleryPreviewCursorPosX = 5
galleryPreviewCursorPosY = 43

galleryPreviewCursorSizeX = 96
galleryPreviewCursorSizeY = 56

galleryPreviewCursorSpacingX = 6
galleryPreviewCursorSpacingY = 6

--Preview Unknown
galleryPreviewUnknown = animNew(sprIkemen, [[
23,0, 0,0, -1
]])
animSetScale(galleryPreviewUnknown, 1.0, 1.0)

galleryPreviewUnknownPosX = 6.9
galleryPreviewUnknownPosY = 44.9

galleryPreviewUnknownSizeX = 90
galleryPreviewUnknownSizeY = 50

galleryPreviewUnknownSpacingX = 12
galleryPreviewUnknownSpacingY = 12

--Info BG
galleryInfoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(galleryInfoBG, -54, 199)
animSetScale(galleryInfoBG, 430, 20)
animSetAlpha(galleryInfoBG, 0, 50)
animUpdate(galleryInfoBG)

--Menu Arrows
function f_resetGalleryArrowsPos()
animSetPos(menuArrowLeft, 0, 190)
animSetPos(menuArrowRight, 310, 190)
end

function drawGalleryInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 0) --For Up
	animPosDraw(inputHintsBG, -56, 219) --For Down
	drawMenuInputHints(
		"q","12,1","w","290,1",
		"u","30,"..inputHintYPos,"d","50,"..inputHintYPos,"l","70,"..inputHintYPos,"r","90,"..inputHintYPos,"s","150,"..inputHintYPos,"e","215,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Previous", 33, 14)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, "Next:", 266, 14)
	--
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 111, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 236, hintFontYPos)
end

--;===========================================================
--; ARTWORK DISPLAY SCREENPACK DEFINITION
--;===========================================================
txt_artInfo = createTextImg(font5, 0, 0, "", 159, 180) --font2

galleryArtPosX = 160
galleryArtPosY = 120

galleryArtSizeX = 894
galleryArtSizeY = 894

galleryArtScaleX = 0.27
galleryArtScaleY = 0.27

galleryArtMoveSpeed = 10
galleryArtZoomSpeed = 0.01

galleryArtZoomLimitX = 0.05
galleryArtZoomLimitY = 1.99

galleryArtMoveLimitX1 = -320
galleryArtMoveLimitY1 = -300
galleryArtMoveLimitX2 = 420
galleryArtMoveLimitY2 = 640

--Background
artworkBG = animNew(sprFade, [[
0,1, 0,0, -1
]])
animAddPos(artworkBG, 0, 0)
animUpdate(artworkBG)

--Info BG
artworkInfoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(artworkInfoBG, -54, 166)
animSetScale(artworkInfoBG, 428, 20)
animSetAlpha(artworkInfoBG, 20, 50)
animUpdate(artworkInfoBG)

--Input Hints BG
gInputsBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(gInputsBG, 2.9, 0.75)
animSetAlpha(gInputsBG, 155, 22)

--Menu Arrows
function f_resetArtworkArrowsPos()
animSetPos(menuArrowLeft, 2, 120)
animSetPos(menuArrowRight, 310, 120)
end

--Artwork Input Hints Panel
function drawArtInputHints()
	local inputHintYPosUp = 197
	local inputHintYPosDown = 219
	local hintFont = font2
	local hintFontYPosUp = 211
	local hintFontYPosDown = 233
	animPosDraw(gInputsBG, -56, 195) --Draw Input Hints BG
	drawMenuInputHints(
		"a","15,"..inputHintYPosUp,"s","75,"..inputHintYPosUp,"y","169,"..inputHintYPosUp,"z","242,"..inputHintYPosUp,
		"u","0,"..inputHintYPosDown,"d","20,"..inputHintYPosDown,"l","40,"..inputHintYPosDown,"r","60,"..inputHintYPosDown,"e","108,"..inputHintYPosDown,"q","165,"..inputHintYPosDown,"w","229,"..inputHintYPosDown,"x","277,"..inputHintYPosDown
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Switch", 36, hintFontYPosUp)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Reset Position", 96, hintFontYPosUp)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Zoom Out", 190, hintFontYPosUp)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Zoom In", 263, hintFontYPosUp)
	--
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Move", 81, hintFontYPosDown)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 129, hintFontYPosDown)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Previous", 186, hintFontYPosDown)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Next", 250, hintFontYPosDown)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Hide", 298, hintFontYPosDown)
end

--;===========================================================
--; GALLERY MENU (view pictures, storyboards and video cutscenes)
--;===========================================================
function f_drawGalleryPreview(sffData, group, index, x, y, scaleX, scaleY, x1, y1, x2, y2, alphaS, alphaD)
	local x = x or 0
	local y = y or 0
	local scaleX = scaleX or 1
	local scaleY = scaleY or 1
	local alphaS = alphaS or 255
	local alphaD = alphaD or 0
	local anim = group .. ',' .. index .. ',' .. x .. ',' .. y .. ',' .. '-1'
	anim = animNew(sffData, anim)
	animSetAlpha(anim, alphaS, alphaD)
	animSetScale(anim, scaleX, scaleY)
	animSetWindow(anim, x1, y1, x2, y2)
	animUpdate(anim)
	animDraw(anim)
end

function f_setGalleryCursorPos() --Used to calculate gallery cursor pos in gallery menu
	galleryCursor = (galleryCursorX+(galleryColumns+galleryHiddenColumns)*galleryCursorY) + 1
end

function f_drawGallery(t, columns, rows) --Draw Gallery Content
	local unlockSection = nil
	local sprData = nil
	if galleryMenu == 1 then
		sprData = sprArtworks
		unlockSection = 'artworks'
	elseif galleryMenu == 2 then
		sprData = sprStoryboards
		unlockSection = 'storyboards'
	elseif galleryMenu == 3 then
		sprData = sprMovies
		unlockSection = 'videos'
	end
	for i=0, columns-1 do
		for j=0, rows-1 do
			local index = (i + columns * j) + 1 --This is the same logic of f_setGalleryCursorPos() function
			if index <= #t then
			--Draw Preview Cell Slots
				animPosDraw(
					galleryPreviewSlot,
					galleryPreviewSlotPosX + i * (galleryPreviewSlotSizeX + galleryPreviewSlotSpacingX) - (galleryMoveX * (galleryPreviewSlotSizeX + galleryPreviewSlotSpacingX)),
					galleryPreviewSlotPosY + j * (galleryPreviewSlotSizeY + galleryPreviewSlotSpacingY) - (galleryMoveY * (galleryPreviewSlotSizeY + galleryPreviewSlotSpacingY))
				)
				animSetWindow(galleryPreviewSlot, galleryWindowX1, galleryWindowY1, galleryWindowX2, galleryWindowY2)
			--Draw Preview (only if has Spr Data defined)
				if t[index].spr[1] and t[index].spr[2] ~= nil then
					if t_unlockLua[unlockSection][t[index].id] == nil then --If the artwork is Unlocked
						f_drawGalleryPreview(
							sprData,
							t[index].spr[1], t[index].spr[2],
							t[index].previewpos[1] + i * (t[index].size[1] + t[index].previewspacing[1]) - (galleryMoveX * (t[index].size[1] + t[index].previewspacing[1])),
							t[index].previewpos[2] + j * (t[index].size[2] + t[index].previewspacing[2]) - (galleryMoveY * (t[index].size[2] + t[index].previewspacing[2])),
							t[index].previewscale[1], t[index].previewscale[2],
							galleryWindowX1, galleryWindowY1, galleryWindowX2, galleryWindowY2
						)
					else --If the artwork is Locked
						animPosDraw(
							galleryPreviewUnknown,
							galleryPreviewUnknownPosX + i * (galleryPreviewUnknownSizeX + galleryPreviewUnknownSpacingX) - (galleryMoveX * (galleryPreviewUnknownSizeX + galleryPreviewUnknownSpacingX)),
							galleryPreviewUnknownPosY + j * (galleryPreviewUnknownSizeY + galleryPreviewUnknownSpacingY) - (galleryMoveY * (galleryPreviewUnknownSizeY + galleryPreviewUnknownSpacingY))
						)
						animSetWindow(galleryPreviewUnknown, galleryWindowX1, galleryWindowY1, galleryWindowX2, galleryWindowY2)
					end
				end
			end
		end
	end
end

function f_updateGallery() --When move through gallery sections, update gallery content
	galleryCursorX = 0
	galleryCursorY = 0
	galleryMoveX = 0
	galleryMoveY = 0
	f_setGalleryCursorPos()
	
	gallerySlotMax = (galleryColumns + galleryHiddenColumns)*(galleryRows + galleryHiddenRows)
	galleryArtMax = nil
	if gallerySlotMax > #t_gallery[galleryMenu] then
		galleryArtMax = #t_gallery[galleryMenu] --Set artworks loaded in t_gallery as gallerySlotMax amount to prevent issues
	else
		galleryArtMax = gallerySlotMax
	end
end

function f_galleryMenu()
	if data.debugMode then f_loadGalleryDat() end --Load in real-time only if dev/debug mode is enabled
	cmdInput()
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local bufq = 0
	local bufw = 0
	local textData = nil
	local cursorSectionPosX = 1
	local moveSectionTxt = 0
	local maxSectionItems = 3
	galleryMenu = 1
	f_updateGallery()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	f_resetGalleryArrowsPos()
	f_unlock(false)
	f_updateUnlocks()
	while true do
	--BACK BUTTON
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			break
	--PREVIOUS SECTION
		elseif commandGetState(p1Cmd, 'q') or commandGetState(p2Cmd, 'q') or ((commandGetState(p1Cmd, 'holdq') or commandGetState(p2Cmd, 'holdq')) and bufq >= 30) then
			if galleryMenu > 1 then
				sndPlay(sndSys, 100, 0)
				galleryMenu = galleryMenu - 1
				f_updateGallery()
			end
	--NEXT SECTION
		elseif commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') or ((commandGetState(p1Cmd, 'holdw') or commandGetState(p2Cmd, 'holdw')) and bufw >= 30) then
			if galleryMenu < #t_gallery then
				sndPlay(sndSys, 100, 0)
				galleryMenu = galleryMenu + 1
				f_updateGallery()
			end
	--SCROLL UP (Cursor Y - Previous Row)
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			if galleryCursorY > 0 then
				galleryCursorY = galleryCursorY - 1
			--Hidden Rows Logic
				if galleryMoveY > 0 then
					galleryMoveY = galleryMoveY - 1
				end
			else --Wrap
				galleryCursorY = galleryRows-1 + galleryHiddenRows
				--if galleryHiddenRows > 0 then
					galleryMoveY = galleryHiddenRows
				--end
			end
			f_setGalleryCursorPos() --Set New Cursor Pos
		--Prevent fall out of t_gallery items
			if galleryCursor > galleryArtMax then
				while t_gallery[galleryMenu][galleryCursor] == nil do
					galleryCursorY = galleryCursorY - 1
					if galleryMoveY > 0 then
						galleryMoveY = galleryMoveY - 1
					end
					f_setGalleryCursorPos()
				end
			end
	--SCROLL DOWN (Cursor Y - Next Row)
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			if galleryCursorY < galleryRows-1 + galleryHiddenRows then
				galleryCursorY = galleryCursorY + 1
			--Hidden Rows Logic
				if galleryCursorY > galleryRows-1 then
					galleryMoveY = galleryMoveY + 1
				end
			else --Wrap
				galleryCursorY = 0
				galleryMoveY = 0
			end
			f_setGalleryCursorPos() --Set New Cursor Pos
		--Prevent fall out of t_gallery items
			if galleryCursor > galleryArtMax then
				galleryCursorY = 0
				galleryMoveY = 0
				f_setGalleryCursorPos()
			end
	--SCROLL LEFT (Cursor X - Previous Column)
		elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
			sndPlay(sndSys, 100, 0)
			if galleryCursorX > 0 then
				galleryCursorX = galleryCursorX - 1
			--Hidden Columns Logic
				if galleryMoveX > 0 then
					galleryMoveX = galleryMoveX - 1
				end
			else --Wrap
				galleryCursorX = galleryColumns-1 + galleryHiddenColumns
				--if galleryHiddenColumns > 0 then
					galleryMoveX = galleryHiddenColumns
				--end
			end
			f_setGalleryCursorPos() --Set New Cursor Pos
		--Prevent fall out of t_gallery items
			if galleryCursor > galleryArtMax then
				while t_gallery[galleryMenu][galleryCursor] == nil do
					galleryCursorX = galleryCursorX - 1
					if galleryMoveX > 0 then
						galleryMoveX = galleryMoveX - 1
					end
					f_setGalleryCursorPos()
				end
			end
	--SCROLL RIGHT (Cursor X - Next Column)
		elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
			sndPlay(sndSys, 100, 0)
			if galleryCursorX < galleryColumns-1 + galleryHiddenColumns then
				galleryCursorX = galleryCursorX + 1
			--Hidden Columns Logic
				if galleryCursorX > galleryColumns-1 then
					galleryMoveX = galleryMoveX + 1
				end
			else --Wrap
				galleryCursorX = 0
				galleryMoveX = 0
			end
			f_setGalleryCursorPos() --Set New Cursor Pos
		--Prevent fall out of t_gallery items
			if galleryCursor > galleryArtMax then
				galleryCursorX = 0
				galleryMoveX = 0
				f_setGalleryCursorPos()
			end
	--ENTER BUTTON
		elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
		--ARTWORK (watch pictures)
			if galleryMenu == 1 then
				if t_unlockLua.artworks[galleryCursor] == nil then --If the artwork is unlocked
					sndPlay(sndSys, 100, 1)
					f_artMenu(galleryArtMax)
					f_setGalleryCursorPos() --Replace with a logic that calculates the new position of the cursor after having moved in artwork viewer...
				else
					sndPlay(sndSys, 100, 5)
				end
		--STORYBOARDS (watch storyboards)
			elseif galleryMenu == 2 and t_gallery[galleryMenu][galleryCursor].file ~= nil then
				if t_unlockLua.storyboards[galleryCursor] == nil then --If the storyboard is unlocked
					sndPlay(sndSys, 100, 1)
				--Play Storyboard
					cmdInput()
					f_storyboard(t_gallery[galleryMenu][galleryCursor].file) --Start Storyboard
				--When Storyboard Ends:
					data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
					f_menuMusic()
				else
					sndPlay(sndSys, 100, 5)
				end
		--CUTSCENES (watch video cutscenes)
			elseif galleryMenu == 3 and t_gallery[galleryMenu][galleryCursor].file ~= nil then
				if t_unlockLua.videos[galleryCursor] == nil then --If the video is unlocked
					sndPlay(sndSys, 100, 1)
					playVideo(t_gallery[galleryMenu][galleryCursor].file)
				--When Video Ends:
					data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
					f_menuMusic()
				else
					sndPlay(sndSys, 100, 5)
				end
		--SCREENSHOTS (view your screenshots collection)
			--elseif galleryMenu == 4 then
				--Do it when we can load png using IMGLoad c++ function
			end
		end
	--Section Cursor position calculation
		if galleryMenu < 1 then
			galleryMenu = #t_gallery
			if #t_gallery > maxSectionItems then
				cursorSectionPosX = maxSectionItems
			else
				cursorSectionPosX = #t_gallery
			end
		elseif galleryMenu > #t_gallery then
			galleryMenu = 1
			cursorSectionPosX = 1
		elseif ((commandGetState(p1Cmd, 'q') or commandGetState(p2Cmd, 'q')) or ((commandGetState(p1Cmd, 'holdq') or commandGetState(p2Cmd, 'holdq')) and bufq >= 30)) and cursorSectionPosX > 1 then
			cursorSectionPosX = cursorSectionPosX - 1
		elseif ((commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w')) or ((commandGetState(p1Cmd, 'holdw') or commandGetState(p2Cmd, 'holdw')) and bufw >= 30)) and cursorSectionPosX < maxSectionItems then
			cursorSectionPosX = cursorSectionPosX + 1
		end
		if cursorSectionPosX == maxSectionItems then
			moveSectionTxt = (galleryMenu - maxSectionItems) * 15
		elseif cursorSectionPosX == 1 then
			moveSectionTxt = (galleryMenu - 1) * 15
		end	
		if #t_gallery <= maxSectionItems then
			maxSection = #t_gallery
		elseif galleryMenu - cursorSectionPosX > 0 then
			maxSection = galleryMenu + maxSectionItems - cursorSectionPosX
		else
			maxSection = maxSectionItems
		end
	--Draw BG
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Input Hints Panel
		drawGalleryInputHints()
	--Draw Title Menu
		textImgDraw(txt_galleryTitle)
	--Draw Items Text for Gallery Section Table
		for i=1, maxSection do
			if i > galleryMenu - cursorSectionPosX then
				if i == galleryMenu then
					bank = 5
				else
					bank = 0
				end
				if t_gallery[i].displayname ~= nil then
					textImgDraw(f_updateTextImg(t_gallery[i].txtID, jgFnt, bank, 0, t_gallery[i].displayname, -70+i*115-moveSectionTxt, 36))
				end
			end
		end
	--Draw Left Animated Cursor
		if maxSection > maxSectionItems then
			animDraw(menuArrowLeft)
			animUpdate(menuArrowLeft)
		end
	--Draw Right Animated Cursor
		if #t_gallery > maxSectionItems and maxSection < #t_gallery then
			animDraw(menuArrowRight)
			animUpdate(menuArrowRight)
		end
	--Draw Gallery Content
		f_drawGallery(t_gallery[galleryMenu], galleryColumns+galleryHiddenColumns, galleryRows+galleryHiddenRows)
	--Draw Gallery Cursor
		animPosDraw(
			galleryPreviewCursor,
			galleryPreviewCursorPosX + (galleryCursorX-galleryMoveX) * (galleryPreviewCursorSizeX + galleryPreviewCursorSpacingX),
			galleryPreviewCursorPosY + (galleryCursorY-galleryMoveY) * (galleryPreviewCursorSizeY + galleryPreviewCursorSpacingY)
		)
		animSetWindow(galleryPreviewCursor, galleryWindowX1, galleryWindowY1, galleryWindowX2, galleryWindowY2)
	--Draw Gallery Info
		if t_gallery[galleryMenu][galleryCursor].spr[1] and t_gallery[galleryMenu][galleryCursor].spr[2] ~= nil then
			if (galleryMenu == 1 and t_unlockLua.artworks[t_gallery[galleryMenu][galleryCursor].id] == nil) or
				(galleryMenu == 2 and t_unlockLua.storyboards[t_gallery[galleryMenu][galleryCursor].id] == nil) or
				(galleryMenu == 3 and t_unlockLua.videos[t_gallery[galleryMenu][galleryCursor].id] == nil) then
				textData = t_gallery[galleryMenu][galleryCursor].info
			else
				--textData = t_gallery[galleryMenu][galleryCursor].infolock
				textData = txt_galleryUnknown
			end
		else
			textData = txt_noData
		end
		animDraw(galleryInfoBG) --Draw Info Text BG
		f_textRender(txt_galleryInfo, textData, 0, 159, 208, 10, 0, 55)
	--DEBUG STUFF
	--[[
		f_drawQuickText(txt_debugGalleryCursor, jgFnt, 0, 1, "ITEM: "..galleryCursor, 10, 100+15)
		f_drawQuickText(txt_debugGalleryCursorX, jgFnt, 0, 1, "CURSOR X: "..galleryCursorX, 10, 100+30)
		f_drawQuickText(txt_debugGalleryCursorY, jgFnt, 0, 1, "CURSOR Y: "..galleryCursorY, 10, 100+45)
		f_drawQuickText(txt_debugGalleryMoveX, jgFnt, 0, 1, "MOVE X: "..galleryMoveX, 10, 100+60)
		f_drawQuickText(txt_debugGalleryMoveY, jgFnt, 0, 1, "MOVE Y: "..galleryMoveY, 10, 100+75)
	--]]
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
	--GALLERY MENU BUF KEY CONTROL
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
			bufr = 0
			bufl = 0
			bufu = 0
			bufd = 0
		end
	--GALLERY SECTIONS BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdw') or commandGetState(p2Cmd, 'holdw') then
			bufq = 0
			bufw = bufw + 1
		elseif commandGetState(p1Cmd, 'holdq') or commandGetState(p2Cmd, 'holdq') then
			bufw = 0
			bufq = bufq + 1
		else
			bufw = 0
			bufq = 0
		end
		cmdInput()
		refresh()
	end
end
--;===========================================================================================
--; ARTWORK VIEWER MENU
--;===========================================================================================
function f_drawArtwork()
local artPic = t_gallery[galleryMenu][galleryCursor].spr[1] ..','.. t_gallery[galleryMenu][galleryCursor].spr[2].. ', 0,0, -1'
artPic = animNew(sprArtworks, artPic)
animSetScale(artPic, artScaleX, artScaleY)
animSetPos(artPic, artPosX, artPosY)
animUpdate(artPic)
animDraw(artPic)
end

function f_resetArtPos()
artPosX = t_gallery[galleryMenu][galleryCursor].pos[1]
artPosY = t_gallery[galleryMenu][galleryCursor].pos[2]
artScaleX = t_gallery[galleryMenu][galleryCursor].scale[1]
artScaleY = t_gallery[galleryMenu][galleryCursor].scale[2]
end

function f_nextArt(limit)
	local limit = limit
	galleryCursor = galleryCursor + 1
	if galleryCursor > limit then --Go to first art
		galleryCursor = 1
	end
end

function f_previousArt(limit)
	local limit = limit
	galleryCursor = galleryCursor - 1
	if galleryCursor < 1 then --Go to last art
		galleryCursor = limit
	end
end

function f_getNewCursorPos() --Get new gallery cursor position when exit from artwork viewer (Unfinished)
	galleryCursorX = (galleryCursor - 1) - galleryColumns*galleryCursorY
	galleryCursorY = (galleryCursor - 1 - galleryCursorX) / galleryColumns
end

function f_artMenu(artLimit)
	cmdInput()
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local bufw = 0
	local bufq = 0
	local bufz = 0
	local bufy = 0
	local bufx = 0	
	local maxArt = artLimit
	local artZero = ""
	local artLimitZero = ""
	if maxArt < 10 then artLimitZero = "0" end
	local hideMenu = false
	local textData = nil
	artPosX = nil
	artPosY = nil
	artScaleX = nil
	artScaleY = nil
	f_resetArtPos()
	f_resetArtworkArrowsPos()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
	--RETURN TO GALLERY MENU
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			break
	--NEXT ART PAGE
		elseif ((commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w')) or 
		((commandGetState(p1Cmd, 'holdw') or commandGetState(p2Cmd, 'holdw')) and bufw >= 30)) then
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 3)
			f_nextArt(maxArt)
		--If current item is not unlocked
			while t_unlockLua.artworks[t_gallery[galleryMenu][galleryCursor].id] ~= nil do
				f_nextArt(maxArt) --Go to an unlocked art
			end
			f_resetArtPos()
	--PREVIOUS ART PAGE
		elseif ((commandGetState(p1Cmd, 'q') or commandGetState(p2Cmd, 'q')) or 
		((commandGetState(p1Cmd, 'holdq') or commandGetState(p2Cmd, 'holdq')) and bufq >= 30)) then
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 3)
			f_previousArt(maxArt)
		--If current item is not unlocked
			while t_unlockLua.artworks[t_gallery[galleryMenu][galleryCursor].id] ~= nil do
				f_previousArt(maxArt) --Go to an unlocked art
			end
			f_resetArtPos()
	--RESET ART POSITION
		elseif commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
			f_resetArtPos()
	--HIDE MENU
		elseif commandGetState(p1Cmd, 'x') or commandGetState(p2Cmd, 'x') then
			if not hideMenu then hideMenu = true else hideMenu = false end
		end
	--MOVE UP ART
		if ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or 
		((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 5)) then
			if artPosY > t_gallery[galleryMenu][galleryCursor].movelimit[2] then
				artPosY = artPosY - galleryArtMoveSpeed
			end
	--MOVE DOWN ART
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or 
		((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 5)) then
			if artPosY < t_gallery[galleryMenu][galleryCursor].movelimit[4] then
				artPosY = artPosY + galleryArtMoveSpeed
			end
		end
	--MOVE LEFT ART
		if ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or 
		((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 5)) then
			if artPosX > t_gallery[galleryMenu][galleryCursor].movelimit[1] then
				artPosX = artPosX - galleryArtMoveSpeed
			end
	--MOVE RIGHT ART
		elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or 
		((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 5)) then
			if artPosX < t_gallery[galleryMenu][galleryCursor].movelimit[3] then
				artPosX = artPosX + galleryArtMoveSpeed
			end
		end
	--ZOOM IN ART
		if ((commandGetState(p1Cmd, 'z') or commandGetState(p2Cmd, 'z')) or 
		((commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz')) and bufz >= 10)) then
			if artScaleX < t_gallery[galleryMenu][galleryCursor].zoomlimit[2] and artScaleY < t_gallery[galleryMenu][galleryCursor].zoomlimit[2] then
				artScaleX = artScaleX + galleryArtZoomSpeed
				artScaleY = artScaleY + galleryArtZoomSpeed
			end
	--ZOOM OUT ART
		elseif ((commandGetState(p1Cmd, 'y') or commandGetState(p2Cmd, 'y')) or 
		((commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy')) and bufy >= 10)) then
			if artScaleX > t_gallery[galleryMenu][galleryCursor].zoomlimit[1] and artScaleY > t_gallery[galleryMenu][galleryCursor].zoomlimit[1] then
				artScaleX = artScaleX - galleryArtZoomSpeed
				artScaleY = artScaleY - galleryArtZoomSpeed
			end
		end
		animDraw(artworkBG) --Draw BG
	--Draw Artwork (only if has Spr Data defined)
		if t_gallery[galleryMenu][galleryCursor].spr[1] and t_gallery[galleryMenu][galleryCursor].spr[2] ~= nil then
			f_drawArtwork()
			textData = t_gallery[galleryMenu][galleryCursor].info
		else
			textData = txt_noData
		end
	--Draw HUD Assets
		if not hideMenu then
		--Draw Artwork Info
			animDraw(artworkInfoBG) --Draw Info Text BG
			textImgSetText(txt_artInfo, textData)
			textImgDraw(txt_artInfo)
		--Draw Page Info
			if galleryCursor < 10 then artZero = "0" else artZero = "" end
			f_drawQuickText(txt_galleryPageInfo, font14, 0, -1, "PAGE "..artZero..galleryCursor.."/"..artLimitZero..maxArt, 312, 15) --draw pictures page numbers text
			--if galleryCursor > 1 then
				animDraw(menuArrowLeft)
				animUpdate(menuArrowLeft)
			--end
			--if galleryCursor < maxArt then
				animDraw(menuArrowRight)
				animUpdate(menuArrowRight)
			--end
		end
	--DEBUG STUFF
	--[
		f_drawQuickText(txt_debugGalleryZoom, jgFnt, 0, 1, "ZOOM: "..artScaleX, 10, 15)
		f_drawQuickText(txt_debugGalleryArtPosX, jgFnt, 0, 1, "POS X: "..artPosX, 10, 30)
		f_drawQuickText(txt_debugGalleryArtPosY, jgFnt, 0, 1, "POS Y: "..artPosY, 10, 45)
	--]]
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if not hideMenu then drawArtInputHints() end --Draw Input Hints Panel
	--ART PAGE BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdw') or commandGetState(p2Cmd, 'holdw') then
			bufq = 0
			bufw = bufw + 1
		elseif commandGetState(p1Cmd, 'holdq') or commandGetState(p2Cmd, 'holdq') then
			bufw = 0
			bufq = bufq + 1
		else
			bufq = 0
			bufw = 0
		end
	--VERTICAL BUF KEY CONTROL
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
	--LATERAL BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
		end
	--ZOOM BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz') then
			bufy = 0
			bufz = bufz + 1
		elseif commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy') then
			bufz = 0
			bufy = bufy + 1
		else
			bufz = 0
			bufy = 0
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; LOAD GALLERY.DEF DATA
--;===========================================================
function f_loadGallery(path, reset) --Load def file which contains artworks data
	local reset = reset or false --To reset table
	if reset then t_gallery = {} end
	local file = path
	local section = 0
	local content = f_fileRead(file)
	content = content:gsub('([^\r\n;]*)%s*;[^\r\n]*', '%1')
	content = content:gsub('\n%s*\n', '\n')
	for line in content:gmatch('[^\r\n]+') do
		local lineCase = line:lower()
		if lineCase:match('^%s*%[%s*galleryartworks%s*%]') then
			section = 1
			t_gallery[section] = {}
			t_gallery[section]['displayname'] = "ARTWORKS"
			t_gallery[section]['txtID'] = textImgNew()
		elseif lineCase:match('^%s*%[%s*gallerystoryboards%s*%]') then
			section = 2
			t_gallery[section] = {}
			t_gallery[section]['displayname'] = "STORYBOARDS"
			t_gallery[section]['txtID'] = textImgNew()
		elseif lineCase:match('^%s*%[%s*gallerymovies%s*%]') then
			section = 3
			t_gallery[section] = {}
			t_gallery[section]['displayname'] = "CUTSCENES"
			t_gallery[section]['txtID'] = textImgNew()
		elseif lineCase:match('^%s*%[%w+%]$') then
			section = -1
	--[GalleryArtworks]
		elseif section == 1 then
			local param, value = line:match('^%s*(.-)%s*=%s*(.-)%s*$')
			if param ~= nil and value ~= nil and param ~= '' and value ~= '' then
			--Generate Table to manage each item with default values
				if param:match('^id$') then
					--local newItem = {
					table.insert(t_gallery[section],
						{
							id = value,
							spr = {},
							info = txt_galleryUnknown,
							size = {galleryArtSizeX, galleryArtSizeY},
							pos = {galleryArtPosX, galleryArtPosY},
							scale = {galleryArtScaleX, galleryArtScaleY},
							zoomlimit = {galleryArtZoomLimitX, galleryArtZoomLimitY},
							movelimit = {galleryArtMoveLimitX1, galleryArtMoveLimitY1, galleryArtMoveLimitX2, galleryArtMoveLimitY2},
							previewpos = {galleryPreviewArtPosX, galleryPreviewArtPosY},
							previewspacing = {galleryPreviewArtSpacingX, galleryPreviewArtSpacingY},
							previewscale = {galleryPreviewArtScaleX, galleryPreviewArtScaleY},
							unlock = 'true'
						}
					)
					--table.insert(t_gallery[section], newItem)
			--Store comma separated number values to table
				elseif param:match('^spr$') or param:match('^size$') or param:match('^pos$') or param:match('^scale$') or param:match('^zoomlimit$') or param:match('^movelimit$') or param:match('^previewpos$') or param:match('^previewspacing$') or param:match('^previewscale$') then
					local tbl = {}
					for num in value:gmatch('([^,]+)') do
						table.insert(tbl, tonumber(num))
					end
					if t_gallery[section][#t_gallery[section]] then
						t_gallery[section][#t_gallery[section]][param] = tbl
					end
			--Store extra values
				elseif t_gallery[section][#t_gallery[section]] and t_gallery[section][#t_gallery[section]][param] ~= nil then
					t_gallery[section][#t_gallery[section]][param] = value
				end
			end
	--[GalleryStoryboards] / [GalleryMovies]
		elseif section == 2 or section == 3 then
			local param, value = line:match('^%s*(.-)%s*=%s*(.-)%s*$')
			if param ~= nil and value ~= nil and param ~= '' and value ~= '' then
			--Generate Table to manage each item with default values
				if param:match('^id$') then
					table.insert(t_gallery[section],
						{
							id = value,
							spr = {},
							file = {},
							size = {galleryArtSizeX, galleryArtSizeY},
							info = txt_galleryUnknown,
							previewpos = {galleryPreviewArtPosX, galleryPreviewArtPosY},
							previewspacing = {galleryPreviewArtSpacingX, galleryPreviewArtSpacingY},
							previewscale = {galleryPreviewArtScaleX, galleryPreviewArtScaleY},
							unlock = 'true'
						}
					)
			--Store comma separated number values to table
				elseif param:match('^spr$') or param:match('^size$') or param:match('^previewpos$') or param:match('^previewspacing$') or param:match('^previewscale$') then
					local tbl = {}
					for num in value:gmatch('([^,]+)') do
						table.insert(tbl, tonumber(num))
					end
					if t_gallery[section][#t_gallery[section]] then
						t_gallery[section][#t_gallery[section]][param] = tbl
					end
			--Store extra values
				elseif t_gallery[section][#t_gallery[section]] and t_gallery[section][#t_gallery[section]][param] ~= nil then
					t_gallery[section][#t_gallery[section]][param] = value
				end
			end
		end
	end
	if data.debugLog then f_printTable(t_gallery, "save/debug/t_gallery.log") end
--[[
	textImgSetText(txt_loading, "LOADING GALLERY...")
	textImgDraw(txt_loading)
	refresh()
]]
end
function f_loadGalleryDat()
	f_loadGallery(galleryArtworksDef, true)
	f_loadGallery(galleryStoryboardsDef, false)
	f_loadGallery(galleryMoviesDef, false)
end
f_loadGalleryDat()
--[[
for k, v in ipairs(t_gallery) do --Set Unlock Conditions
	if main.t_unlockLua.gallery == nil then main.t_unlockLua['gallery'] = {} end
	main.t_unlockLua.gallery[v.id] = v.unlock
end
]]
--[[
for i=1, #t_gallery do
	local section = nil
	if i == 1 then section = "artworks"
	elseif i == 2 then section = "storyboards"
	elseif i == 3 then section = "videos"
	end
	for k, v in ipairs(t_gallery[i]) do --Send Gallery Unlocks Condition to t_unlockLua table
		t_unlockLua[section][v.id] = v.unlock
	end
end
]]