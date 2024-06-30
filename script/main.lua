--;===========================================================
--; INITIAL ACTIONS
--;===========================================================
math.randomseed(os.time())

--Debug stuff
loadDebugFont("font/14x14.fnt")
setDebugScript("script/debug.lua")

--Load Common stuff (shared with pause.lua)
require("script.common")

--Assign Lifebar
loadLifebar(data.lifebar) --path to lifebar stored in "save/data_sav.lua", also adjustable from options

--;===========================================================
--; DISCORD RICH PRESENCE DEFINITION
--;===========================================================
discordGameID = "1200228516554346567" --Discord AppID
discordGameState = "In Logos" --Game State
discordGameDetails = "Create Advanced MUGENS or your own Fighting Game!" --Game State Details
discordGameBigImg = "gameicon" --Discord App Game Icon
discordGameAbout = "Game Name" --Game Description
discordGameMiniIcon = "charactericon" --Discord App Mini Icon
discordGameMiniTxt = "character name" --Mini Icon Description
discordPublicRoomID = "party1234" --Public Room ID
discordPrivateRoomID = "xyzzy" --Private Room ID
discordPrivateJoin = "join" --
discordPrivateWatch = "look" --
discordRoomMax = 2 --Room Max Capacity
discordRoomSize = 0 --Room Capacity. Add 1 when online mode with rich presence works
discordGameInstance = 0 --???

--[[
discordInit(discordGameID) --Start Discord Rich Presence
discordUpdate() --Update Discord Rich Presence
discordEnd() --End Discord Rich Presence
setDiscordState(discordGameState)
setDiscordDetails(discordGameDetails)
setDiscordBigImg(discordGameBigImg)
setDiscordBigTxt(discordGameAbout)
setDiscordMiniImg(discordGameMiniIcon)
setDiscordMiniTxt(discordGameMiniTxt)
setDiscordPartyID(discordPublicRoomID)
setDiscordSecretID(discordPrivateRoomID)
setDiscordSecretJoin(discordPrivateJoin)
setDiscordSecretWatch(discordPrivateWatch)
setDiscordPartyMax(discordRoomMax)
setDiscordPartySize(discordRoomSize)
setDiscordInstance(discordGameInstance)
]]

--;===========================================================
--; GLOBAL VARIABLES DEFINITION
--;===========================================================
onlinegame = false
replaygame = false
coinSystem = true
songsSettings = false
soundTest = false
data.tagmode = 1
data.stageviewer = false
menuSelect = ""
P2overP1 = false
secretTarget = ""
unlockTarget = ""
vnNoSel = true
--Editable Vars
MainFadeInTime = 30
data.rivalMatch = 3 --Set Rival MatchNo to show "Rival Match" Text in Arcade VS Screen

function f_resetArcadeStuff()
data.continueCount = 0 --Restart Times Continue in Arcade
f_saveProgress()
keepLSide = false
keepRSide = false
end

--;===========================================================
--; LOAD ADDITIONAL SCRIPTS
--;===========================================================
assert(loadfile("script/loader.lua"))()
assert(loadfile("script/vn_resources.lua"))()
require("script.options")
require("script.statistics")
require("script.select")
require("script.missions")
require("script.events")
require("script.story")
require("script.visualnovel")
--require("script.adventure")

--;===========================================================
--; UNLOCKS CHECK DEFINITION
--;===========================================================
function f_unlocksCheck()
	assert(loadfile("save/stats_sav.lua"))()
	if data.arcadeClear == true then --Verify if you comply with this condition and then..
		t_selStages[t_stageDef["stages/mountainside temple/hidden path.def"]].unlock = 1 --modify the original value in the table to unlock!
	end
	if data.reika == true then
		t_selChars[t_charAdd["reika murasame"]+1].unlock = 1
	end
	if data.gouki == true then
		t_selChars[t_charAdd["shin gouki"]+1].unlock = 1
	end
	if data.story1_1Unlock == true then
		t_selStages[t_stageDef["stages/mountainside temple/lobby 2 night.def"]].unlock = 1
	end
	if data.story1_2Unlock == true then
		t_selChars[t_charAdd["mako mayama"]+1].unlock = 1
	end
	if data.bossrushClear == true then
		t_selStages[t_stageDef["stages/mountainside temple/hidden path night.def"]].unlock = 1
		t_selStages[t_stageDef["stages/mountainside temple/outside.def"]].unlock = 1
	end
	if data.mission1Status == 1 then
		t_selStages[t_stageDef["stages/mountainside temple/dark corridor.def"]].unlock = 1
	end
	if data.story1_4AStatus == 1 then
		t_selChars[t_charAdd["suave dude"]+1].unlock = 1
	end
	if data.event1Status == 1 then
		t_selStages[t_stageDef["stages/mountainside temple/winter.def"]].unlock = 1
	end
	if data.trainingTime > 1500 then
		t_selStages[t_stageDef["stages/training room 2.def"]].unlock = 1
	end
	f_updateLogs()
end

function f_gameState()
if data.arcadeClear == true then arcadeProgress = 1 elseif data.arcadeClear == false then arcadeProgress = 0 end
if data.survivalClear == true then survivalProgress = 1 elseif data.survivalClear == false then survivalProgress = 0 end
gameProgress = (arcadeProgress + survivalProgress + data.missionsProgress + data.eventsProgress + (data.storiesProgress/100))
gameData = (math.floor((gameProgress * 100 / 11) + 0.5))
--[[
The number (11) is the sumation of true amount of all gameProgress values:
(arcadeProgress = 1 + survivalProgress = 1 + data.missionsProgress = 3 + data.eventsProgress = 3 + data.storiesProgress = 3)
]]
end

function f_progress()
	txt_gameStatus = createTextImg(font14, 0, 0, gameData.."%/100%", 157, 8)
	textImgDraw(txt_gameStatus)
end

--;===========================================================
--; DRAW REFERENCES
--;===========================================================

--animName = animNew(sysSff, [[ 
--grpNo, indexNo, x, y, time, facing, trans
--]])

--[[

Description: Assigns new animation to animName variable of your choice.

Required parameters:
grpNo: SFF sprite's group number
indexNo: SFF sprite's image number
x: X offset to the sprite's position;
y: Y offset to the sprite's position
time: length of time to display the element before moving onto the next, measured in game-ticks (-1 for static)

Optional parameters:
facing: H = Flip horizontally; V = Flip vertically
trans: transparency blending a = add; a1 = add1; s = sub; AS???D??? (??? - values of the source and destination alpha)

]]

--[[

animAddPos(animName, addX, addY)
Description: Dynamically assigns x- and y-velocities movement in direction depending on the value.

animSetPos(animName, setX, setY)
Description: Changes x- and y-position.

animSetScale(animName, scaleX, scaleY)
Description: scaleX: horizontal scale factor; scaleY: vertical scale factor.

animSetWindow(animName, x1, y1, x2, y2)
Description: Limits animation to window starting at x1, y1 coordinates; x2, y2 enlarges window by specified amount of pixels moving right and down from the x1, y1.

animSetTile(animName, hTiling, vTiling)
Description: Specifies if the background element should be repeated (tiled) in the horizontal and/or vertical directions, respectively.
0 = no tiling; 1 = infinite tiling; any value greater than 1 = element to tile that number of times.

animSetAlpha(animName, transRange1, transRange2)
Description: Assigns alpha channel to element. Ranges: 0-255.

animSetColorKey(animName, colorKey)
Description: Sets background color from palette (0-255), -1 if background shouldn't be removed. 0 by default.

animUpdate(animName)
Description: Updates previously specified animation by 1 tick.

animDraw(animName)
Description: Draw element on screen [Refresh() function resets the screen, so this one often needs to be used at each frame, even if the element is static].

]]

--;===========================================================
--; MAIN MENU SCREENPACK
--;===========================================================
--Buttons Background
titleBG0 = animNew(sysSff, [[
5,1, 0,125, -1
]])
animAddPos(titleBG0, 160, 0)
animSetTile(titleBG0, 1, 1)
animSetWindow(titleBG0, 0, 125, 320, 78)
--[[parallax is not supported yet
type  = parallax
width = 400, 1200
yscalestart = 100
yscaledelta = 1
]]

--Buttons Background (fade)
titleBG1 = animNew(sysSff, [[
5,2, -160,125, -1, 0, s
]])
animAddPos(titleBG1, 160, 0)
animUpdate(titleBG1)

--Background Top
titleBG2 = animNew(sysSff, [[
5,0, 0,10, -1
]])
animAddPos(titleBG2, 160, 0)
animSetTile(titleBG2, 1, 2)
animSetWindow(titleBG2, -54, 0, 428, 118)

--Logo
titleBG3 = animNew(sysSff, [[
0,0, 0,20, -1, 0, a
]])
animAddPos(titleBG3, 160, 0)
animUpdate(titleBG3)

--Background Middle (black text cover)
titleBG4 = animNew(sysSff, [[
5,1, 0,125, -1
]])
animAddPos(titleBG4, 160, 0)
animSetTile(titleBG4, 1, 1)
animSetWindow(titleBG4, 0, 118, 320, 7)
animSetAlpha(titleBG4, 0, 0)
animUpdate(titleBG4)

--Background Bottom (black text cover)
titleBG5 = animNew(sysSff, [[
5,1, 0,125, -1
]])
animAddPos(titleBG5, 160, 0)
animSetTile(titleBG5, 1, 1)
animSetWindow(titleBG5, 0, 203, 320, 40)
animSetAlpha(titleBG5, 0, 0)
animUpdate(titleBG5)

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

--Message Fade BG
fadeWindowBG = animNew(sysSff, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(fadeWindowBG, -54, 0)
animSetScale(fadeWindowBG, 427, 240)
animUpdate(fadeWindowBG)

--Up Menu Arrow
arrowsU = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(arrowsU, 153.5, 116)
animUpdate(arrowsU)
animSetScale(arrowsU, 0.5, 0.5)

--Down Menu Arrow
arrowsD = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(arrowsD, 153.5, 204)
animUpdate(arrowsD)
animSetScale(arrowsD, 0.5, 0.5)

--;===========================================================
--; SCREENPACK ORDER DEFINITION
--;===========================================================
function drawBottomMenuSP() --Below Menu Fonts
	animDraw(f_animVelocity(titleBG0, -2.15, 0))
end

txt_subTitle = createTextImg(font3, 0, 0, "", 159, 100) --Cool fonts: 3, 5, 6, 9, 10, 11, 12, 20, 21
function f_titleText()
	if data.vault == "Ultra" then textImgSetText(txt_subTitle, "PLUS ULTRA")
	elseif data.vault == "Zen" then textImgSetText(txt_subTitle, "PLUS ZEN")
	elseif data.vault == "SSZ" then textImgSetText(txt_subTitle, "SSZ")
	end
	textImgDraw(txt_subTitle)
end

function drawMiddleMenuSP() --After Cursor Box
	--assert(loadfile("script/screenpack.lua"))() --Edit Screenpack in Real Time
	animDraw(titleBG1)
	animAddPos(titleBG2, -1, 0)
	animUpdate(titleBG2)
	animDraw(titleBG2)
	animDraw(titleBG3)
	animDraw(titleBG4)
	animDraw(titleBG5)
	animDraw(titleBG6)
	f_titleText()
end

function drawTopMenuSP()
	
end

function drawInfoInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	drawInputHintsP1("w","70,"..inputHintYPos,"q","190,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 91, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 211, hintFontYPos)
end

function drawAttractInputHints()
	local inputHintYPos = 217
	local hintFont = font2
	local hintFontYPos = 231
	drawInputHintsP1("w","5,"..inputHintYPos,"s","90,"..inputHintYPos,"e","160,"..inputHintYPos,"q","230,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Add Coin", 26, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start", 111, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 181, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 251, hintFontYPos)
end

function drawTitleInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	drawInputHintsP1("w","50,"..inputHintYPos,"e","120,"..inputHintYPos,"q","190,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start", 71, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 211, hintFontYPos)
end

function drawMenuInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

function drawSideInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	drawInputHintsP1("l","0,"..inputHintYPos,"r","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

function drawListInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

function drawConfirmInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

--;===========================================================
--; F1 INFOBOX MESSAGE
--;===========================================================
infoboxCfg = createTextImg(font1, 0, 1, "", 0, 0)
txt_infobox = [[















This is an unofficial version of S-SIZE Ikemen Engine maintained by CD2.

* This is a public development release, for testing purposes.
* This build may contain bugs and incomplete features.
* Your help and cooperation are appreciated!
* Ikemen GO engine is the lastest and supported version by original developers.
* Original repo source code: https://osdn.net/users/supersuehiro/
 ]]

function f_infoboxMenu()
	cmdInput()
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Info Text
	f_textRender(infoboxCfg, txt_infobox, 0, 2, 10, 8.8, 0, -1)
	--Actions
	if esc() or btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or
	commandGetState(p1Cmd, 'e') or commandGetState(p1Cmd, 'u') or commandGetState(p1Cmd, 'd') or commandGetState(p1Cmd, 'l') or commandGetState(p1Cmd, 'r') or
	commandGetState(p2Cmd, 'e') or commandGetState(p2Cmd, 'u') or commandGetState(p2Cmd, 'd') or commandGetState(p2Cmd, 'l') or commandGetState(p2Cmd, 'r') 
	then
		--sndPlay(sysSnd, 100, 2)
		f_infoboxReset()
	end
	cmdInput()
end

function f_infoboxReset()
	infoboxScreen = false
end

--;===========================================================
--; LOGOS SCREEN
--;===========================================================
function f_mainLogos()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	f_storyboard("data/screenpack/logo.def")
	f_mainOpening()
end
altBGM = false
function f_mainOpening()
	--if altBGM then playBGM(bgmIntroJP) else playBGM(bgmIntro) end
	--f_storyboard("data/screenpack/intro.def")
	playVideo(videoOpening)
	if altBGM then altBGM = false else altBGM = true end --Alternate Storyboard Opening BGM Songs
end

--;===========================================================
--; OK MESSAGE
--;===========================================================
txt_infoTitle = createTextImg(font5, 0, 0, "INFORMATION", 157, 111)
txt_ok = createTextImg(jgFnt, 5, 0, "OK", 159, 151)

--Info Window BG
infoWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(infoWindowBG, 83.5, 97)
animUpdate(infoWindowBG)
animSetScale(infoWindowBG, 1, 1)

function f_infoMenu()
	cmdInput()
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(infoWindowBG)
	animUpdate(infoWindowBG)
	--Draw Info Text
	if charsInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.56,0.56)
		f_textRender(txt_info, "NO CHARACTERS FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif stagesInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO STAGES FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif configInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO ARCADE/SURVIVAL CONFIG FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif towerInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO TOWERS FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif vnInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO VISUAL NOVELS FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif vnDataInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.7,0.7)
		f_textRender(txt_info, "NO SAVED GAMES FOUND.", 0, 160, 130, 10, 0, 25)
	elseif bossInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO BOSSES FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif bonusInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO BONUSES FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif stviewerInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.6,0.6)
		f_textRender(txt_info, "NO STAGE VIEWER FOUND IN SELECT.DEF", 0, 160, 125, 10, 0, 25)
	elseif resolutionInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.56,0.56)
		f_textRender(txt_info, "SET A 16:9 RESOLUTION TO AVOID DESYNC", 0, 160, 125, 10, 0, 25)
	elseif firstRunInfo == true then
		txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0,0.60,0.60)
		f_textRender(txt_info, "WELCOME TO IKEMEN PLUS ULTRA      ENGINE!", 0, 160, 125, 8.8, 0, 36)
	end
	--Draw Ok Text
	textImgDraw(txt_ok)
	--Draw Cursor
	animSetWindow(cursorBox, 87,141, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Info Title Text
	textImgDraw(txt_infoTitle)
	--Draw Input Hints Panel
	drawInfoInputHints()
	--Actions
	if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		sndPlay(sysSnd, 100, 2)
		if firstRunInfo and data.firstRun == true then
			data.firstRun = false
			f_saveProgress()
		end
		f_infoReset()
	end
	cmdInput()
end

function f_infoReset()
	infoScreen = false
	charsInfo = false
	stagesInfo = false
	configInfo = false
	towerInfo = false
	vnInfo = false
	vnDataInfo = false
	bossInfo = false
	bonusInfo = false
	stviewerInfo = false
	resolutionInfo = false
end

--;===========================================================
--; CONFIRM MESSAGE
--;===========================================================
txt_confirmQuestion = createTextImg(jgFnt, 1, 0, "ARE YOU SURE?", 160, 110)

--Confirm Window BG
confirmWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(confirmWindowBG, 83.5, 97)
animUpdate(confirmWindowBG)
animSetScale(confirmWindowBG, 1, 1)

t_confirmMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_confirmMenu()
	cmdInput()
	--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sysSnd, 100, 0)
		confirmMenu = confirmMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sysSnd, 100, 0)
		confirmMenu = confirmMenu + 1
	end
	if confirmMenu < 1 then
		confirmMenu = #t_confirmMenu
		if #t_confirmMenu > 4 then
			cursorPosYConfirm = 4
		else
			cursorPosYConfirm = #t_confirmMenu-1
		end
	elseif confirmMenu > #t_confirmMenu then
		confirmMenu = 1
		cursorPosYConfirm = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorPosYConfirm > 0 then
		cursorPosYConfirm = cursorPosYConfirm - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorPosYConfirm < 4 then
		cursorPosYConfirm = cursorPosYConfirm + 1
	end
	if cursorPosYConfirm == 4 then
		moveTxtConfirm = (confirmMenu - 5) * 13
	elseif cursorPosYConfirm == 0 then
		moveTxtConfirm = (confirmMenu - 1) * 13
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(confirmWindowBG)
	animUpdate(confirmWindowBG)
	--Draw Title
	textImgDraw(txt_confirmQuestion)
	--Draw Table Text
	for i=1, #t_confirmMenu do
		if i == confirmMenu then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_confirmMenu[i].id, jgFnt, bank, 0, t_confirmMenu[i].text, 159, 120+i*13-moveTxtConfirm))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYConfirm*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Input Hints Panel
	drawConfirmInputHints()
	--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sysSnd, 100, 2)
		f_confirmReset()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--YES
		if confirmMenu == 1 then
			sndPlay(sysSnd, 100, 1)
			--DELETE HOST DATA
			if crudHostOption == 1 then
				f_crudHostReset()
				host_rooms.IP[hostRoomName] = nil
				t_tmp = {}
				for i = 1, #t_hostList do
					if i ~= hostList then
					t_tmp[#t_tmp + 1] = t_hostList[i]
					end
				end
				t_hostList = t_tmp
				local file = io.open("save/host_rooms.json","w+")
				file:write(json.encode(host_rooms, {indent = true}))
				file:close()
				f_hostTable() --Refresh
			--DELETE REPLAY
			else
				deleteReplay = true
			end
		--NO
		else
			crudHostOption = 0
			sndPlay(sysSnd, 100, 2)
		end
		f_confirmReset()
	end
	cmdInput()
end

function f_confirmReset()
	confirmScreen = false
	moveTxtConfirm = 0
	--Cursor pos in NO
	cursorPosYConfirm = 1
	confirmMenu = 2
end

function f_resetTemp() --Reset Temp Default Values to Prevent Issues
	data.tempBack = false
	data.replayDone = false
	f_saveTemp()
end

--;===========================================================
--; MENU START
--;===========================================================
function f_mainStart()
	gameTime = (os.clock()/1000)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff) --global variable so we can set it also from within select.lua
	f_infoReset() --Allow select options below if the Engine detects characters or stages
	--First Check (Table generated by Sections)
	if data.engineMode == "FG" then
		if t_selChars == nil then --If the Engine not detect Characters
			charsInfo = true
			infoScreen = true
			f_exitMenu()
		elseif t_selStages == nil then --If the Engine not detect Stages
			stagesInfo = true
			infoScreen = true
			f_exitMenu()
		elseif t_selOptions == nil then --If the Engine not detect Arcade and Survival roster Config in [Options] section from select.def
			configInfo = true
			infoScreen = true
			f_exitMenu()
		end
	elseif data.engineMode == "VN" then
		t_selChars = {}
		t_selStages = {}
		if t_selVN == 0 then --If the Engine not detect Visual Novel
			vnInfo = true
			infoScreen = true
			f_exitMenu()
		end
	end
	--Second Check (Content store in tables)
	if #t_selChars == 0 and data.engineMode == "FG" then --[Characters] section detected but there's not characters added
		charsInfo = true
		infoScreen = true
		f_exitMenu()
	elseif #t_selStages == 0 and data.engineMode == "FG" then --[ExtraStages] section detected but there's not stages added
		stagesInfo = true
		infoScreen = true
		f_exitMenu()
	else --Everything is "ok"
		f_resetTemp()
		f_soundtrack() --Load Soundtrack Tables from common.lua for use in menus
		f_mainLogos()
		if data.engineMode == "VN" then --Engine will load main menu function for Visual Novel Game
			f_mainTitle()
		elseif data.engineMode == "FG" then --Engine will load main menu function for Fighting Game
			f_unlocksCheck() --Check For Unlocked Content
			f_resetArcadeStuff()
			if data.attractMode == true then
				coinSystem = false
				--data.attractCoins = 0 --Enable for Restart Credits for Attract Mode
				--f_saveProgress() --Enable for Restart Credits for Attract Mode
				f_mainAttract()
			else
				f_mainTitle()
			end
		end
	end
end

--;===========================================================
--; ATTRACT MODE MENU
--;===========================================================
txt_coinTitle = createTextImg(jgFnt, 0, 0, "-- INSERT COIN --", 159, 170)
function f_attractCredits()
	txt_credits = createTextImg(font1, 0, -1, "Credits: "..data.attractCoins, 181.5, 212)
	textImgDraw(txt_credits)
end

--Load Common Settings for Demo Mode
function demoModeCfg()
	f_default()
	setGameMode('demo')
	data.gameMode = "demo"
	data.rosterMode = "cpu"
	data.aiFight = true
	data.versusScreen = false
	data.victoryscreen = false
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_randomChars[math.random(#t_randomChars)]} --Pick Random Char
	data.p2Char = {t_randomChars[math.random(#t_randomChars)]} --Pick Random Char
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	script.select.f_selectSimple()
	f_resetTemp()
end

function f_mainAttract()
	cmdInput()
	local t = 0
	attractSeconds = data.attractTime
	attractTimer = attractSeconds*gameTick --Set time for Attract Title Screen
	local demoTimer = 0
	playBGM(bgmTitle)
	f_attractExitItem()
	while true do
		--INSERT COIN
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		   sndPlay(sysSnd, 200, 0)
		   demoTimer = 0
		   data.attractCoins = data.attractCoins + 1
		   f_saveProgress()
		   attractTimer = attractSeconds*gameTick --Reset Timer
		--START GAME MODE
		elseif ((commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's')) or attractTimer == 0) and data.attractCoins > 0 then
		   --playVideo(videoHowToPlay)
		   data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		   sndPlay(sysSnd, 100, 1)
		   data.attractCoins = data.attractCoins - 1
		   f_saveProgress()
		   attractTimer = attractSeconds*gameTick
		   f_default()
		   --data.p1TeamMenu = {mode = 0, chars = 1}
		   --data.p2TeamMenu = {mode = 0, chars = 1}
		   data.p2In = 1
		   data.p2SelectMenu = false
		   data.serviceScreen = true
		   data.arcadeIntro = true
		   data.arcadeEnding = true
		   --data.stageMenu = true
		   setGameMode('arcade')
		   data.gameMode = "arcade"
		   data.rosterMode = "arcade"
		   textImgSetText(txt_mainSelect, "ARCADE")
		   script.select.f_selectAdvance()
		--START DEMO MODE
		elseif demoTimer == 350 then
		   demoModeCfg()
		   f_mainLogos()
		   playBGM(bgmTitle)
		   demoTimer = 0
		   attractTimer = attractSeconds*gameTick
		--EXIT
		elseif esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			attractTimer = attractSeconds*gameTick
			f_exitMenu()
			--attractSeconds = data.attractTime --Load New Attract Time settings in case that you modify them
		end
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		animSetWindow(cursorBox, 0, 160, 290, 13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(titleBG1)
		animAddPos(titleBG2, -1, 0)
		animUpdate(titleBG2)
		animDraw(titleBG2)
		animDraw(titleBG3)
		animDraw(titleBG4)
		animDraw(titleBG5)
		f_titleText()
		f_attractCredits()
		--txt_attractTimer = createTextImg(font1, 0, 0, (attractTimer/gameTick), 302, 235) --Original Decimal Timer
		attractTimeNumber = attractTimer/gameTick --Convert Ticks to Seconds
		nodecimalAttractTime = string.format("%.0f",attractTimeNumber) --Delete Decimals
		txt_attractTimer = createTextImg(font1, 0, 0, nodecimalAttractTime, 302, 215)
		if attractTimer > 0 and data.attractCoins > 0 then
			attractTimer = attractTimer - 0.5 --Activate Title Screen Timer
			textImgDraw(txt_attractTimer)
		else --when attractTimer <= 0
			demoTimer = demoTimer + 1
		end
		f_sysTime()
		drawAttractInputHints()
		if t%60 < 30 then
			if data.attractCoins > 0 then
				textImgDraw(txt_mainTitle)
			else
				textImgDraw(txt_coinTitle)
			end
		end
		t = t >= 60 and 0 or t + 1
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; EXIT MENU
--;===========================================================
t_exitMenu = {
	{id = textImgNew(), text = "CLOSE ENGINE"},
	{id = textImgNew(), text = "RESTART ENGINE"},
}
function f_attractExitItem()
	if data.attractMode == true and infoScreen == false then
		table.insert(t_exitMenu,1,{id = textImgNew(), text = "OPTIONS"})
	end
end

function f_exitMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local exitMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	if charsInfo or stagesInfo or configInfo then playBGM(bgmTitle) end
	f_exitReset()
	while true do
		if not exitScreen and not infoScreen then
			if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				exitMenu = exitMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 4 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 4 then
				moveTxt = (exitMenu - 5) * 13
			elseif cursorPosY == 0 then
				moveTxt = (exitMenu - 1) * 13
			end
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				restartEngine = false
				--EXIT FOR ATTRACT MODE (NO CONTENT)
				if exitMenu == 1 and data.attractMode == true and t_selChars == nil then
					sndPlay(sysSnd, 100, 1)
					exitScreen = true
				elseif exitMenu == 1 and data.attractMode == true and t_selStages == nil then
					sndPlay(sysSnd, 100, 1)
					exitScreen = true
				--RESTART FOR ATTRACT MODE (NO CONTENT)
				elseif exitMenu == 2 and data.attractMode == true and t_selChars == nil then
					sndPlay(sysSnd, 100, 1)
					restartEngine = true
					exitScreen = true
				elseif exitMenu == 2 and data.attractMode == true and t_selStages == nil then
					sndPlay(sysSnd, 100, 1)
					restartEngine = true
					exitScreen = true
				--OPTIONS FOR ATTRACT MODE
				elseif exitMenu == 1 and data.attractMode == true and #t_selChars ~= 0 and #t_selStages ~= 0 then
					sndPlay(sysSnd, 100, 1)
					onlinegame = false
					assert(loadfile("save/data_sav.lua"))()
					script.options.f_mainCfg()
				--EXIT FOR ATTRACT MODE
				elseif exitMenu == 2 and data.attractMode == true and #t_selChars ~= 0 and #t_selStages ~= 0 then
					sndPlay(sysSnd, 100, 1)
					exitScreen = true
				--RESTART FOR ATTRACT MODE
				elseif exitMenu == 3 and data.attractMode == true then
					sndPlay(sysSnd, 100, 1)
					restartEngine = true
					exitScreen = true
				--NORMAL EXIT
				elseif exitMenu == 1 and data.attractMode == false then
					sndPlay(sysSnd, 100, 1)
					exitScreen = true
				--NORMAL RESTART
				elseif exitMenu == 2 and data.attractMode == false then
					sndPlay(sysSnd, 100, 1)
					restartEngine = true
					exitScreen = true
				end
			--BACK
			elseif commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		drawBottomMenuSP()
		for i=1, #t_exitMenu do
			if i == exitMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_exitMenu[i].id, jgFnt, bank, 0, t_exitMenu[i].text, 159, 145+i*13-moveTxt))
		end
		if infoScreen then
			table.remove(t_exitMenu,3) --Remove Option 3 in table if characters or stages are not detected
		end
		if not exitScreen and not infoScreen then
			animSetWindow(cursorBox, 0,148+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_titleFt)
		if not exitScreen and not infoScreen then textImgSetText(txt_titleFt, "CLOSE OR RESTART ENGINE") end
		f_sysTime()
		if exitScreen then f_closeMenu() end --Show Exit Screen Message
		if infoScreen then
			f_infoMenu() --Show Info Screen Message
		else
			drawMenuInputHints()
		end
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
--; CLOSE/RESTART MESSAGE
--;===========================================================
txt_question = createTextImg(jgFnt, 1, 0, "ARE YOU SURE?", 160, 110)

--Exit Window BG
exitWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(exitWindowBG, 83.5, 97)
animUpdate(exitWindowBG)
animSetScale(exitWindowBG, 1, 1)

t_closeMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_closeMenu()
	cmdInput()
	--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sysSnd, 100, 0)
		closeMenu = closeMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sysSnd, 100, 0)
		closeMenu = closeMenu + 1
	end
	if closeMenu < 1 then
		closeMenu = #t_closeMenu
		if #t_closeMenu > 4 then
			cursorPosYExit = 4
		else
			cursorPosYExit = #t_closeMenu-1
		end
	elseif closeMenu > #t_closeMenu then
		closeMenu = 1
		cursorPosYExit = 0
	elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') and cursorPosYExit > 0 then
		cursorPosYExit = cursorPosYExit - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') and cursorPosYExit < 4 then
		cursorPosYExit = cursorPosYExit + 1
	end
	if cursorPosYExit == 4 then
		moveTxtExit = (closeMenu - 5) * 13
	elseif cursorPosYExit == 0 then
		moveTxtExit = (closeMenu - 1) * 13
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(exitWindowBG)
	animUpdate(exitWindowBG)
	--Draw Title
	textImgDraw(txt_question)
	--Draw Table Text
	for i=1, #t_closeMenu do
		if i == closeMenu then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_closeMenu[i].id, jgFnt, bank, 0, t_closeMenu[i].text, 159, 120+i*13-moveTxtExit))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYExit*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Bottom Text
	textImgDraw(txt_titleFt)
	if restartEngine == true then
		textImgSetText(txt_titleFt, "THE ENGINE WILL BE RESTARTED")
	else
		textImgSetText(txt_titleFt, "THE ENGINE WILL BE CLOSED")
	end
	--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sysSnd, 100, 2)
		f_exitReset()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
		end
		f_exitReset()
	end
	cmdInput()
end

function f_exitReset()
	exitScreen = false
	moveTxtExit = 0
	--Cursor pos in YES
	cursorPosYExit = 0
	closeMenu = 1
end

--;===========================================================
--; TITLE SCREEN MENU
--;===========================================================
txt_mainTitle = createTextImg(jgFnt, 5, 0, "-- PRESS START --", 159, 170)
--txt_version = createTextImg(font1, 0, -1, "v1.?.0", 319, 240)
txt_version = createTextImg(font1, 0, -1, "Dev. Build", 319, 240)
txt_f1 = createTextImg(font1, 0, 0, "Press F1 for Info", 159, 240)
txt_titleFt = createTextImg(font5, 0, 0, "", 156, 240)

function f_mainTitle()
	cmdInput()
	local i = 0
	local t = 0
	playBGM(bgmTitle)
	while true do
		if i == 500 then
			i = 0
			--if data.engineMode == "FG" then demoModeCfg() end
			f_mainLogos()
			playBGM(bgmTitle)
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			sndPlay(sysSnd, 100, 1) --Play SFX from .snd file
			i = 0
			f_mainMenu()
		elseif esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			i = 0
			sndPlay(sysSnd, 100, 2)
			f_exitMenu()
		end
		drawBottomMenuSP()
		animSetWindow(cursorBox, 0, 160, 290, 13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, "WELCOME TO SUEHIRO IKEMEN ENGINE")
		f_sysTime()
		drawTitleInputHints()
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
--; SIDE SELECT SCREEN
--;===========================================================
txt_sideTitle = createTextImg(font14, 0, 0, "SIDE SELECT", 157, 8, 0.9, 0.9)
txt_sideWarning = createTextImg(font6, 0, 0, "THE SIDE SELECTED IS NOT ALLOWED FOR THIS GAME MODE", 157, 70, 0.75, 0.75)

--Gamepad Icon
gamepadIcon = animNew(sysSff, [[20,0, 0,0,]])

--Lifebars Image
lifebarsImg = animNew(sysSff, [[21,0, 0,0,]])

--Left Arrows
L_arrow = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])

--Right Arrows
R_arrow = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])

function f_sideSelect()
	--controller icon config
	local p1gamepadPosY = 86.5
	local p2gamepadPosY = 150
	local gamepadScale = 0.10
	--text config
	local p1txtPosY = 88
	local p2txtPosY = 152
	local txtScale = 0.7
	local txtFont = font13
	local txtP1name = "PLAYER 1"
	local txtP2name = "PLAYER 2"
	local txtP1color = 0
	local txtP2color = 1
	--arrows confg
	local p1arrowPosY = 107.5
	local p2arrowPosY = 167.5
	local arrowScale = 0.5
	--Center X Position
	local gamepadPosXcenter = 122
	local txtPosXcenter = 159
	local arrowLposXcenter = 104
	local arrowRposXcenter = 205
	--Left X Position
	local gamepadPosXleft = 5
	local txtPosXleft = 42
	local arrowRposXleft = 88.5
	--Right X Position
	local gamepadPosXright = 240
	local txtPosXright = 277
	local arrowLposXright = 220
	local function f_cpuL() f_drawQuickText(txt_sideCPU, font14, 0, 0, "CPU", txtPosXleft, 120) end
	local function f_cpuR() f_drawQuickText(txt_sideCPU, font14, 0, 0, "CPU", txtPosXright, 120) end
	cmdInput() --Read Inputs
	--P1 Cursor Position
	if commandGetState(p1Cmd, 'l') then
		if p1Side > -1 then
			sndPlay(sysSnd, 100, 0)
			p1Side = p1Side - 1
		end
		sideWarning = false
	elseif commandGetState(p1Cmd, 'r') then
		if p1Side < 1 then
			sndPlay(sysSnd, 100, 0)
			p1Side = p1Side + 1
		end
		sideWarning = false
	end
	--P2 Cursor Position
	if commandGetState(p2Cmd, 'l') then
		if p2Side > -1 then
			sndPlay(sysSnd, 100, 0)
			p2Side = p2Side - 1
		end
		sideWarning = false
	elseif commandGetState(p2Cmd, 'r') then
		if p2Side < 1 then
			sndPlay(sysSnd, 100, 0)
			p2Side = p2Side + 1
		end
		sideWarning = false
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Screen Title
	textImgDraw(txt_sideTitle)
	--Draw Side Texts
	f_drawQuickText(txt_sideInfo, font6, 0, 0, "LEFT SIDE", 42, 25, 0.9, 0.9)
	f_drawQuickText(txt_sideInfo, font6, 0, 0, "RIGHT SIDE", 277, 25, 0.9, 0.9)
	--CPU VS CPU
	if p1Side == 0 and p2Side == 0 then
		f_cpuL()
		f_cpuR()
	end
	--P1 & P2 VS CPU
	if p1Side == -1 and p2Side == -1 then
		f_cpuR()
	end
	--CPU VS P1 & P2 (Not available yet)
	if p1Side == 1 and p2Side == 1 then
		f_cpuL()
	end
	--P1 VS CPU
	if p1Side == -1 and p2Side == 0 then
		f_cpuR()
	end
	--P2 VS CPU
	if p2Side == -1 and p1Side == 0 then
		f_cpuR()
	end
	--CPU VS P1
	if p2Side == 0 and p1Side == 1 then
		f_cpuL()
	end
	--CPU VS P2
	if p1Side == 0 and p2Side == 1 then
		f_cpuL()
	end
	--Draw Lifebars
	f_drawQuickSpr(lifebarsImg, 3.5, 30, 0.25, 0.25, 200)
	--Draw P1 Assets
	if p1Side == 0 then --Draw in Middle
		f_drawQuickSpr(gamepadIcon, gamepadPosXcenter, p1gamepadPosY, gamepadScale, gamepadScale) --Gamepad
		f_drawQuickSpr(L_arrow, arrowLposXcenter, p1arrowPosY, arrowScale, arrowScale) --Left Arrow
		f_drawQuickSpr(R_arrow, arrowRposXcenter, p1arrowPosY, arrowScale, arrowScale) --Right Arrow
		f_drawQuickText(txt_sidePNo, txtFont, txtP1color, 0, txtP1name, txtPosXcenter, p1txtPosY, txtScale, txtScale) --Player ID
	elseif p1Side == -1 then --Draw in Left
		f_drawQuickSpr(gamepadIcon, gamepadPosXleft, p1gamepadPosY, gamepadScale, gamepadScale) --Gamepad
		f_drawQuickSpr(R_arrow, arrowRposXleft, p1arrowPosY, arrowScale, arrowScale) --Right Arrow
		f_drawQuickText(txt_sidePNo, txtFont, txtP1color, 0, txtP1name, txtPosXleft, p1txtPosY, txtScale, txtScale) --Player ID
	elseif p1Side == 1 then --Draw in Right
		f_drawQuickSpr(gamepadIcon, gamepadPosXright, p1gamepadPosY, gamepadScale, gamepadScale) --Gamepad
		f_drawQuickSpr(L_arrow, arrowLposXright, p1arrowPosY, arrowScale, arrowScale) --Left Arrow
		f_drawQuickText(txt_sidePNo, txtFont, txtP1color, 0, txtP1name, txtPosXright, p1txtPosY, txtScale, txtScale) --Player ID
	end
	--Draw P2 Assets
	if p2Side == 0 then
		f_drawQuickSpr(gamepadIcon, gamepadPosXcenter, p2gamepadPosY, gamepadScale, gamepadScale)
		f_drawQuickSpr(L_arrow, arrowLposXcenter, p2arrowPosY, arrowScale, arrowScale)
		f_drawQuickSpr(R_arrow, arrowRposXcenter, p2arrowPosY, arrowScale, arrowScale)
		f_drawQuickText(txt_sidePNo, txtFont, txtP2color, 0, txtP2name, txtPosXcenter, p2txtPosY, txtScale, txtScale)
	elseif p2Side == -1 then
		f_drawQuickSpr(gamepadIcon, gamepadPosXleft, p2gamepadPosY, gamepadScale, gamepadScale)
		f_drawQuickSpr(R_arrow, arrowRposXleft, p2arrowPosY, arrowScale, arrowScale)
		f_drawQuickText(txt_sidePNo, txtFont, txtP2color, 0, txtP2name, txtPosXleft, p2txtPosY, txtScale, txtScale)
	elseif p2Side == 1 then
		f_drawQuickSpr(gamepadIcon, gamepadPosXright, p2gamepadPosY, gamepadScale, gamepadScale)
		f_drawQuickSpr(L_arrow, arrowLposXright, p2arrowPosY, arrowScale, arrowScale)
		f_drawQuickText(txt_sidePNo, txtFont, txtP2color, 0, txtP2name, txtPosXright, p2txtPosY, txtScale, txtScale)
	end
	--Draw Input Hint Panel
	drawSideInputHints()
	--Draw Side Warning Message
	if sideWarning then
		textImgDraw(txt_sideWarning)
		data.p2In = 2 --Keep Active Player 2 Control
	end
--Actions
	--Back
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sysSnd, 100, 2)
		f_sideReset()
	--Confirm
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
	--Load Common Modes Config
		if menuSelect == "quick match" then randomModeCfg()
		elseif menuSelect == "free battle" then freeModeCfg()
		elseif menuSelect == "arcade" then arcadeCfg()
		elseif menuSelect == "tower" then towerCfg()
		elseif menuSelect == "survival" then survivalCfg()
		elseif menuSelect == "boss" then bossCfg()
		elseif menuSelect == "boss rush" then bossrushCfg()
		elseif menuSelect == "bonus" then bonusCfg()
		elseif menuSelect == "bonus rush" then bonusrushCfg()
		elseif menuSelect == "time attack" then timeattackCfg()
		elseif menuSelect == "score attack" then scoreattackCfg()
		elseif menuSelect == "sudden death" then suddenCfg()
		elseif menuSelect == "endless" then endlessCfg()
		end
--Reference: -1 (Left Side), 0 (No Side/CPU), 1 (Right Side)
	--CPU VS CPU
		if p1Side == 0 and p2Side == 0 then
			if menuSelect == "quick match" then randomCPUvsCPU()
			elseif menuSelect == "free battle" then freeCPUvsCPU()
			elseif menuSelect == "arcade" then arcadeCPUvsCPU()
			elseif menuSelect == "tower" then towerCPUvsCPU()
			elseif menuSelect == "survival" then survivalCPUvsCPU()
			elseif menuSelect == "boss" then bossCPUvsCPU()
			elseif menuSelect == "boss rush" then bossrushCPUvsCPU()
			elseif menuSelect == "time attack" then timeattackCPUvsCPU()
			elseif menuSelect == "score attack" then scoreattackCPUvsCPU()
			elseif menuSelect == "sudden death" then suddenCPUvsCPU()
			elseif menuSelect == "endless" then endlessCPUvsCPU()
			end
			if menuSelect ~= "bonus rush" and menuSelect ~= "bonus" then
				sideSelected = true
			else--if you are in bonus rush mode then
				sndPlay(sysSnd, 100, 5)
				sideWarning = true
			end
		end
	--P1 VS CPU
		if p1Side == -1 and p2Side == 0 then
			if menuSelect == "quick match" then	randomHumanvsCPU()
			elseif menuSelect == "free battle" then freeHumanvsCPU()
			elseif menuSelect == "arcade" then arcadeHumanvsCPU()
			elseif menuSelect == "tower" then towerHumanvsCPU()
			elseif menuSelect == "survival" then survivalHumanvsCPU()
			elseif menuSelect == "boss" then bossHumanvsCPU()
			elseif menuSelect == "boss rush" then bossrushHumanvsCPU()
			elseif menuSelect == "bonus" then bonusHumanvsCPU()
			elseif menuSelect == "bonus rush" then bonusrushHumanvsCPU()
			elseif menuSelect == "time attack" then timeattackHumanvsCPU()
			elseif menuSelect == "score attack" then scoreattackHumanvsCPU()
			elseif menuSelect == "sudden death" then suddenHumanvsCPU()
			elseif menuSelect == "endless" then endlessHumanvsCPU()
			end
			sideSelected = true
		end
	--P2 VS CPU
		if p2Side == -1 and p1Side == 0 then
			P2overP1 = true --Detects Player 2 Control
			if menuSelect == "quick match" then	randomHumanvsCPU()
			elseif menuSelect == "free battle" then freeHumanvsCPU()
			elseif menuSelect == "arcade" then arcadeHumanvsCPU()
			elseif menuSelect == "tower" then towerHumanvsCPU()
			elseif menuSelect == "survival" then survivalHumanvsCPU()
			elseif menuSelect == "boss" then bossHumanvsCPU()
			elseif menuSelect == "boss rush" then bossrushHumanvsCPU()
			elseif menuSelect == "bonus" then bonusHumanvsCPU()
			elseif menuSelect == "bonus rush" then bonusrushHumanvsCPU()
			elseif menuSelect == "time attack" then timeattackHumanvsCPU()
			elseif menuSelect == "score attack" then scoreattackHumanvsCPU()
			elseif menuSelect == "sudden death" then suddenHumanvsCPU()
			elseif menuSelect == "endless" then endlessHumanvsCPU()
			end
			sideSelected = true
		end
	--CPU VS P1
		if p2Side == 0 and p1Side == 1 then
			if menuSelect == "quick match" then	randomCPUvsHuman()
			elseif menuSelect == "free battle" then freeCPUvsHuman()
			elseif menuSelect == "arcade" then arcadeCPUvsHuman()
			elseif menuSelect == "tower" then towerCPUvsHuman()
			elseif menuSelect == "survival" then survivalCPUvsHuman()
			elseif menuSelect == "boss" then bossCPUvsHuman()
			elseif menuSelect == "boss rush" then bossrushCPUvsHuman()
			elseif menuSelect == "bonus" then bonusCPUvsHuman()
			elseif menuSelect == "bonus rush" then bonusrushCPUvsHuman()
			elseif menuSelect == "time attack" then timeattackCPUvsHuman()
			elseif menuSelect == "score attack" then scoreattackCPUvsHuman()
			elseif menuSelect == "sudden death" then suddenCPUvsHuman()
			elseif menuSelect == "endless" then endlessCPUvsHuman()
			end
			sideSelected = true
		end
	--CPU VS P2
		if p1Side == 0 and p2Side == 1 then
			P2overP1 = true --Detects Player 2 Control
			if menuSelect == "quick match" then	randomCPUvsHuman()
			elseif menuSelect == "free battle" then freeCPUvsHuman()
			elseif menuSelect == "arcade" then arcadeCPUvsHuman()
			elseif menuSelect == "tower" then towerCPUvsHuman()
			elseif menuSelect == "survival" then survivalCPUvsHuman()
			elseif menuSelect == "boss" then bossCPUvsHuman()
			elseif menuSelect == "boss rush" then bossrushCPUvsHuman()
			elseif menuSelect == "bonus" then bonusCPUvsHuman()
			elseif menuSelect == "bonus rush" then bonusrushCPUvsHuman()
			elseif menuSelect == "time attack" then timeattackCPUvsHuman()
			elseif menuSelect == "score attack" then scoreattackCPUvsHuman()
			elseif menuSelect == "sudden death" then suddenCPUvsHuman()
			elseif menuSelect == "endless" then endlessCPUvsHuman()
			end
			sideSelected = true
		end
	--P1 VS P2
		if p1Side == -1 and p2Side == 1 then
			if menuSelect == "quick match" then randomHumanvsHuman()
			elseif menuSelect == "free battle" then freeHumanvsHuman()
			end
			if menuSelect == "quick match" or menuSelect == "free battle" then
				sideSelected = true
			else--if you are not in free versus or quick match modes then
				sndPlay(sysSnd, 100, 5)
				sideWarning = true
			end
		end
	--P2 VS P1
		if p2Side == -1 and p1Side == 1 then
			P2overP1 = true
			if menuSelect == "quick match" then randomHumanvsHuman()
			elseif menuSelect == "free battle" then freeHumanvsHuman()
			end
			if menuSelect == "quick match" or menuSelect == "free battle" then
				sideSelected = true
			else--if you are not in free versus or quick match modes then
				sndPlay(sysSnd, 100, 5)
				P2overP1 = false
				sideWarning = true
			end
		end
	--P1&P2 VS CPU [CO-OP MODE]
		if p1Side == -1 and p2Side == -1 then
			--if menuSelect == "quick match" then randomP1P2vsCPU()
			--elseif menuSelect == "free battle" then freeP1P2vsCPU()
			if menuSelect == "arcade" then arcadeP1P2vsCPU()
			elseif menuSelect == "tower" then towerP1P2vsCPU()
			elseif menuSelect == "survival" then survivalP1P2vsCPU()
			elseif menuSelect == "boss rush" then bossrushP1P2vsCPU()
			elseif menuSelect == "bonus rush" then bonusrushP1P2vsCPU()
			elseif menuSelect == "time attack" then timeattackP1P2vsCPU()
			elseif menuSelect == "score attack" then scoreattackP1P2vsCPU()
			elseif menuSelect == "sudden death" then suddenP1P2vsCPU()
			elseif menuSelect == "endless" then endlessP1P2vsCPU()
			end
			if menuSelect ~= "quick match" and menuSelect ~= "free battle" and menuSelect ~= "bonus" and menuSelect ~= "boss" then
				sideSelected = true
			else
				sndPlay(sysSnd, 100, 5)
				sideWarning = true
			end
		end
	--CPU VS P1&P2 [CO-OP MODE] (Not available yet)
		if p1Side == 1 and p2Side == 1 then
			--if menuSelect == "quick match" then randomCPUvsP1P2()
			--elseif menuSelect == "free battle" then freeCPUvsP1P2()
			if menuSelect == "arcade" then arcadeCPUvsP1P2()
			elseif menuSelect == "tower" then towerCPUvsP1P2()
			elseif menuSelect == "survival" then survivalCPUvsP1P2()
			elseif menuSelect == "boss rush" then bossrushCPUvsP1P2()
			elseif menuSelect == "bonus rush" then bonusrushCPUvsP1P2()
			elseif menuSelect == "time attack" then timeattackCPUvsP1P2()
			elseif menuSelect == "score attack" then scoreattackCPUvsP1P2()
			elseif menuSelect == "sudden death" then suddenCPUvsP1P2()
			elseif menuSelect == "endless" then endlessCPUvsP1P2()
			end
			if menuSelect ~= "quick match" and menuSelect ~= "free battle" and menuSelect ~= "bonus" and menuSelect ~= "boss" then
				sideSelected = true
			else
				sndPlay(sysSnd, 100, 5)
				sideWarning = true
			end
		end
		if sideSelected then f_sideReset() end
	end
	cmdInput()
end

function f_sideReset()
	sideScreen = false
	sideSelected = false
	sideWarning = false
	p1Side = 0 --P1 Cursor pos in Middle
	p2Side = 0 --P2 Cursor pos in Middle
end

--;===========================================================
--; MAIN MENU
--;===========================================================
txt_gameFt = createTextImg(font5, 0, 1, "", 2, 240) --Text to identify the game mode in menus
txt_mainSelect = createTextImg(jgFnt, 0, 0, "", 159, 13) --Text that appears in character select with the name of the game mode

if data.engineMode == "FG" then
t_mainMenu = {
	{id = textImgNew(), text = "STORY"},
	{id = textImgNew(), text = "ARCADE"},
	{id = textImgNew(), text = "VERSUS"},
	{id = textImgNew(), text = "NETPLAY"},
	{id = textImgNew(), text = "TRAINING"},
	{id = textImgNew(), text = "CHALLENGES"},
	{id = textImgNew(), text = "EXTRAS"},
	{id = textImgNew(), text = "WATCH"},
	{id = textImgNew(), text = "OPTIONS"},
	{id = textImgNew(), text = "EXIT"},
	{id = textImgNew(), text = "CHECK UPDATES"},
}
elseif data.engineMode == "VN" then
t_mainMenu = {
	{id = textImgNew(), text = "NEW GAME"},
	{id = textImgNew(), text = "LOAD GAME"},
	--{id = textImgNew(), text = "NETPLAY"},
	{id = textImgNew(), text = "CONFIG"},
	{id = textImgNew(), text = "GALLERY"},
	{id = textImgNew(), text = "EXIT"},
	{id = textImgNew(), text = "CHECK UPDATES"},
}
end

function f_mainMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local vnSelect = 1
	closeText = 1
	f_gameState()
	f_menuMusic()
	f_infoReset()
	f_infoboxReset()
	--fadeInBGM(50)
	while true do
		if not infoScreen and not infoboxScreen then
			--First Run Msg
			if data.firstRun then
				firstRunInfo = true
				infoScreen = true
			end
			if f1Key() then infoboxScreen = true end --Show Classic Mugen Info Screen
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				playBGM(bgmTitle)
				return
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				mainMenu = mainMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--COMMON FIGHTING GAME MODE ACTIONS
				if data.engineMode == "FG" then
					--STORY (follow customizable story arcs designed for this engine)
					if mainMenu == 1 then
						script.story.f_storyMenu()
					--ARCADE (play customizables arcade ladders)
					elseif mainMenu == 2 then
						f_arcadeMenu()
					--VERSUS (face specific opponents)
					elseif mainMenu == 3 then
						f_vsMenu()
					--NETPLAY (play online)
					elseif mainMenu == 4 then
						--if (resolutionHeight / 3 * 4) ~= resolutionWidth then --To play online you need to set a 4:3 Resolution to avoid desync
						--if (resolutionHeight / 10 * 16) ~= resolutionWidth then --To play online you need to set a 16:10 Resolution to avoid desync
						if (math.floor((resolutionHeight / 9 * 16) + 0.5)) ~= resolutionWidth then --To play online you need to set a 16:9 Resolution to avoid desync
							resolutionInfo = true
							infoScreen = true
						else
							f_mainNetplay()
						end
					--TRAINING (practice special attacks and combos with training dummy character(s) of your choice)
					elseif mainMenu == 5 then
						f_training()		
					--CHALLENGES (play advanced game modes)
					elseif mainMenu == 6 then
						f_challengeMenu()
					--EXTRAS (play custom game modes)
					elseif mainMenu == 7 then
						assert(loadfile("save/stats_sav.lua"))()
						if data.arcadeClear == true then
							f_extrasMenu()
						else
							f_secret()
						end
					--WATCH (watch replays, rankings, player data, cutscenes and more)
					elseif mainMenu == 8 then
						f_watchMenu()
					--OPTIONS (adjust game settings)
					elseif mainMenu == 9 then
						onlinegame = false --only for identify purposes
						assert(loadfile("save/data_sav.lua"))()
						script.options.f_mainCfg() --start f_mainCfg() function from script/options.lua
					--EXIT
					elseif mainMenu == 10 then
						f_exitMenu()
					end
				--COMMON VISUAL NOVEL GAME MODE ACTIONS
				elseif data.engineMode == "VN" then
					--NEW GAME (follow customizable story arcs designed for this engine)
					if mainMenu == 1 then
						--Check Content
						if vnSelect < 1 then
							vnSelect = #t_selVN
						elseif vnSelect > #t_selVN then
							vnSelect = 1
						end
						if vnSelect == #t_selVN and vnNoSel then --1 story detected in select.def so don't show select menu
							script.visualnovel.f_vnMain(t_selVN[1].path) --Start Unique Visual Novel
							--When End
							data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
							f_menuMusic()
						else
							vnNoSel = false --More than 1 stories detected in select.def
							script.visualnovel.f_vnMenu() --Start Visual Novel Select
						end
					--LOAD GAME (continue the story from where you left off)
					elseif mainMenu == 2 then
						assert(loadfile("save/vn_sav.lua"))()
						if data.VNarc == "" and data.VNchapter == 0 and data.VNdialogue == 0 then
							sndPlay(sysSnd, 100, 5) --No Data
							vnDataInfo = true
							infoScreen = true
						else --Load Data
							playBGM("")
							script.visualnovel.f_vnMain(data.VNarc, data.VNchapter, data.VNdialogue)
							data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
							f_menuMusic()
						end
					--CONFIG (adjust game settings)
					elseif mainMenu == 3 then
						onlinegame = false
						assert(loadfile("save/data_sav.lua"))()
						script.options.f_mainCfg()
					--GALLERY (display additional content)
					elseif mainMenu == 4 then
						assert(loadfile("save/stats_sav.lua"))()
						f_galleryMenu()
					--EXIT
					elseif mainMenu == 5 then
						f_exitMenu()
					end
				end
				--CHECK ENGINE UPDATES
				if mainMenu == #t_mainMenu then webOpen("https://github.com/CableDorado2/Ikemen-Plus-Ultra") end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_mainMenu do
			if i == mainMenu then
				bank = 5 --Text Color (0=Nothing, 1=Red, 2=Green, 3=Blue, 4=Nothing, 5=Yellow, 6=Pink, 7=Shadow, 8=Black, 9=¿?)
			else
				bank = 0
			end
			if not infoboxScreen then
				textImgDraw(f_updateTextImg(t_mainMenu[i].id, jgFnt, bank, 0, t_mainMenu[i].text, 159, 122+i*13-moveTxt)) --Text Position
			end
		end
		if not infoScreen and not infoboxScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13) --Position and Size of the selection cursor
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1)) --Blink rate
		end
		drawMiddleMenuSP()
		f_sysTime()
		--f_progress()
		if not infoboxScreen then
			textImgDraw(txt_gameFt)
			textImgSetText(txt_gameFt, "MAIN MENU")
			textImgDraw(txt_version)
			textImgDraw(txt_f1)
			if maxMainMenu > 6 then
				animDraw(arrowsU)
				animUpdate(arrowsU)
			end
			if #t_mainMenu > 6 and maxMainMenu < #t_mainMenu then
				animDraw(arrowsD)
				animUpdate(arrowsD)
			end
		end
		if infoScreen then
			f_infoMenu()
		else
			drawMenuInputHints()
		end
		if infoboxScreen then f_infoboxMenu() end
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
--; ARCADE MENU
--;===========================================================
t_arcadeMenu = {
	{id = textImgNew(), text = "CLASSIC MODE"},
	{id = textImgNew(), text = "TOWER MODE"},
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
	f_infoReset()
	f_sideReset() --Reset Values to Show Side Select
	while true do
		if not infoScreen and not sideScreen then --Turn off controls over arcade menu if Side Select is active
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				arcadeMenu = arcadeMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--ARCADE (play a customizable arcade ladder)
				if arcadeMenu == 1 then
					if data.sideSelect == "Modern" then
						menuSelect = "arcade"
						sideScreen = true
					else
						f_arcadeClassicMenu()
					end
				--TOWER (fight against enemy forces in a customizable tower arcade ladder)
				elseif arcadeMenu == 2 then
					f_loadTowers()
					if #t_selTower ~= 0 then
						if data.sideSelect == "Modern" then
							menuSelect = "tower"
							sideScreen = true
						else
							f_towerMenu()
						end
					else
						towerInfo = true
						infoScreen = true
					end
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_arcadeMenu do
			if i == arcadeMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_arcadeMenu[i].id, jgFnt, bank, 0, t_arcadeMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not infoScreen and not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)		
		textImgSetText(txt_gameFt, "ARCADE MODE")
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
		if not infoScreen and not sideScreen then drawMenuInputHints() end
		if sideScreen then f_sideSelect() end --Show Side Select
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
--; CLASSIC ARCADE MENU
--;===========================================================
t_arcadeClassicMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Classic Arcade Modes
function arcadeCfg()
	f_resetArcadeStuff()
	f_default() --Load f_default function defined in common.lua
	setGameMode('arcade')
	data.gameMode = "arcade" --mode recognized in select screen as arcade
	data.rosterMode = "arcade" --to record statistics
	data.serviceScreen = true --Enable Service Screen if you lose and continue
	data.arcadeIntro = true --Enable characters arcade intro before versus screen
	data.arcadeEnding = true --Enable characters arcade ending before credits screen
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (fight against CPU controlled opponents in a customizable arcade ladder from left side)
function arcadeHumanvsCPU()
	if P2overP1 then --Set player 2 controls config over player 1
		remapInput(1, 2) --P1 swap controls with p2 side
		setPlayerSide('p2left') --will be used to open challenger screen
	else
		setPlayerSide('p1left')
	end
	data.p2In = 1 --P1 controls P2 side of the select screen (but not the character only menus)
	data.p2SelectMenu = false --P2 character selection disabled
	textImgSetText(txt_mainSelect, "ARCADE") --message displayed on top of select screen
	script.select.f_selectAdvance() --start f_selectAdvance() function from script/select.lua
	P2overP1 = false --Reset Player 2 Control Swap Detection
end

--CPU VS HUMAN (fight against CPU controlled opponents in a customizable arcade ladder from right side)
function arcadeCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1) --P2 swap controls with p1 side
		setPlayerSide('p1right') --set Pause Controls if P1 is in Right Side
	else
		setPlayerSide('p2right')
	end
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false --P1 character selection disabled
	textImgSetText(txt_mainSelect, "ARCADE")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side against CPU controlled opponents in a customizable arcade ladder)
function arcadeP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true --P2 fighting on P1 side enabled
	setPlayerSide('p1left')
	setGameMode('arcadecoop') --to avoid challenger screen
	textImgSetText(txt_mainSelect, "ARCADE COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side against CPU controlled opponents in a customizable arcade ladder)
function arcadeCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	setGameMode('arcadecoop')
	textImgSetText(txt_mainSelect, "ARCADE COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (watch CPU fight in a customizable arcade ladder)
function arcadeCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true --AI = data.difficulty for all characters enabled
	setPlayerSide('p1left')
	setGameMode('arcadecpu') --to avoid challenger screen
	data.rosterMode = "cpu" --to avoid record stats
	textImgSetText(txt_mainSelect, "WATCH ARCADE")
	script.select.f_selectAdvance()
end

function f_arcadeClassicMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local arcadeClassicMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			arcadeClassicMenu = arcadeClassicMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			arcadeClassicMenu = arcadeClassicMenu + 1
		end
		if arcadeClassicMenu < 1 then
			arcadeClassicMenu = #t_arcadeClassicMenu
			if #t_arcadeClassicMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_arcadeClassicMenu-1
			end
		elseif arcadeClassicMenu > #t_arcadeClassicMenu then
			arcadeClassicMenu = 1
			cursorPosY = 0
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (arcadeClassicMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (arcadeClassicMenu - 1) * 13
		end
		if #t_arcadeClassicMenu <= 5 then
			maxarcadeClassicMenu = #t_arcadeClassicMenu
		elseif arcadeClassicMenu - cursorPosY > 0 then
			maxarcadeClassicMenu = arcadeClassicMenu + 5 - cursorPosY
		else
			maxarcadeClassicMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			arcadeCfg()
			if arcadeClassicMenu == 1 then arcadeHumanvsCPU()
			elseif arcadeClassicMenu == 2 then P2overP1 = true arcadeHumanvsCPU()
			elseif arcadeClassicMenu == 3 then arcadeCPUvsHuman()
			elseif arcadeClassicMenu == 4 then P2overP1 = true arcadeCPUvsHuman()
			elseif arcadeClassicMenu == 5 then arcadeP1P2vsCPU()
			--elseif arcadeClassicMenu == 6 then arcadeCPUvsP1P2()
			elseif arcadeClassicMenu == 6 then arcadeCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_arcadeClassicMenu do
			if i == arcadeClassicMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_arcadeClassicMenu[i].id, jgFnt, bank, 0, t_arcadeClassicMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)		
		textImgSetText(txt_gameFt, "CLASSIC ARCADE")
		textImgDraw(txt_version)
		f_sysTime()
		if maxarcadeClassicMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_arcadeClassicMenu > 6 and maxarcadeClassicMenu < #t_arcadeClassicMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		drawMenuInputHints()
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
--; TOWER ARCADE MENU
--;===========================================================
t_towerMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Tower Modes
function towerCfg()
	f_resetArcadeStuff()
	f_default()
	setGameMode('tower')
	data.gameMode = "tower"
	data.rosterMode = "tower"
	--data.arcadeIntro = true --Enable characters arcade intro before tower select
	data.arcadeEnding = true
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (fight against CPU controlled opponents in customizable tower ladders from left side)
function towerHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
		setPlayerSide('p2left')
	else
		setPlayerSide('p1left')
	end
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "TOWER MODE")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (fight against CPU controlled opponents in customizable tower ladders from right side)
function towerCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
		setPlayerSide('p1right')
	else
		setPlayerSide('p2right')
	end
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "TOWER MODE")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side against CPU controlled opponents in customizable tower ladders)
function towerP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	setPlayerSide('p1left')
	setGameMode('towercoop')
	textImgSetText(txt_mainSelect, "TOWER COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side against CPU controlled opponents in customizable tower ladders)
function towerCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	setGameMode('towercoop')
	textImgSetText(txt_mainSelect, "TOWER COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (watch CPU fight in customizable tower ladders)
function towerCPUvsCPU()
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	setPlayerSide('p1left')
	setGameMode('towercpu')
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH TOWER")
	script.select.f_selectAdvance()
end

function f_towerMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local towerMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			towerMenu = towerMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			towerMenu = towerMenu + 1
		end
		if towerMenu < 1 then
			towerMenu = #t_towerMenu
			if #t_towerMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_towerMenu-1
			end
		elseif towerMenu > #t_towerMenu then
			towerMenu = 1
			cursorPosY = 0
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (towerMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (towerMenu - 1) * 13
		end
		if #t_towerMenu <= 5 then
			maxtowerMenu = #t_towerMenu
		elseif towerMenu - cursorPosY > 0 then
			maxtowerMenu = towerMenu + 5 - cursorPosY
		else
			maxtowerMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			towerCfg()
			if towerMenu == 1 then towerHumanvsCPU()
			elseif towerMenu == 2 then P2overP1 = true towerHumanvsCPU()
			elseif towerMenu == 3 then towerCPUvsHuman()
			elseif towerMenu == 4 then P2overP1 = true towerCPUvsHuman()
			elseif towerMenu == 5 then towerP1P2vsCPU()
			--elseif towerMenu == 6 then towerCPUvsP1P2()
			elseif towerMenu == 6 then towerCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_towerMenu do
			if i == towerMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_towerMenu[i].id, jgFnt, bank, 0, t_towerMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)		
		textImgSetText(txt_gameFt, "TOWER ARCADE")
		textImgDraw(txt_version)
		f_sysTime()
		if maxtowerMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_towerMenu > 6 and maxtowerMenu < #t_towerMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		drawMenuInputHints()
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
--; VERSUS MENU
--;===========================================================
t_vsMenu = {
	{id = textImgNew(), text = "QUICK MATCH"},
	{id = textImgNew(), text = "FREE BATTLE"},
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
	f_sideReset()
	while true do
		if not sideScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				vsMenu = vsMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--QUICK VERSUS (play a random fight)
				if vsMenu == 1 then
					if data.sideSelect == "Modern" then
						menuSelect = "quick match"
						sideScreen = true
					else
						f_randomMenu()
					end
				--FREE BATTLE (play fights with your own rules)
				elseif vsMenu == 2 then
					if data.sideSelect == "Modern" then
						menuSelect = "free battle"
						sideScreen = true
					else
						f_freeMenu()
					end
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_vsMenu do
			if i == vsMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_vsMenu[i].id, jgFnt, bank, 0, t_vsMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "VERSUS MODE")
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
		if sideScreen then f_sideSelect() else drawMenuInputHints() end
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
--; QUICK/RANDOM MATCH MENU
--;===========================================================
t_randomMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1 VS P2"},
	{id = textImgNew(), text = "P2 VS P1"},
	{id = textImgNew(), text = "CPU VS CPU"},
	--{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
}

--Load Common Settings for Quick Match Modes
function randomModeCfg()
	f_default()
	setGameMode('random')
	data.gameMode = "quick match"
	data.rosterMode = "versus"
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_randomChars[math.random(#t_randomChars)]} --Pick Random Char
	data.p2Char = {t_randomChars[math.random(#t_randomChars)]} --Pick Random Char
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (defeat from left side a random CPU controlled opponent)
function randomHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	script.select.f_selectSimple()
	P2overP1 = false
end

--CPU VS HUMAN (defeat from right side a random CPU controlled opponent of your choice)
function randomCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	script.select.f_selectSimple()
	P2overP1 = false
end

--HUMAN VS HUMAN (fight from left side to defeat a random human opponent)
function randomHumanvsHuman()
	if P2overP1 then
		setHomeTeam(2)
		remapInput(1, 2)
		remapInput(2, 1)
		setPlayerSide('p1right')
	else
		setHomeTeam(1)
	end
	data.p2In = 2
	script.select.f_selectSimple()
	P2overP1 = false
end

--CPU MATCH (watch random CPU controlled match)
function randomCPUvsCPU()
	data.aiFight = true
	data.rosterMode = "cpu"
	script.select.f_selectSimple()
end

--P1&P2 VS CPU (team up with another player from left side to defeat random CPU controlled opponents)
function randomP1P2vsCPU()
	--script.select.f_selectSimple()
	f_comingSoon()
end

--CPU VS P1&P2 (team up with another player from right side to defeat random CPU controlled opponents)
function randomCPUvsP1P2()
	--script.select.f_selectSimple()
	f_comingSoon()
end

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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			randomMenu = randomMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			randomModeCfg()
			if randomMenu == 1 then randomHumanvsCPU()
			elseif randomMenu == 2 then P2overP1 = true randomHumanvsCPU()
			elseif randomMenu == 3 then randomCPUvsHuman()
			elseif randomMenu == 4 then P2overP1 = true randomCPUvsHuman()
			elseif randomMenu == 5 then randomHumanvsHuman()
			elseif randomMenu == 6 then P2overP1 = true randomHumanvsHuman()
			elseif randomMenu == 7 then randomCPUvsCPU()
			--elseif randomMenu == 7 then randomP1P2vsCPU()
			--elseif randomMenu == 8 then randomCPUvsP1P2()
			end
		end
		drawBottomMenuSP()
		for i=1, #t_randomMenu do
			if i == randomMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_randomMenu[i].id, jgFnt, bank, 0, t_randomMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "RANDOM MODE")
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
		drawMenuInputHints()
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
--; FREE BATTLE MENU
--;===========================================================
t_freeMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1 VS P2"},
	{id = textImgNew(), text = "P2 VS P1"},
	{id = textImgNew(), text = "CPU VS CPU"},
	--{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	--{id = textImgNew(), text = "P1&P3 VS P2&P4"},
}

--Load Common Settings for Free Battle Modes
function freeModeCfg()
	f_default()
	setGameMode('vs')
	data.gameMode = "versus"
	data.rosterMode = "versus"
	data.stageMenu = true --stage selection enabled
	data.p2Faces = true --additional window with P2 select screen small portraits (faces) enabled
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (choose a fighter to defeat from left side a CPU controlled opponent of your choice)
function freeHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	textImgSetText(txt_mainSelect, "FREE VERSUS")
	script.select.f_selectSimple() --start f_selectSimple() function from script/select.lua
	P2overP1 = false
end

--CPU VS HUMAN (choose a fighter to defeat from right side a CPU controlled opponent of your choice)
function freeCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	textImgSetText(txt_mainSelect, "FREE VERSUS")
	script.select.f_selectSimple()
	P2overP1 = false
end

--HUMAN VS HUMAN (choose a fighter from left side to defeat a human opponent)
function freeHumanvsHuman()
	if P2overP1 then
		setHomeTeam(2) --P2 side considered the home team
		remapInput(1, 2)
		remapInput(2, 1)
		setPlayerSide('p1right')
	else
		setHomeTeam(1) --P1 side considered the home team
	end
	data.p2In = 2 --P2 controls P2 side of the select screen
	textImgSetText(txt_mainSelect, "VERSUS MODE")
	script.select.f_selectSimple()
	P2overP1 = false
end

--CPU MATCH (watch CPU controlled match of your choice)
function freeCPUvsCPU()
	data.p2In = 1
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH VERSUS")
	script.select.f_selectSimple()
end

--P1&P2 VS CPU (team up with another player from left side to defeat CPU controlled opponents of your choice)
function freeP1P2vsCPU()
	f_comingSoon()
	--[[
	setHomeTeam(1)
	data.p2In = 2
	data.stageMenu = false
	data.stage = {t_stageDef["stages/training room.def"]}
	data.coop = true
	textImgSetText(txt_mainSelect, "FREE VERSUS COOPERATIVE")
	script.select.f_selectSimple()
	]]
end

--CPU VS P1&P2 (team up with another player from right side to defeat CPU controlled opponents of your choice)
function freeCPUvsP1P2()
	f_comingSoon()
end

--[[P1&P3 VS P2&P4 (team up with another player to defeat co-op team of human opponents)
function freeP1P3vsP2P4()
	setHomeTeam(1)
	data.p2In = 2
	data.coop = true
	textImgSetText(txt_mainSelect, "FREE VERSUS TEAM COOPERATIVE")
	script.select.f_selectSimple()
end
]]

function f_freeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local freeMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			freeMenu = freeMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			freeMenu = freeMenu + 1
		end
		if freeMenu < 1 then
			freeMenu = #t_freeMenu
			if #t_freeMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_freeMenu-1
			end
		elseif freeMenu > #t_freeMenu then
			freeMenu = 1
			cursorPosY = 0
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (freeMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (freeMenu - 1) * 13
		end
		if #t_freeMenu <= 5 then
			maxfreeMenu = #t_freeMenu
		elseif freeMenu - cursorPosY > 0 then
			maxfreeMenu = freeMenu + 5 - cursorPosY
		else
			maxfreeMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			freeModeCfg()
			if freeMenu == 1 then freeHumanvsCPU()
			elseif freeMenu == 2 then P2overP1 = true freeHumanvsCPU()
			elseif freeMenu == 3 then freeCPUvsHuman()
			elseif freeMenu == 4 then P2overP1 = true freeCPUvsHuman()
			elseif freeMenu == 5 then freeHumanvsHuman()
			elseif freeMenu == 6 then P2overP1 = true freeHumanvsHuman()
			elseif freeMenu == 7 then freeCPUvsCPU()
			--elseif freeMenu == 8 then freeP1P2vsCPU()
			--elseif freeMenu == 9 then freeCPUvsP1P2()
			--elseif freeMenu == 10 then freeP1P3vsP2P4()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_freeMenu do
			if i == freeMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_freeMenu[i].id, jgFnt, bank, 0, t_freeMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "FREE VERSUS")
		textImgDraw(txt_version)
		f_sysTime()
		if maxfreeMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_freeMenu > 6 and maxfreeMenu < #t_freeMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		drawMenuInputHints()
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
--; TRAINING MODE
--;===========================================================
function f_training()
	f_default()
	setGameMode('practice')
	data.gameMode = "training"
	data.rosterMode = "training"
	setRoundTime(-1) --round time disabled
	data.versusScreen = false --versus screen disabled
	data.victoryscreen = false --victory screen disabled
	data.stageMenu = true
	data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
	data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	--sndPlay(sysSnd, 100, 1)
	if #t_trainingChar ~= 0 then --If a training char is detected in select.def with training=1 paramvalue
		data.p2In = 2
		data.p2Char = {t_trainingChar[math.random(#t_trainingChar)]} --pick a random training char from the table
	else --Training Char will be selected in char select if there is not training chars detected in select.def with training=1 paramvalue
		data.p2In = 1
		data.p2Faces = true
	end
	textImgSetText(txt_mainSelect, "TRAINING MODE")
	script.select.f_selectSimple()
end

--;===========================================================
--; CHALLENGES MENU
--;===========================================================
t_challengeMenu = {
	{id = textImgNew(), text = "SURVIVAL"},
	{id = textImgNew(), text = "MISSIONS"},
	{id = textImgNew(), text = "BOSS FIGHT"},
	{id = textImgNew(), text = "BONUS GAMES"},
	{id = textImgNew(), text = "TIME ATTACK"},
	{id = textImgNew(), text = "SCORE ATTACK"},
	{id = textImgNew(), text = "SUDDEN DEATH"},
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
	f_infoReset()
	f_sideReset()
	while true do
		if not infoScreen and not sideScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				challengeMenu = challengeMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--SURVIVAL (defeat opponents with a single health meter)
				if challengeMenu == 1 then
					if data.sideSelect == "Modern" then
						menuSelect = "survival"
						sideScreen = true
					else
						f_survivalMenu()
					end
				--MISSIONS/TRIALS (complete missions or combos trial challenges)
				elseif challengeMenu == 2 then
					script.missions.f_missionMenu()
				--BOSS FIGHT (defeat boss characters)
				elseif challengeMenu == 3 then
					if #t_bossChars ~= 0 then
						f_bossMenu()
					else
						bossInfo = true
						infoScreen = true
					end
				--BONUS GAMES (play bonus games)
				elseif challengeMenu == 4 then
					if #t_bonusChars ~= 0 then
						f_bonusMenu()
					else
						bonusInfo = true
						infoScreen = true
					end
				--TIME ATTACK (defeat opponents as quickly as possible) WIP
				elseif challengeMenu == 5 then
					f_comingSoon()
					--[[
					if data.sideSelect == "Modern" then
						menuSelect = "time attack"
						sideScreen = true
					else
						f_timeMenu()
					end
					]]
				--SCORE ATTACK (defeat opponents getting high score as possible) WIP
				elseif challengeMenu == 6 then
					f_comingSoon()
					--[[
					if data.sideSelect == "Modern" then
						menuSelect = "score attack"
						sideScreen = true
					else
						f_scoreMenu()
					end
					]]
				--SUDDEN DEATH (defeat opponents in 1 hit)
				elseif challengeMenu == 7 then
					if data.sideSelect == "Modern" then
						menuSelect = "sudden death"
						sideScreen = true
					else
						f_suddenMenu()
					end
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_challengeMenu do
			if i == challengeMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_challengeMenu[i].id, jgFnt, bank, 0, t_challengeMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not infoScreen and not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "CHALLENGES MODES")
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
		if not infoScreen and not sideScreen then drawMenuInputHints() end
		if sideScreen then f_sideSelect() end
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
--; SURVIVAL MENU
--;===========================================================
t_survivalMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Survival Modes
function survivalCfg()
	f_default()
	data.gameMode = "survival"
	data.rosterMode = "survival"
	data.stageMenu = true
	setRoundsToWin(1)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (defeat as many opponents as you can with a single Health Meter from left side)
function survivalHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "SURVIVAL")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (defeat as many opponents as you can with a single Health Meter from right side)
function survivalCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "SURVIVAL")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to defeat as many opponents as you can with a single Health Meter)
function survivalP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "SURVIVAL COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to defeat as many opponents as you can with a single Health Meter)
function survivalCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "SURVIVAL COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (watch CPU defeat as many opponents as it can with a single Health Meter)
function survivalCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH SURVIVAL")
	script.select.f_selectAdvance()
end

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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			survivalMenu = survivalMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			survivalCfg()
			if survivalMenu == 1 then survivalHumanvsCPU()
			elseif survivalMenu == 2 then P2overP1 = true survivalHumanvsCPU()
			elseif survivalMenu == 3 then survivalCPUvsHuman()
			elseif survivalMenu == 4 then P2overP1 = true survivalCPUvsHuman()
			elseif survivalMenu == 5 then survivalP1P2vsCPU()
			--elseif survivalMenu == 6 then survivalCPUvsP1P2()
			elseif survivalMenu == 6 then survivalCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_survivalMenu do
			if i == survivalMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_survivalMenu[i].id, jgFnt, bank, 0, t_survivalMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "SURVIVAL MODE")
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
		drawMenuInputHints()
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
--; BOSS FIGHT MENU
--;===========================================================
t_bossMenu = {
	{id = textImgNew(), text = "VS SINGLE BOSS"},
	{id = textImgNew(), text = "BOSS RUSH"},
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
	f_sideReset()
	while true do
		if not sideScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				bossMenu = bossMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--SINGLE BOSS
				if bossMenu == 1 then
					f_rushTables() --From loader.lua
					f_bossChars()
				--BOSS RUSH
				elseif bossMenu == 2 then
					if data.sideSelect == "Modern" then
						menuSelect = "boss rush"
						sideScreen = true
					else
						f_bossrushMenu()
					end
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_bossMenu do
			if i == bossMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bossMenu[i].id, jgFnt, bank, 0, t_bossMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "BOSS FIGHT MODES")
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
		if sideScreen then f_sideSelect() else drawMenuInputHints() end
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
--; SINGLE BOSS MENU
--;===========================================================
--Load Common Settings for Single Boss Fight Modes
function bossCfg()
	f_default()
	data.gameMode = "singleboss"
	data.rosterMode = "boss"
	--data.stageMenu = true
	textImgSetText(txt_mainSelect, t_selChars[t_bossChars[bossChars]+1].displayname)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (defeat selected boss character from left side)
function bossHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_bossChars[bossChars]}
	script.select.f_selectSimple()
	P2overP1 = false
end

--CPU VS HUMAN (defeat selected boss character from right side)
function bossCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_bossChars[bossChars]}
	script.select.f_selectSimple()
	P2overP1 = false
end

--CPU MODE (watch CPU defeat selected boss character)
function bossCPUvsCPU()
	--data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_bossChars[bossChars]}
	script.select.f_selectSimple()
end

function f_bossChars()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	bossChars = 1 --Need to be public to be readed by above functions
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	f_sideReset()
	while true do
		if not sideScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				bossChars = bossChars - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				if data.sideSelect == "Modern" then
					sndPlay(sysSnd, 100, 1)
					menuSelect = "boss"
					sideScreen = true
				else
					bossCfg()
					bossHumanvsCPU()
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_bossSingle do
			if i == bossChars then
				bank = 1
			else
				bank = 0
			end
			--Draw Boss Name
			textImgDraw(f_updateTextImg(t_bossSingle[i].id, jgFnt, bank, 0, t_bossSingle[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "BOSS FIGHT")
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
		if sideScreen then f_sideSelect() else drawMenuInputHints() end
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
--; BOSS RUSH MENU
--;===========================================================
t_bossrushMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Boss Rush Modes
function bossrushCfg()
	f_default()
	data.gameMode = "bossrush"
	data.rosterMode = "boss"
	--data.stageMenu = true
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (defeat all bosses in a row from left side)
function bossrushHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "BOSS RUSH")					
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (defeat all bosses in a row from right side)
function bossrushCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "BOSS RUSH")					
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to defeat all bosses in a row)
function bossrushP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "BOSS RUSH COOPERATIVE")					
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to defeat all bosses in a row)
function bossrushCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "BOSS RUSH COOPERATIVE")					
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (watch CPU defeat all bosses in a row)
function bossrushCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH BOSS RUSH")
	script.select.f_selectAdvance()
end
	
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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bossrushMenu = bossrushMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			bossrushCfg()
			if bossrushMenu == 1 then bossrushHumanvsCPU()
			elseif bossrushMenu == 2 then P2overP1 = true bossrushHumanvsCPU()
			elseif bossrushMenu == 3 then bossrushCPUvsHuman()
			elseif bossrushMenu == 4 then P2overP1 = true bossrushCPUvsHuman()
			elseif bossrushMenu == 5 then bossrushP1P2vsCPU()
			--elseif bossrushMenu == 6 then bossrushCPUvsP1P2()
			elseif bossrushMenu == 6 then bossrushCPUvsCPU()
			end
		end
		drawBottomMenuSP()
		for i=1, #t_bossrushMenu do
			if i == bossrushMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bossrushMenu[i].id, jgFnt, bank, 0, t_bossrushMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "BOSS RUSH MODE")
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
		drawMenuInputHints()
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
--; BONUS GAMES MENU
--;===========================================================
t_bonusMenu = {
	{id = textImgNew(), text = "SINGLE MODE"},
	{id = textImgNew(), text = "BONUS RUSH"},
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
	f_sideReset()
	while true do
		if not sideScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				bonusMenu = bonusMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--SINGLE BONUS
				if bonusMenu == 1 then
					f_rushTables()
					f_bonusExtras()
				--BONUS RUSH
				elseif bonusMenu == 2 then
					if data.sideSelect == "Modern" then
						menuSelect = "bonus rush"
						sideScreen = true
					else
						f_bonusrushMenu()
					end
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_bonusMenu do
			if i == bonusMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bonusMenu[i].id, jgFnt, bank, 0, t_bonusMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "MINI-GAMES")
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
		if sideScreen then f_sideSelect() else drawMenuInputHints() end
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
--; SINGLE BONUS GAMES MENU
--;===========================================================
--Load Common Settings for Bonus Games Modes
function bonusCfg()
	f_default()
	data.gameMode = "singlebonus"
	data.rosterMode = "bonus"
	--data.stageMenu = true
	data.versusScreen = false
	setRoundsToWin(1)
	textImgSetText(txt_mainSelect, t_selChars[t_bonusChars[bonusExtras]+1].displayname)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (clear the bonus game selected from left side)
function bonusHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2TeamMenu = {mode = 0, chars = 1}
	data.p2Char = {t_bonusChars[bonusExtras]}
	script.select.f_selectSimple()
	P2overP1 = false
end

--CPU VS HUMAN (clear the bonus game selected from right side)
function bonusCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	data.p1TeamMenu = {mode = 0, chars = 1}
	data.p1Char = {t_bonusChars[bonusExtras]}
	script.select.f_selectSimple()
	P2overP1 = false
end

function f_bonusExtras()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	bonusExtras = 1 --Need to be public to be readed by above functions
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	f_sideReset()
	while true do
		if not sideScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				bonusExtras = bonusExtras - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				if data.sideSelect == "Modern" then
					sndPlay(sysSnd, 100, 1)
					menuSelect = "bonus"
					sideScreen = true
				else
					bonusCfg()
					bonusHumanvsCPU()
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_bonusExtras do
			if i == bonusExtras then
				bank = 5
			else
				bank = 0
			end
			--Draw Bonus Name
			textImgDraw(f_updateTextImg(t_bonusExtras[i].id, jgFnt, bank, 0, t_bonusExtras[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "BONUS STAGES")
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
		if sideScreen then f_sideSelect() else drawMenuInputHints() end
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
--; BONUS RUSH MENU
--;===========================================================
t_bonusrushMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
}

--Load Common Settings for Bonus Rush Modes
function bonusrushCfg()
	f_default()
	data.gameMode = "bonusrush"
	data.rosterMode = "bonus"
	setRoundsToWin(1)
	--data.stageMenu = true
	data.versusScreen = false
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)			
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (clear all bonus games in a row from left side)
function bonusrushHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	data.p2TeamMenu = {mode = 0, chars = 1}
	textImgSetText(txt_mainSelect, "BONUS RUSH")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (clear all bonus games in a row from right side)
function bonusrushCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	data.p1TeamMenu = {mode = 0, chars = 1}
	textImgSetText(txt_mainSelect, "BONUS RUSH")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to clear all bonus games in a row)
function bonusrushP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "BONUS RUSH COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to clear all bonus games in a row)
function bonusrushCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "BONUS RUSH COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end
	
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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			bonusrushMenu = bonusrushMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			bonusrushCfg()
			if bonusrushMenu == 1 then bonusrushHumanvsCPU()
			elseif bonusrushMenu == 2 then P2overP1 = true bonusrushHumanvsCPU()
			elseif bonusrushMenu == 3 then bonusrushCPUvsHuman()
			elseif bonusrushMenu == 4 then P2overP1 = true bonusrushCPUvsHuman()
			elseif bonusrushMenu == 5 then bonusrushP1P2vsCPU()
			--elseif bonusrushMenu == 6 then bonusrushCPUvsP1P2()
			end
		end
		drawBottomMenuSP()
		for i=1, #t_bonusrushMenu do
			if i == bonusrushMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_bonusrushMenu[i].id, jgFnt, bank, 0, t_bonusrushMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "BONUS RUSH MODE")
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
		drawMenuInputHints()
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
--; TIME ATTACK MENU (WIP)
--;===========================================================
t_timeMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Time Attack Modes
function timeattackCfg()
	f_default()
	data.gameMode = "allroster"
	data.rosterMode = "timeattack"
	--data.stageMenu = true
	setRoundTime(-1)
	setRoundsToWin(1)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (defeat all character roster as quickly as possible, beating previous time records from left side)
function timeattackHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "TIME ATTACK")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (defeat all character roster as quickly as possible, beating previous time records from right side)
function timeattackCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "TIME ATTACK")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to defeat all character roster as quickly as possible, beating previous time records)
function timeattackP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "TIME ATTACK COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to defeat all character roster as quickly as possible, beating previous time records)
function timeattackCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "TIME ATTACK COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (watch CPU defeat all character roster as quickly as possible, beating previous time records)
function timeattackCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH TIME ATTACK")
	script.select.f_selectAdvance()
end

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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			timeMenu = timeMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			timeattackCfg()
			if timeMenu == 1 then timeattackHumanvsCPU()
			elseif timeMenu == 2 then P2overP1 = true timeattackHumanvsCPU()
			elseif timeMenu == 3 then timeattackCPUvsHuman()
			elseif timeMenu == 4 then P2overP1 = true timeattackCPUvsHuman()
			elseif timeMenu == 5 then timeattackP1P2vsCPU()
			--elseif timeMenu == 6 then timeattackCPUvsP1P2()
			elseif timeMenu == 6 then timeattackCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_timeMenu do
			if i == timeMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_timeMenu[i].id, jgFnt, bank, 0, t_timeMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "TIME ATTACK MODE")
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
		drawMenuInputHints()
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
--; SCORE ATTACK MENU (WIP)
--;===========================================================
t_scoreMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Score Attack Modes
function scoreattackCfg()
	f_default()
	data.gameMode = "allroster"
	data.rosterMode = "scoreattack"
	--data.stageMenu = true
	setRoundTime(-1)
	setRoundsToWin(1)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--HUMAN VS CPU (defeat all character roster as quickly as possible, beating previous score records from left side)
function scoreattackHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "SCORE ATTACK")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (defeat all character roster as quickly as possible, beating previous score records from right side)
function scoreattackCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "SCORE ATTACK")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to defeat all character roster as quickly as possible, beating previous score records)
function scoreattackP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "SCORE ATTACK COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to defeat all character roster as quickly as possible, beating previous score records)
function scoreattackCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "SCORE ATTACK COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (watch CPU defeat all character roster as quickly as possible, beating previous score records)
function scoreattackCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH SCORE ATTACK")
	script.select.f_selectAdvance()
end

function f_scoreMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local scoreMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			scoreMenu = scoreMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			scoreMenu = scoreMenu + 1
		end
		if scoreMenu < 1 then
			scoreMenu = #t_scoreMenu
			if #t_scoreMenu > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_scoreMenu-1
			end
		elseif scoreMenu > #t_scoreMenu then
			scoreMenu = 1
			cursorPosY = 0
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (scoreMenu - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (scoreMenu - 1) * 13
		end
		if #t_scoreMenu <= 5 then
			maxScoreMenu = #t_scoreMenu
		elseif scoreMenu - cursorPosY > 0 then
			maxScoreMenu = scoreMenu + 5 - cursorPosY
		else
			maxScoreMenu = 5
		end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			scoreattackCfg()
			if scoreMenu == 1 then scoreattackHumanvsCPU()
			elseif scoreMenu == 2 then P2overP1 = true scoreattackHumanvsCPU()
			elseif scoreMenu == 3 then scoreattackCPUvsHuman()
			elseif scoreMenu == 4 then P2overP1 = true scoreattackCPUvsHuman()
			elseif scoreMenu == 5 then scoreattackP1P2vsCPU()
			--elseif scoreMenu == 6 then scoreattackCPUvsP1P2()
			elseif scoreMenu == 6 then scoreattackCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_scoreMenu do
			if i == scoreMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_scoreMenu[i].id, jgFnt, bank, 0, t_scoreMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "SCORE ATTACK MODE")
		textImgDraw(txt_version)
		f_sysTime()
		if maxScoreMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_scoreMenu > 6 and maxScoreMenu < #t_scoreMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		drawMenuInputHints()
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
--; SUDDEN DEATH MENU
--;===========================================================
t_suddenMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Sudden Death Modes
function suddenCfg()
	f_default()
	data.gameMode = "allroster"
	data.rosterMode = "suddendeath"
	--data.stageMenu = true
	setRoundTime(1000)
	setRoundsToWin(1)
	setLifeMul(0) --overwrite players life
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--P1 VS HUMAN (see how many characters out of all roster you can take down in 1 Hit from left side)
function suddenHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "SUDDEN DEATH")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (see how many characters out of all roster you can take down in 1 Hit from right side)
function suddenCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "SUDDEN DEATH")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to see how many characters out of all roster you can take down in 1 Hit)
function suddenP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "SUDDEN DEATH COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to see how many characters out of all roster you can take down in 1 Hit)
function suddenCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "SUDDEN DEATH COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (see how many characters out of all roster the CPU can take down in 1 Hit)
function suddenCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH SUDDEN DEATH")
	script.select.f_selectAdvance()
end

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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			suddenMenu = suddenMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			suddenCfg()
			if suddenMenu == 1 then suddenHumanvsCPU()
			elseif suddenMenu == 2 then P2overP1 = true suddenHumanvsCPU()
			elseif suddenMenu == 3 then suddenCPUvsHuman()
			elseif suddenMenu == 4 then P2overP1 = true suddenCPUvsHuman()
			elseif suddenMenu == 5 then suddenP1P2vsCPU()
			--elseif suddenMenu == 6 then suddenCPUvsP1P2()
			elseif suddenMenu == 6 then suddenCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_suddenMenu do
			if i == suddenMenu then
				bank = 1
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_suddenMenu[i].id, jgFnt, bank, 0, t_suddenMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "SUDDEN DEATH MODE")
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
		drawMenuInputHints()
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
--; EXTRAS MENU
--;===========================================================
t_extrasMenu = {
	{id = textImgNew(), text = "ENDLESS"},
	{id = textImgNew(), text = "EVENTS"},
	{id = textImgNew(), text = "TOURNEY"},
	{id = textImgNew(), text = "ADVENTURE"},
	{id = textImgNew(), text = "VISUAL NOVEL"},
	{id = textImgNew(), text = "THE VAULT"},
	{id = textImgNew(), text = "RANDOMTEST"},
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
	f_sideReset()
	f_infoReset()
	while true do
		if not sideScreen and not infoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				extrasMenu = extrasMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--ENDLESS MODE (fight in endless battles)
				if extrasMenu == 1 then
					if data.sideSelect == "Modern" then
						menuSelect = "endless"
						sideScreen = true
					else
						f_allcharsMenu()
					end
				--EVENTS MODE (complete events at certain hours, days, weeks, months or years)
				elseif extrasMenu == 2 then
					script.events.f_eventMenu()
				--TOURNEY MODE (participate in customizable single-elimination tournaments)
				elseif extrasMenu == 3 then
					f_tourneyMenu()
				--ADVENTURE MODE (explore a custom map with goals and level up your characters)
				elseif extrasMenu == 4 then
					script.select.f_selectAdventure() --script.adventure.f_mainAdventure()
				--VISUAL NOVEL MODE (watch a customizable narrative and interactive storytelling)
				elseif extrasMenu == 5 then
					if #t_selVN ~= 0 then
						script.visualnovel.f_vnMenu()
					else
						vnInfo = true
						infoScreen = true
					end
				--THE VAULT MODE (insert secret codes to unlock things)
				elseif extrasMenu == 6 then
					f_theVault()
				--RANDOMTEST (generate AI rank data)
				elseif extrasMenu == 7 then
					setGameMode('randomtest')
					script.select.randomTest()
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_extrasMenu do
			if i == extrasMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_extrasMenu[i].id, jgFnt, bank, 0, t_extrasMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen and not infoScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "EXTRA MODES")
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
		if not infoScreen and not sideScreen then drawMenuInputHints() end
		if sideScreen then f_sideSelect() end
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
--; ENDLESS MENU
--;===========================================================
t_allcharsMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

--Load Common Settings for Endless Modes
function endlessCfg()
	f_default()
	data.gameMode = "endless"
	data.rosterMode = "endless"
	data.stageMenu = true
	data.versusScreen = false
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	sndPlay(sysSnd, 100, 1)
end

--P1 VS HUMAN (choose a fighter to defeat endless CPU controlled opponents from left side)
function endlessHumanvsCPU()
	if P2overP1 then
		remapInput(1, 2)
	end
	data.p2In = 1
	data.p2SelectMenu = false
	textImgSetText(txt_mainSelect, "ENDLESS MODE")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--CPU VS HUMAN (choose a fighter to defeat endless CPU controlled opponents from right side)
function endlessCPUvsHuman()
	remapInput(1, 2)
	if not P2overP1 then
		remapInput(2, 1)
	end
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p1SelectMenu = false
	textImgSetText(txt_mainSelect, "ENDLESS MODE")
	script.select.f_selectAdvance()
	P2overP1 = false
end

--P1&P2 VS CPU [CO-OP MODE] (team up with another player from left side to defeat endless CPU controlled opponents)
function endlessP1P2vsCPU()
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "ENDLESS COOPERATIVE")
	script.select.f_selectAdvance()
end

--CPU VS P1&P2 [CO-OP MODE] (team up with another player from right side to defeat endless CPU controlled opponents)
function endlessCPUvsP1P2()
	f_comingSoon()
	--[[
	setPlayerSide('p1right')
	data.p1In = 2
	data.p2In = 2
	data.p2Faces = true
	data.coop = true
	textImgSetText(txt_mainSelect, "ENDLESS COOPERATIVE")
	script.select.f_selectAdvance()
	]]
end

--CPU MODE (choose a fighter to watch endless CPU fights)
function endlessCPUvsCPU()
	data.p2In = 1
	data.p2SelectMenu = false
	data.aiFight = true
	data.rosterMode = "cpu"
	textImgSetText(txt_mainSelect, "WATCH ENDLESS")
	script.select.f_selectAdvance()
end

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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			allcharsMenu = allcharsMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			endlessCfg()
			if allcharsMenu == 1 then endlessHumanvsCPU()
			elseif allcharsMenu == 2 then P2overP1 = true endlessHumanvsCPU()
			elseif allcharsMenu == 3 then endlessCPUvsHuman()
			elseif allcharsMenu == 4 then P2overP1 = true endlessCPUvsHuman()
			elseif allcharsMenu == 5 then endlessP1P2vsCPU()
			--elseif allcharsMenu == 6 then endlessCPUvsP1P2()
			elseif allcharsMenu == 6 then endlessCPUvsCPU()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_allcharsMenu do
			if i == allcharsMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_allcharsMenu[i].id, jgFnt, bank, 0, t_allcharsMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "INFINITE MODE")
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
		drawMenuInputHints()
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
--; TOURNAMENT MENU (WIP)
--;===========================================================
t_tourneyMenu = {
	{id = textImgNew(), text = "ROUND OF 16"},
	{id = textImgNew(), text = "ROUND OF 8"},
	{id = textImgNew(), text = "ROUND OF 4"},
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
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			tourneyMenu = tourneyMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			f_default()
			--data.rosterMode = "tourney"
			--data.stageMenu = true
			--data.p2In = 1
			--data.p2SelectMenu = false
			--data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 1)
			--ROUND OF 16 (participate in a customizable single-elimination tournament starting from Round of 16)
			if tourneyMenu == 1 then
				data.gameMode = "tourney16"
				textImgSetText(txt_mainSelect, "TOURNAMENT MODE")
				script.select.f_selectTourney()
			--QUARTERFINALS (participate in a customizable single-elimination tournament starting from Quarterfinals)
			elseif tourneyMenu == 2 then
				data.gameMode = "tourney8"
				textImgSetText(txt_mainSelect, "TOURNAMENT - QUARTERFINALS")
				script.select.f_selectTourney()
			--SEMIFINALS (participate in a customizable single-elimination tournament starting from Semifinals)
			elseif tourneyMenu == 3 then
				data.gameMode = "tourney4"
				textImgSetText(txt_mainSelect, "TOURNAMENT - SEMIFINALS")
				script.select.f_selectTourney()
			end
		end	
		drawBottomMenuSP()
		for i=1, #t_tourneyMenu do
			if i == tourneyMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_tourneyMenu[i].id, jgFnt, bank, 0, t_tourneyMenu[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "TOURNAMENT MODE")
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
		drawMenuInputHints()
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
--; WATCH MENU
--;===========================================================
t_watchMenu = {
	{id = textImgNew(), text = "REPLAYS"},
	{id = textImgNew(), text = "STAGE VIEWER"},
	{id = textImgNew(), text = "PLAYER RECORDS"},
	{id = textImgNew(), text = "STORYBOARDS"},
	{id = textImgNew(), text = "CUTSCENES"},
	{id = textImgNew(), text = "SOUND TEST"},
	{id = textImgNew(), text = "SCREENSHOTS"},
	{id = textImgNew(), text = "GALLERY"},
	{id = textImgNew(), text = "CREDITS"},
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
	f_infoReset()
	while true do
		if not infoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				watchMenu = watchMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
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
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--REPLAYS (watch recorded battles)
				if watchMenu == 1 then
					f_replayMenu()
				--STAGE VIEWER (watch a selected stage without fight)
				elseif watchMenu == 2 then
					if data.stageviewer then
						f_default()
						data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
						setRoundTime(-1)
						data.p2In = 2
						data.stageMenu = true
						data.versusScreen = false
						data.victoryscreen = false
						data.p1TeamMenu = {mode = 0, chars = 1}			
						data.p2TeamMenu = {mode = 0, chars = 1}
						data.p1Char = {t_charAdd["stage viewer"]}
						data.p2Char = {t_charAdd["stage viewer"]}
						data.gameMode = "stage viewer"
						setGameMode('stageviewer')
						textImgSetText(txt_mainSelect, "STAGE VIEWER")
						script.select.f_selectSimple()
					else
						stviewerInfo = true
						infoScreen = true
					end
				--STATISTICS (display overall player data)
				elseif watchMenu == 3 then
					--assert(loadfile("save/stats_sav.lua"))()
					script.statistics.f_statsMenu()
				--STORYBOARDS (play storyboards)
				elseif watchMenu == 4 then
					f_storyboardMenu()
				--CUTSCENES (play video cutscenes)
				elseif watchMenu == 5 then
					f_videoMenu()
				--SOUND TEST (listen sounds)
				elseif watchMenu == 6 then
					soundTest = true
					f_songMenu()
				--SCREENSHOTS (watch screenshots taken)
				elseif watchMenu == 7 then
					sszOpen("screenshots", "") --added via script.ssz
				--GALLERY (watch illustrations)
				elseif watchMenu == 8 then
					f_galleryMenu()
				--CREDITS (play credits)
				elseif watchMenu == 9 then
					f_playCredits()
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_watchMenu do
			if i == watchMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_watchMenu[i].id, jgFnt, bank, 0, t_watchMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not infoScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "WATCH CONTENT")
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
		if infoScreen then f_infoMenu() else drawMenuInputHints() end
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
--; REPLAY MENU
--;===========================================================
t_replayMenu = {
	{id = textImgNew(), text = "ONLINE REPLAYS"},
	{id = textImgNew(), text = "LOCAL REPLAYS"},
}

function f_replayMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local replayMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	f_infoReset()
	while true do
		if not infoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				replayMenu = replayMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sysSnd, 100, 0)
				replayMenu = replayMenu + 1
			end
			if replayMenu < 1 then
				replayMenu = #t_replayMenu
				if #t_replayMenu > 5 then
					cursorPosY = 5
				else
					cursorPosY = #t_replayMenu-1
				end
			elseif replayMenu > #t_replayMenu then
				replayMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 5 then
				moveTxt = (replayMenu - 6) * 13
			elseif cursorPosY == 0 then
				moveTxt = (replayMenu - 1) * 13
			end
			if #t_replayMenu <= 5 then
				maxreplayMenu = #t_replayMenu
			elseif replayMenu - cursorPosY > 0 then
				maxreplayMenu = replayMenu + 5 - cursorPosY
			else
				maxreplayMenu = 5
			end
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				--ONLINE REPLAYS (watch saved replays of your online matches)
				if replayMenu == 1 then
					--if (resolutionHeight / 3 * 4) ~= resolutionWidth then --To watch an online replay you need to set a 4:3 Resolution to avoid desync
					--if (resolutionHeight / 10 * 16) ~= resolutionWidth then --To watch an online replay you need to set a 16:10 Resolution to avoid desync
					if (math.floor((resolutionHeight / 9 * 16) + 0.5)) ~= resolutionWidth then --To watch an online replay you need to set a 16:9 Resolution to avoid desync
						resolutionInfo = true
						infoScreen = true
					else
						data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
						f_mainReplay()
					end
				--LOCAL REPLAYS (watch saved replays of your local matches)
				elseif replayMenu == 2 then
					f_comingSoon()
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_replayMenu do
			if i == replayMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_replayMenu[i].id, jgFnt, bank, 0, t_replayMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not infoScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "REPLAY MODE")
		textImgDraw(txt_version)
		f_sysTime()
		if maxreplayMenu > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_replayMenu > 6 and maxreplayMenu < #t_replayMenu then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		if infoScreen then f_infoMenu() else drawMenuInputHints() end
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
--; GALLERY SCREENPACK
--;===========================================================
--Left Page Arrow
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
animAddPos(arrowsGL, 264, 5.5)
animUpdate(arrowsGL)
animSetScale(arrowsGL, 0.5, 0.5)

--Right Page Arrow
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
animAddPos(arrowsGR, 312, 5.5)
animUpdate(arrowsGR)
animSetScale(arrowsGR, 0.5, 0.5)

--Input Hints BG
gInputsBG = animNew(sysSff, [[
230,3, 0,0, -1
]])
animSetScale(gInputsBG, 2.9, 0.75)
animSetAlpha(gInputsBG, 155, 22)

--Gallery Input Hints Panel
function drawGalleryInputHints()
	local inputHintYPos = 197
	local inputHintYPos2 = 219
	local hintFont = font2
	local hintFontYPos = 211
	local hintFontYPos2 = 233
	animPosDraw(gInputsBG, -56, 195) --Draw Input Hints BG
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"e","108,"..inputHintYPos,"b","165,"..inputHintYPos,"c","229,"..inputHintYPos,"s","277,"..inputHintYPos,"q","0,"..inputHintYPos2,"w","80,"..inputHintYPos2,"y","174,"..inputHintYPos2,"z","247,"..inputHintYPos2)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Move", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 129, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Previous", 186, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Next", 250, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Hide", 298, hintFontYPos)
	--
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 21, hintFontYPos2)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Reset Position", 101, hintFontYPos2)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Zoom Out", 195, hintFontYPos2)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Zoom In", 268, hintFontYPos2)
end

--;===========================================================
--; GALLERY MENU
--;===========================================================
function f_resetGalleryPos()
artPosX = 160
artPosY = 120
artScale = 0.30 --0.305
end

function f_drawPicture()
	gallery = '0,' .. galleryList-1 .. ', 0,0, 0'
	galleryPic = animNew(gallerySff, gallery)
	animSetScale(galleryPic, artScale, artScale)
	animSetPos(galleryPic, artPosX, artPosY)
	animUpdate(galleryPic)
	animDraw(galleryPic)
end

function f_galleryMenu()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local bufc = 0
	local bufb = 0
	local bufz = 0
	local bufy = 0
	local moveArt = 1 --Start in image 0,0
	local hideMenu = false
	f_resetGalleryPos()
	galleryList = 0 --Important to avoid errors when read
	cmdInput()
	while true do
		--RETURN
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		--NEXT ART PAGE
		elseif ((commandGetState(p1Cmd, 'c') or commandGetState(p2Cmd, 'c')) or 
		((commandGetState(p1Cmd, 'holdc') or commandGetState(p2Cmd, 'holdc')) and bufc >= 30)) and moveArt <= 9 then --moveArt <= Number of your Gallery Limit
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 3)
			f_resetGalleryPos()
			moveArt = moveArt + 1
		--PREVIOUS ART PAGE
		elseif ((commandGetState(p1Cmd, 'b') or commandGetState(p2Cmd, 'b')) or 
		((commandGetState(p1Cmd, 'holdb') or commandGetState(p2Cmd, 'holdb')) and bufb >= 30)) and moveArt > 1 then --Keep in image 0,0 when press previous key until finish
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 3)
			f_resetGalleryPos()
			moveArt = moveArt - 1
		--RESET ART POSITION
		elseif commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
			f_resetGalleryPos()
		--HIDE MENU
		elseif commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
			if not hideMenu then hideMenu = true else hideMenu = false end
		end
		--MOVE UP ART
		if ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or 
		((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 5)) then
			artPosY = artPosY - 1
		--MOVE DOWN ART
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or 
		((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 5)) then
			artPosY = artPosY + 1
		end
		--MOVE LEFT ART
		if ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or 
		((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 5)) then
			artPosX = artPosX - 1
		--MOVE RIGHT ART
		elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or 
		((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 5)) then
			artPosX = artPosX + 1
		end
		--ZOOM IN ART
		if ((commandGetState(p1Cmd, 'z') or commandGetState(p2Cmd, 'z')) or 
		((commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz')) and bufz >= 10)) and artScale <= 10 then
			artScale = artScale + 0.01
		--ZOOM OUT ART
		elseif ((commandGetState(p1Cmd, 'y') or commandGetState(p2Cmd, 'y')) or 
		((commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy')) and bufy >= 10)) and artScale >= 0.01 then
			artScale = artScale - 0.01
		end
		galleryList = moveArt --Use menu position to show image in these order
		f_drawPicture()
		--Draw HUD Assets
		if not hideMenu then
			f_drawQuickText(txt_artNumber, font14, 0, 0, galleryList.."/10", 292, 15) --draw gallery limit numbers text
			--f_drawQuickText(aas, font14, 0, 0, artScale, 292, 55) --scale test
			if moveArt > 1 then
				animDraw(arrowsGL)
				animUpdate(arrowsGL)
			end
			if moveArt <= 9 then
				animDraw(arrowsGR)
				animUpdate(arrowsGR)
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if not hideMenu then drawGalleryInputHints() end --Draw Input Hints Panel
		--ART PAGE BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdc') or commandGetState(p2Cmd, 'holdc') then
			bufb = 0
			bufc = bufc + 1
		elseif commandGetState(p1Cmd, 'holdb') or commandGetState(p2Cmd, 'holdb') then
			bufc = 0
			bufb = bufb + 1
		else
			bufb = 0
			bufc = 0
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
--; SOUND TEST SCREENPACK
--;===========================================================
txt_song = createTextImg(jgFnt, 0, 0, "", 159, 13)

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

--Down Page Arrow
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
animAddPos(songDownArrow, 228, 201.5)
animUpdate(songDownArrow)
animSetScale(songDownArrow, 0.5, 0.5)

--Left Page Arrow
songLeftArrow = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(songLeftArrow, 69, 21)
animUpdate(songLeftArrow)
animSetScale(songLeftArrow, 0.5, 0.5)

--Right Page Arrow
songRightArrow = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(songRightArrow, 242, 21)
animUpdate(songRightArrow)
animSetScale(songRightArrow, 0.5, 0.5)

--Input Hints Panel
function drawSoundTestInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Play", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

--;===========================================================
--; CONFIRM SONG MESSAGE
--;===========================================================
txt_confirmSong = createTextImg(jgFnt, 0, 0, "USE THIS SONG?", 160, 108, 0.63, 0.63)

--Confirm Window BG
confirmSongWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(confirmSongWindowBG, 83.5, 97)
animUpdate(confirmSongWindowBG)
animSetScale(confirmSongWindowBG, 1, 1)

t_confirmSongMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_confirmSongMenu()
	cmdInput()
	--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sysSnd, 100, 0)
		confirmSongMenu = confirmSongMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sysSnd, 100, 0)
		confirmSongMenu = confirmSongMenu + 1
	end
	if confirmSongMenu < 1 then
		confirmSongMenu = #t_confirmSongMenu
		if #t_confirmSongMenu > 4 then
			cursorPosYSongConfirm = 4
		else
			cursorPosYSongConfirm = #t_confirmSongMenu-1
		end
	elseif confirmSongMenu > #t_confirmSongMenu then
		confirmSongMenu = 1
		cursorPosYSongConfirm = 0
	elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') and cursorPosYSongConfirm > 0 then
		cursorPosYSongConfirm = cursorPosYSongConfirm - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') and cursorPosYSongConfirm < 4 then
		cursorPosYSongConfirm = cursorPosYSongConfirm + 1
	end
	if cursorPosYSongConfirm == 4 then
		moveTxtSongConfirm = (confirmSongMenu - 5) * 13
	elseif cursorPosYSongConfirm == 0 then
		moveTxtSongConfirm = (confirmSongMenu - 1) * 13
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(confirmSongWindowBG)
	animUpdate(confirmSongWindowBG)
	--Draw Title
	textImgDraw(txt_confirmSong)
	--Draw Select content
	f_drawQuickText(txt_songSelected, font6, 0, 0, selectedSongName, 160, 120, 0.68, 0.68)
	--Draw Table Text
	for i=1, #t_confirmSongMenu do
		if i == confirmSongMenu then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_confirmSongMenu[i].id, jgFnt, bank, 0, t_confirmSongMenu[i].text, 159, 120+i*13-moveTxtSongConfirm))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYSongConfirm*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Input Hints Panel
	drawConfirmInputHints()
	--Actions
	if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--YES
		if confirmSongMenu == 1 then
			--sndPlay(sysSnd, 100, 1)
		--NO
		else
			selectedSong = nil
		end
		backSongConfirm = true
		f_confirmSongReset()
	end
	cmdInput()
end

function f_confirmSongReset()
	confirmSong = false
	moveTxtSongConfirm = 0
	--Cursor pos in NO
	cursorPosYSongConfirm = 1
	confirmSongMenu = 2
end

--;===========================================================
--; SOUND TEST MENU
--;===========================================================
function f_songMenu()
	playBGM(bgmNothing)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	cmdInput()
	f_confirmSongReset()
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local cursorPosY = 1
	local moveTxt = 0
	local maxItems = 12
	songMenu = 1 --Not local because will be used in other menus
	songFolder = 1
	selectedSong = nil
	folderRefer = "" --To use in random select song
	songChanged = false
	f_soundtrack() --Reload from common.lua
	while true do
		if backSongConfirm == true then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			script.options.f_setCfgSong() --SAVE AND BACK SONG FOR OPTIONS MENU
			f_menuMusic()
			sndPlay(sysSnd, 100, 2)
			backSongConfirm = false
			soundTest = false
			break
		end
		if not confirmSong then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				if soundTest == true or songChanged == false then --Another damn check just to know in what menu where are and if you select something..
					backSongConfirm = true
				else --IF YOU ARE IN SYSTEM SONGS SETTINGS
					confirmSong = true
				end
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				songMenu = songMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sysSnd, 100, 0)
				songMenu = songMenu + 1
			elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				sndPlay(sysSnd, 100, 0)
				songFolder = songFolder - 1
				songMenu = 1 --Restart Cursor Values to prevent nil values issues
				cursorPosY = 1 --Restart Cursor Values to prevent nil values issues
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				sndPlay(sysSnd, 100, 0)
				songFolder = songFolder + 1
				songMenu = 1 --Restart Cursor Values to prevent nil values issues
				cursorPosY = 1 --Restart Cursor Values to prevent nil values issues
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				if songMenu == #t_songList[songFolder] then --BACK
					if soundTest == true or songChanged == false then --Same esc logic
						backSongConfirm = true
					else
						confirmSong = true
					end
				elseif songMenu == #t_songList[songFolder]-1 then --RANDOM SELECT
					if not soundTest then --If you are setting system songs in options
						sndPlay(sysSnd, 100, 1)
						songChanged = true
						selectedSong = t_songList[songFolder][songMenu].path
						selectedSongName = t_songList[songFolder][songMenu].name
						folderRefer = songFolder
						--Back Copy
						if soundTest == true or songChanged == false then --Same esc logic
							backSongConfirm = true
						else
							confirmSong = true
						end
					else --If you are in sound test
						if #t_songList[data.menuSongFolder]-2 ~= 0 then --If there's songs loaded
							--randomSongFolder = math.random(1, #t_songList) --Get random folder song
							--randomSongSel = math.random(1, #t_songList[randomSongFolder]-2)
							randomSongSel = math.random(1, #t_songList[songFolder]-2) --Get random song (-2 excludes back and random select items)
							selectedSong = t_songList[songFolder][randomSongSel].path --Use random song obtained to get his path
							selectedSongName = t_songList[songFolder][randomSongSel].name
							playBGM(selectedSong) --Play Random Song from Folder Selected
						else --If There's no songs loaded
							playBGM(bgmNothing)
						end
					end
				else --Play Selected Song
					if not soundTest then
						sndPlay(sysSnd, 100, 1)
						songChanged = true
					end
					selectedSong = t_songList[songFolder][songMenu].path
					selectedSongName = t_songList[songFolder][songMenu].name
					playBGM(selectedSong)
				end
			end
			--Folder Select Logic
			if songFolder < 1 then
				songFolder = #t_songList
			elseif songFolder > #t_songList then
				songFolder = 1
			end
			--Cursor position calculation
			if songMenu < 1 then
				songMenu = #t_songList[songFolder]
				if #t_songList[songFolder] > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_songList[songFolder]
				end
			elseif songMenu > #t_songList[songFolder] then
				songMenu = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (songMenu - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (songMenu - 1) * 15
			end	
			if #t_songList[songFolder] <= maxItems then
				maxSongs = #t_songList[songFolder]
			elseif songMenu - cursorPosY > 0 then
				maxSongs = songMenu + maxItems - cursorPosY
			else
				maxSongs = maxItems
			end
		end
		--Draw Menu BG
		animDraw(f_animVelocity(songBG0, -1, -1))
		--Draw Transparent Table BG
		animSetScale(songBG1, 220, maxSongs*15)
		animSetWindow(songBG1, 80,20, 160,180)
		animDraw(songBG1)
		--Draw Title Menu
		textImgSetText(txt_song, "SONG SELECT [".. t_songList[songFolder][songMenu].folder .."]")
		textImgDraw(txt_song)
		if not confirmSong then
			--Draw Table Cursor
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		--Draw Text for Table
		for i=1, maxSongs do
			if t_songList[songFolder][i].name:len() > 28 then --If name is too long, shortcut with ...
				songText = string.sub(t_songList[songFolder][i].name, 1, 24)
				songText = tostring(songText .. "...")
			else
				songText = t_songList[songFolder][i].name
			end
			if i > songMenu - cursorPosY then
				t_songList[songFolder][i].id = createTextImg(font2, 0, 1, songText, 85, 15+i*15-moveTxt)
				textImgDraw(t_songList[songFolder][i].id)
			end
		end
		--Draw Up Animated Cursor
		if maxSongs > maxItems then
			animDraw(songUpArrow)
			animUpdate(songUpArrow)
		end
		--Draw Down Animated Cursor
		if #t_songList[songFolder] > maxItems and maxSongs < #t_songList[songFolder] then
			animDraw(songDownArrow)
			animUpdate(songDownArrow)
		end
		--Draw Left Animated Cursor
		if songFolder > 1 then
			animDraw(songLeftArrow)
			animUpdate(songLeftArrow)
		end
		--Draw Right Animated Cursor
		if songFolder < #t_songList then
			animDraw(songRightArrow)
			animUpdate(songRightArrow)
		end
		if confirmSong then f_confirmSongMenu() else drawSoundTestInputHints() end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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

--;===========================================================
--; CUTSCENES SCREENPACK
--;===========================================================
txt_video = createTextImg(jgFnt, 0, 0, "CUTSCENE SELECT", 159, 13)

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
animAddPos(videoDownArrow, 228, 201.5)
animUpdate(videoDownArrow)
animSetScale(videoDownArrow, 0.5, 0.5)

--;===========================================================
--; CUTSCENES MENU
--;===========================================================
function f_videoMenu()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local videoMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	moviesPath = "movie"
	t_videoList = {}
	for file in lfs.dir(moviesPath) do
		if file:match('^.*(%.)[Ww][Mm][Vv]$') then
			row = #t_videoList+1
			t_videoList[row] = {}
			t_videoList[row]['id'] = ''
			t_videoList[row]['name'] = file:gsub('^(.*)[%.][Ww][Mm][Vv]$', '%1')
			t_videoList[row]['path'] = moviesPath.."/"..file
		end
	end
	t_videoList[#t_videoList+1] = {id = '', name = "          BACK"}
	if data.debugLog then f_printTable(t_videoList, "save/debug/t_videoList.txt") end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu + 1
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			if videoMenu == #t_videoList then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			else
				playVideo(t_videoList[videoMenu].path)
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
			end
		end
		if videoMenu < 1 then
			videoMenu = #t_videoList
			if #t_videoList > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_videoList
			end
		elseif videoMenu > #t_videoList then
			videoMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (videoMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (videoMenu - 1) * 15
		end	
		if #t_videoList <= maxItems then
			maxVideos = #t_videoList
		elseif videoMenu - cursorPosY > 0 then
			maxVideos = videoMenu + maxItems - cursorPosY
		else
			maxVideos = maxItems
		end
		animDraw(f_animVelocity(videoBG0, -1, -1))
		animSetScale(videoBG1, 220, maxVideos*15)
		animSetWindow(videoBG1, 80,20, 160,180)
		animDraw(videoBG1)
		textImgDraw(txt_video)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxVideos do
			if t_videoList[i].name:len() > 28 then
				VideoText = string.sub(t_videoList[i].name, 1, 24)
				VideoText = tostring(VideoText .. "...")
			else
				VideoText = t_videoList[i].name
			end
			if i > videoMenu - cursorPosY then
				t_videoList[i].id = createTextImg(font2, 0, 1, VideoText, 85, 15+i*15-moveTxt)
				textImgDraw(t_videoList[i].id)
			end
		end
		if maxVideos > maxItems then
			animDraw(videoUpArrow)
			animUpdate(videoUpArrow)
		end
		if #t_videoList > maxItems and maxVideos < #t_videoList then
			animDraw(videoDownArrow)
			animUpdate(videoDownArrow)
		end
		drawListInputHints()
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
--; STORYBOARDS SCREENPACK
--;===========================================================
txt_storyboard = createTextImg(jgFnt, 0, 0, "STORYBOARD SELECT", 159, 13)

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
animAddPos(storyboardDownArrow, 228, 201.5)
animUpdate(storyboardDownArrow)
animSetScale(storyboardDownArrow, 0.5, 0.5)

--;===========================================================
--; STORYBOARDS MENU
--;===========================================================
function f_storyboardMenu()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local storyboardMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	storyboardsPath = "storyboard"
	t_storyboardList = {}
	for file in lfs.dir(storyboardsPath) do
		if file:match('^.*(%.)[Dd][Ee][Ff]$') then
			row = #t_storyboardList+1
			t_storyboardList[row] = {}
			t_storyboardList[row]['id'] = ''
			t_storyboardList[row]['name'] = file:gsub('^(.*)[%.][Dd][Ee][Ff]$', '%1')
			t_storyboardList[row]['path'] = storyboardsPath.."/"..file
		end
	end
	t_storyboardList[#t_storyboardList+1] = {id = '', name = "          BACK"}
	if data.debugLog then f_printTable(t_storyboardList, "save/debug/t_storyboardList.txt") end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu + 1
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			if storyboardMenu == #t_storyboardList then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			--Play Storyboard
			else
				cmdInput()
				storyboardFile = (t_storyboardList[storyboardMenu].path)
				f_storyboard(storyboardFile) --Start Storyboard
			--When Storyboard Ends:
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				f_menuMusic()
			end
		end
		if storyboardMenu < 1 then
			storyboardMenu = #t_storyboardList
			if #t_storyboardList > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_storyboardList
			end
		elseif storyboardMenu > #t_storyboardList then
			storyboardMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (storyboardMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (storyboardMenu - 1) * 15
		end	
		if #t_storyboardList <= maxItems then
			maxStoryboards = #t_storyboardList
		elseif storyboardMenu - cursorPosY > 0 then
			maxStoryboards = storyboardMenu + maxItems - cursorPosY
		else
			maxStoryboards = maxItems
		end
		animDraw(f_animVelocity(storyboardBG0, -1, -1))
		animSetScale(storyboardBG1, 220, maxStoryboards*15)
		animSetWindow(storyboardBG1, 80,20, 160,180)
		animDraw(storyboardBG1)
		textImgDraw(txt_storyboard)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))		
		for i=1, maxStoryboards do
			if t_storyboardList[i].name:len() > 28 then
				storyboardText = string.sub(t_storyboardList[i].name, 1, 24)
				storyboardText = tostring(storyboardText .. "...")
			else
				storyboardText = t_storyboardList[i].name
			end
			if i > storyboardMenu - cursorPosY then
				t_storyboardList[i].id = createTextImg(font2, 0, 1, storyboardText, 85, 15+i*15-moveTxt)
				textImgDraw(t_storyboardList[i].id)
			end
		end
		if maxStoryboards > maxItems then
			animDraw(storyboardUpArrow)
			animUpdate(storyboardUpArrow)
		end
		if #t_storyboardList > maxItems and maxStoryboards < #t_storyboardList then
			animDraw(storyboardDownArrow)
			animUpdate(storyboardDownArrow)
		end
		drawListInputHints()
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
--; REPLAY SCREENPACK
--;===========================================================
txt_replay = createTextImg(jgFnt, 0, 0, "REPLAY SELECT", 159, 13)
txt_replayData = createTextImg(jgFnt, 0, 0, "REPLAY OPTIONS", 159, 72)

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
animAddPos(replayDownArrow, 228, 201.5)
animUpdate(replayDownArrow)
animSetScale(replayDownArrow, 0.5, 0.5)

--Replay Title Transparent background
replayMenuBG = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(replayMenuBG, 0, 5)
animSetAlpha(replayMenuBG, 20, 100)
animUpdate(replayMenuBG)

--Replay Option background
replayMenuBG2 = animNew(sysSff, [[
250,0, 0,0,
]])
animSetPos(replayMenuBG2, -13, 77)
animUpdate(replayMenuBG2)
animSetScale(replayMenuBG2, 0.9, 0.9)

--Replay Option Input Hints Panel
function drawReplayInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("l","0,"..inputHintYPos,"r","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

--;===========================================================
--; ONLINE REPLAYS MENU
--;===========================================================
t_replayOption = {
	{id = '', text = "DELETE"}, {id = '', text = "WATCH"}, {id = '', text = "RETURN"},
}
for i=1, #t_replayOption do
	t_replayOption[i].id = createTextImg(jgFnt, 0, 0, t_replayOption[i].text, -80+i*120, 172)
end

function f_replayTable()
	replaysPath = "replays"
	t_replayList = {}
	for file in lfs.dir(replaysPath) do
		if file:match('^.*(%.)[Rr][Ee][Pp][Ll][Aa][Yy]$') and not file:match('^data.replay$') then
			row = #t_replayList+1
			t_replayList[row] = {}
			t_replayList[row]['id'] = ''
			t_replayList[row]['name'] = file:gsub('^(.*)[%.][Rr][Ee][Pp][Ll][Aa][Yy]$', '%1')
			t_replayList[row]['path'] = replaysPath.."/"..file
		end
	end
	t_replayList[#t_replayList+1] = {id = '', name = "          BACK"}
	if data.debugLog then f_printTable(t_replayList, "save/debug/t_replayList.txt") end
end

function f_mainReplay()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local mainReplay = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local exitReplayMenu = false
	local maxItems = 12
	netPlayer = "Host"
	coinSystem = false
	f_replayTable() --Load table
	while true do
		if exitReplayMenu then
			onlinegame = false --only for identify purposes
			replaygame = false
			coinSystem = true
			--netPlayer = "" Bloquea el acceso al menu de online en offline dejarlo comentado solo para devs
			assert(loadfile("save/data_sav.lua"))()
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		end
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then exitReplayMenu = true
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainReplay = mainReplay + 1
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--BACK
			if mainReplay == #t_replayList then exitReplayMenu = true
		--OPEN REPLAY CONTROL MENU
			else
				sndPlay(sysSnd, 100, 1)
				txt_replayName = createTextImg(font2, 0, 0, t_replayList[mainReplay].name, 159.5, 16)--Show Replay Selected Name
				local fileSize = lfs.attributes(t_replayList[mainReplay].path).size --Size Logic
				if fileSize > 1048576 then
					local replaySize = (math.floor(((fileSize/1048576)+0.50)))--Conversion from Bytes to Megabytes
					txt_replaySize = createTextImg(font2, 0, 0, replaySize.."MB", 159.5, 27)
				else
					local replaySize = (math.floor(((fileSize/1024)+0.50)))--Conversion from Bytes to Kilobytes
					txt_replaySize = createTextImg(font2, 0, 0, replaySize.."KB", 159.5, 27)
				end
				local replayOption = 2
				f_confirmReset()
				cmdInput()
				while true do
					if not confirmScreen then
						if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
							sndPlay(sysSnd, 100, 2)
							break
						elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') then
							sndPlay(sysSnd, 100, 0)
							replayOption = replayOption + 1
						elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') then
							sndPlay(sysSnd, 100, 0)
							replayOption = replayOption - 1
						end
						if replayOption < 1 then replayOption = 3 elseif replayOption > 3 then replayOption = 1 end
					end
					if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
					--OPEN CONFIRM DELETE REPLAY WINDOW
						if replayOption == 1 then
							sndPlay(sysSnd, 100, 1)
							confirmScreen = true
					--WATCH SELECTED REPLAY
						elseif replayOption == 2 then
							onlinegame = true --only for identify purposes
							replaygame = true
							data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
							sndPlay(sysSnd, 100, 1)
							--Set Default values to prevent desync.
							script.options.f_onlineDefault()
							script.options.f_netsaveCfg()
							enterReplay(t_replayList[mainReplay].path)
							synchronize()
							math.randomseed(sszRandom())
							script.options.f_onlineCfg()
							exitNetPlay()
							exitReplay()
							commandBufReset(p1Cmd, 1)
							commandBufReset(p2Cmd, 1)
					--RETURN TO REPLAY SELECT MENU
						elseif replayOption == 3 then
							sndPlay(sysSnd, 100, 2)
							break
						end
					end
					animDraw(f_animVelocity(replayBG0, -1, -1))
				--Draw Replay Title
					animSetScale(replayMenuBG, 324, 74)
					animSetWindow(replayMenuBG, 0,5, 324,27)
					animDraw(replayMenuBG)
					textImgDraw(txt_replayName)
					textImgDraw(txt_replaySize)
					textImgDraw(txt_replayData)
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
					if not confirmScreen then
						--Draw Cursor
						animSetWindow(cursorBox, -108+replayOption*120,161, 56,15)
						f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
						animDraw(f_animVelocity(cursorBox, -1, -1))
					end
					if confirmScreen then f_confirmMenu() else drawReplayInputHints() end
					--DELETE SELECTED REPLAY
					if deleteReplay then
						os.remove(t_replayList[mainReplay].path)
						t_replayList = nil --Delete the Table
						f_replayTable() --Just reload the table with applied changes
						deleteReplay = false
						break
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
			if #t_replayList > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_replayList
			end
		elseif mainReplay > #t_replayList then
			mainReplay = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (mainReplay - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (mainReplay - 1) * 15
		end
		if #t_replayList <= maxItems then
			maxReplays = #t_replayList
		elseif mainReplay - cursorPosY > 0 then
			maxReplays = mainReplay + maxItems - cursorPosY
		else
			maxReplays = maxItems
		end
		animDraw(f_animVelocity(replayBG0, -1, -1))
		animSetScale(replayBG1, 220, maxReplays*15)
		animSetWindow(replayBG1, 80,20, 160,180)
		animDraw(replayBG1)
		textImgDraw(txt_replay)
		--animSetScale(cursorBox, 160,maxReplays*15) --For Optimized Cursor Box
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxReplays do
			if t_replayList[i].name:len() > 28 then
				replayText = string.sub(t_replayList[i].name, 1, 24)
				replayText = tostring(replayText .. "...")
			else
				replayText = t_replayList[i].name
			end
			if i > mainReplay - cursorPosY then
				t_replayList[i].id = createTextImg(font2, 0, 1, replayText, 85, 15+i*15-moveTxt)
				textImgDraw(t_replayList[i].id)
			end
		end
		if maxReplays > maxItems then
			animDraw(replayUpArrow)
			animUpdate(replayUpArrow)
		end
		if #t_replayList > maxItems and maxReplays < #t_replayList then
			animDraw(replayDownArrow)
			animUpdate(replayDownArrow)
		end
		drawListInputHints()
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
--; ONLINE MENU
--;===========================================================
t_mainNetplay = {
	{id = textImgNew(), text = "HOST [CREATE ROOM]"},
	{id = textImgNew(), text = "CLIENT [JOIN A ROOM]"},
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
		if esc() or commandGetState(p1Cmd, 'e') then
			onlinegame = false --only for identify purposes
			assert(loadfile("save/data_sav.lua"))()
			sndPlay(sysSnd, 100, 2)
			f_resetMenuInputs()
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
			sndPlay(sysSnd, 100, 1)
			--HOST (create online room)
			if mainNetplay == 1 then
				onlinegame = true --only for identify purposes
				script.options.f_onlineDefault()
				script.options.f_netsaveCfg()
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				cancel = f_create()
				if not cancel then
					synchronize()
					math.randomseed(sszRandom())
					script.options.f_onlineCfg()
				end
				exitNetPlay()
				exitReplay()
				commandBufReset(p1Cmd, 1)
				f_saveReplay()
			--CLIENT/JOIN (join an existing room)
			elseif mainNetplay == 2 then
				--Default Connection Method
				if data.connectMode == "Direct" then
					onlinegame = true
					script.options.f_onlineDefault()
					script.options.f_netsaveCfg()
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
					cancel = f_directConnect()
					if not cancel then
						synchronize()
						math.randomseed(sszRandom())
						script.options.f_onlineCfg()
					end
					exitNetPlay()
					exitReplay()
					commandBufReset(p1Cmd, 1)
					f_saveReplay()
				--Host info Stored in a Local Database
				elseif data.connectMode == "Database" then
					f_hostRooms()
				end
			end	
		end
		drawBottomMenuSP()
		for i=1, #t_mainNetplay do
			if i == mainNetplay then
				bank = 3
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainNetplay[i].id, jgFnt, bank, 0, t_mainNetplay[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "ONLINE MODE")
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
		drawMenuInputHints()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		exitNetPlay()
    	exitReplay()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SAVE ONLINE REPLAY
--;===========================================================
function f_saveReplay()
--Create Replay File
	local netplayFile = io.open("save/data.replay","rb") --Read origin file
	if netplayFile ~= nil then
		if not createExit or not joinExit then
			if lfs.attributes("save/data.replay", "size") > 0 then --Save replay if have content
				ltn12.pump.all(
				ltn12.source.file(assert(io.open("save/data.replay", "rb"))), --Use this file to make a copy
				ltn12.sink.file(assert(io.open("replays/" .. os.date("%Y-%m-%d %I-%M%p") .. ".replay", "wb"))) --Save replay with a new name
				)
			end
			netplayFile:close()
			netplayFile = nil
		end
	end
end

--;===========================================================
--; ONLINE ROOM SCREENPACK
--;===========================================================
txt_hostTitle = createTextImg(jgFnt, 5, 0, "ONLINE ROOM CREATED", 159, 13)
txt_client = createTextImg(jgFnt, 0, 0, "Enter Host\'s IPv4", 159, 111)
txt_clientName = createTextImg(jgFnt, 0, 0, "Enter Host\'s Nickname", 159, 110, 0.9, 0.9)
txt_bar = createTextImg(opFnt, 0, 0, "|", 160, 133, 0.65, 0.65)
txt_ip = createTextImg(font14, 0, 0, "", 160, 132)
txt_netPort = createTextImg(jgFnt, 0, 0, "", 159, 72, 0.9, 0.9)
txt_hosting = createTextImg(jgFnt, 0, 0, "", 159, 228)
txt_connecting = createTextImg(jgFnt, 5, 0, "", 159, 228)
txt_cancel = createTextImg(jgFnt, 1, 0, "CANCEL(ESC)", 161, 165)

--Scrolling background
onlineBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(onlineBG0, 160, 0)
animSetTile(onlineBG0, 1, 1)
animSetColorKey(onlineBG0, -1)

--Transparent background
--onlineBG1 = animNew(sysSff, [[
--3,0, 0,0, -1
--]])
--animSetPos(onlineBG1, 20, 20)
--animSetAlpha(onlineBG1, 20, 100)
--animUpdate(onlineBG1)

--Up Arrow
--onlineUpArrow = animNew(sysSff, [[
--225,0, 0,0, 10
--225,1, 0,0, 10
--225,2, 0,0, 10
--225,3, 0,0, 10
--225,3, 0,0, 10
--225,2, 0,0, 10
--225,1, 0,0, 10
--225,0, 0,0, 10
--]])
--animAddPos(onlineUpArrow, 228, 11)
--animUpdate(onlineUpArrow)
--animSetScale(onlineUpArrow, 0.5, 0.5)

--Down Arrow
--onlineDownArrow = animNew(sysSff, [[
--226,0, 0,0, 10
--226,1, 0,0, 10
--226,2, 0,0, 10
--226,3, 0,0, 10
--226,3, 0,0, 10
--226,2, 0,0, 10
--226,1, 0,0, 10
--226,0, 0,0, 10
--]])
--animAddPos(onlineDownArrow, 228, 231)
--animUpdate(onlineDownArrow)
--animSetScale(onlineDownArrow, 0.5, 0.5)

--IP Window BG
textWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(textWindowBG, 83.5, 97)
animUpdate(textWindowBG)
animSetScale(textWindowBG, 1, 1)

--Connecting Window BG
joinWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(joinWindowBG, 83.5, 54)
animUpdate(joinWindowBG)
animSetScale(joinWindowBG, 1, 2)

--Connecting Icon
wirelessBG = animNew(sysSff, [[
400,0, 0,0, 18
400,1, 0,0, 18
400,2, 0,0, 18
400,3, 0,0, 18
400,4, 0,0, 18
400,5, 0,0, 18
400,6, 0,0, 18
]])
animAddPos(wirelessBG, 125, 87.5)
animUpdate(wirelessBG)
animSetScale(wirelessBG, 0.25, 0.25)

--;===========================================================
--; HOST MENU
--;===========================================================
function f_create()
	cmdInput()
	createExit = false
	textImgSetText(txt_hosting, "Waiting for Player 2...")
	enterNetPlay(inputDialogGetStr(inputdia))
	netPlayer = "Host" --For Replay Identify
	--if waitingRoom == "Training" then
		--data.p1In = 1
		--f_training() --Try to Wait client in Training Mode
	--end
	while not connected() do
		if esc() or commandGetState(p1Cmd, 'e') then --btnPalNo(p1Cmd) > 0 does not work when engine is waiting a connection, only esc, that's why still we can't program an Training Waiting Room
		    data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			netPlayer = ""
			return true
		end
		--Draw BG
		animDraw(f_animVelocity(onlineBG0, -1, -1))
		--Draw Menu Title
		textImgDraw(txt_hostTitle)
		--Draw Window BG
		animDraw(joinWindowBG)
		animUpdate(joinWindowBG)
		--Draw Port Info
		textImgSetText(txt_netPort, "Netplay Port ["..getListenPort().."]")
		textImgDraw(txt_netPort)
		--Draw Cancel Button
		textImgDraw(txt_cancel)
		--Draw Cursor
		animSetWindow(cursorBox, 87,155, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Hosting Info
		textImgDraw(txt_hosting)
		--Draw Animated Icon
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
	return false
end

--;===========================================================
--; DIRECT CONNECTION MENU
--;===========================================================
t_directJoinMenu = {
	{id = textImgNew(), text = "BACK"}, {id = textImgNew(), text = "JOIN"},
}
for i=1, #t_directJoinMenu do
	t_directJoinMenu[i].id = createTextImg(jgFnt, 0, 0, t_directJoinMenu[i].text, 12+i*95, 151)
end

function f_directConnect()
	txt_clientTitle = createTextImg(jgFnt, 0, 0, "SEARCH ROOM", 159, 13)
	local ip = ""
	local doneIP = false
	local directJoinMenu = 2
	local i = 0
	joinExit = false
	cmdInput()
	--ENTER IP SCREEN
	while true do
		--EXIT LOGIC
		if joinExit == true then
			clearInputText()
			netPlayer = ""
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			return true
		end
		--MAIN SCREEN
		if not doneIP then
			if esc() then
				joinExit = true
			elseif commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				directJoinMenu = directJoinMenu + 1
			elseif commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				directJoinMenu = directJoinMenu - 1
			end
			if directJoinMenu < 1 then directJoinMenu = 2 elseif directJoinMenu > 2 then directJoinMenu = 1 end
			ip = inputText('num',true)
			if clipboardPaste() then
				if string.match(getClipboardText(),'^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$') then
					setInputText(getClipboardText())
				elseif string.match(getClipboardText(),'^localhost$') then
					setInputText(getClipboardText())
				else
					sndPlay(sysSnd, 100, 5)
				end
			end
			if ip:match('^%.') then
				ip = ""
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
			--BUTTON SELECT
			if btnPalNo(p1Cmd) > 0 then
				--BACK
				if directJoinMenu == 1 then
					joinExit = true
				--JOIN
				elseif directJoinMenu == 2 then
					if ip:match('^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$') then
						doneIP = true
					elseif ip:match('^localhost$') then
						doneIP = true
					else
						sndPlay(sysSnd, 100, 5)
					end
				end
			end
			--Draw BG
			animDraw(f_animVelocity(onlineBG0, -1, -1))
			--Draw Menu Title
			textImgDraw(txt_clientTitle)
			--Draw IP Window BG
			animDraw(textWindowBG)
			animUpdate(textWindowBG)
			--Draw IP Window Title
			textImgDraw(txt_client)
			--Draw IP Text
			textImgSetText(txt_ip,ip)
			textImgDraw(txt_ip)
			if i%60 < 30 then
				textImgPosDraw(txt_bar, 160+(textImgGetWidth(txt_ip)*0.5)+(textImgGetWidth(txt_ip)>0 and 2 or 0), 134)
			end
			--Draw Button Option Text
			for i=1, #t_directJoinMenu do
				if i == directJoinMenu then
					textImgSetBank(t_directJoinMenu[i].id, 5)
				else
					textImgSetBank(t_directJoinMenu[i].id, 0)
				end
				textImgDraw(t_directJoinMenu[i].id)
			end
			--Draw Cursor
			animSetWindow(cursorBox, -9+directJoinMenu*96,141, 48.5,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		i = i >= 60 and 0 or i + 1
		if doneIP then break end --Exit for this bucle to start connecting
		cmdInput()
		refresh()
	end
	--CONNECTING SCREEN
	sndPlay(sysSnd, 100, 1)
	enterNetPlay(ip) --Connect to entered IP address
	netPlayer = "Client"
	textImgSetText(txt_connecting, "Now connecting to ["..ip.."]")
	while not connected() do
		--CANCEL CONNECTION
		if esc() or commandGetState(p1Cmd, 'e') then
			clearInputText()
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			netPlayer = ""
			joinExit = true
			return true
		end
		--Draw Connecting BG
		animDraw(f_animVelocity(onlineBG0, -1, -1))
		--Draw Connecting Menu Title
		textImgSetText(txt_clientTitle, "SEARCHING HOST ROOM")
		textImgDraw(txt_clientTitle)
		--Draw Window BG
		animDraw(joinWindowBG)
		animUpdate(joinWindowBG)
		--Draw Port Info
		textImgSetText(txt_netPort, "Netplay Port ["..getListenPort().."]")
		textImgDraw(txt_netPort)
		--Draw Connecting Info
		textImgDraw(txt_connecting)
		--Draw Cancel Button
		textImgDraw(txt_cancel)
		--Draw Cursor
		animSetWindow(cursorBox, 87,155, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Animated Icon
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
	clearInputText()
	return false
end

--;===========================================================
--; HOST ROOMS MENU
--;===========================================================
function f_hostTable()
	local file = io.open("save/host_rooms.json","r")
	host_rooms = json.decode(file:read("*all"))
	file:close()
	t_hostList = {{id = textImgNew(), text = "ADD NEW ROOM"},}
	for k, v in pairs(host_rooms.IP) do
		t_hostList[#t_hostList + 1] = {id = textImgNew(), text = k, address = v} --Insert Room Names from Local Database
	end
	t_hostList[#t_hostList+1] = {id = textImgNew(), text = "BACK"}
end

function f_hostRooms()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local hostList = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local t_tmp = {}
	f_hostTable()
	f_editHostReset()
	f_crudHostReset()
	--local cancel = false
	while true do
		if editHostScreen == false and crudHostScreen == false then
			if esc() or commandGetState(p1Cmd, 'e') then
				--onlinegame = false
				--assert(loadfile("save/data_sav.lua"))()
				sndPlay(sysSnd, 100, 2)
				break
				--return
			end
			if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				hostList = hostList - 1
			elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
				sndPlay(sysSnd, 100, 0)
				hostList = hostList + 1
			end
			if hostList < 1 then
				hostList = #t_hostList
				if #t_hostList > 5 then
					cursorPosY = 5
				else
					cursorPosY = #t_hostList-1
				end
			elseif hostList > #t_hostList then
				hostList = 1
				cursorPosY = 0
			elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 5 then
				moveTxt = (hostList - 6) * 13
			elseif cursorPosY == 0 then
				moveTxt = (hostList - 1) * 13
			end
			if #t_hostList <= 5 then
				maxhostList = #t_hostList
			elseif hostList - cursorPosY > 0 then
				maxhostList = hostList + 5 - cursorPosY
			else
				maxhostList = 5
			end
			if btnPalNo(p1Cmd) > 0 then
				f_default()
				--ADD NEW HOST ADDRESS
				if hostList == 1 then
					sndPlay(sysSnd, 100, 1)
					editHostScreen = true
				--BACK
				elseif hostList == #t_hostList then
					sndPlay(sysSnd, 100, 2)
					--onlinegame = false
					--assert(loadfile("save/data_sav.lua"))()
					break
				--OPEN CRUD MENU
				else
					sndPlay(sysSnd, 100, 1)
					crudHostScreen = true
				end
			end
		end
		drawBottomMenuSP()
		for i=1, #t_hostList do
			if i == hostList then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_hostList[i].id, jgFnt, bank, 0, t_hostList[i].text, 159, 122+i*13-moveTxt))
		end
		if editHostScreen == false and crudHostScreen == false then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		if editHostScreen == false then
			textImgDraw(txt_gameFt)
			textImgSetText(txt_gameFt, "HOST ROOMS")
			textImgDraw(txt_version)
		end
		f_sysTime()
		if crudHostScreen == false then
			if maxhostList > 6 then
				animDraw(arrowsU)
				animUpdate(arrowsU)
			end
			if #t_hostList > 6 and maxhostList < #t_hostList then
				animDraw(arrowsD)
				animUpdate(arrowsD)
			end
		end
		if not crudHostScreen and not editHostScreen then drawMenuInputHints() end --Draw Input Hints Panel for Host Rooms
		textBar = textBar >= 60 and 0 or textBar + 1
	--CRUD ACTIONS
		hostRoomName = (t_hostList[hostList].text) --Host Name Selected
		hostIP = (t_hostList[hostList].address) --Host IP Address Selected
		if crudHostScreen == true then f_crudHostScreen() end
		if editHostScreen == true then f_editHost() end
	--READ DATA
		if crudHostOption == 2 then
			f_crudHostReset()
			onlinegame = true
			script.options.f_onlineDefault()
			script.options.f_netsaveCfg()
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			cancel = f_databaseConnect()
			if not cancel then
				synchronize()
				math.randomseed(sszRandom())
				script.options.f_onlineCfg()
			end
			exitNetPlay()
			exitReplay()
			commandBufReset(p1Cmd, 1)
			f_saveReplay()
	--UPDATE DATA
		elseif crudHostOption == 3 then
			f_crudHostReset()
			editHostRoom = true --To Update Data
			editHostScreen = true
	--DELETE DATA
		elseif crudHostOption == 1 then
			f_confirmMenu()
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		--exitNetPlay()
    	--exitReplay()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CRUD MENU
--;===========================================================
--CRUD Window BG
crudHostWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(crudHostWindowBG, 60.5, 125)
animUpdate(crudHostWindowBG)
animSetScale(crudHostWindowBG, 1.3, 1.3)

function drawCrudHostInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

t_crudHostOptionU = {{id = '', text = "DELETE"},{id = '', text = "JOIN"},}
t_crudHostOptionD = {{id = '', text = "EDIT"}, {id = '', text = "RETURN"},}

function f_crudHostScreen()
	if crudHostOption ~= 1 then
		cmdInput()
		--Cursor Logic
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			crudHostRow = crudHostRow - 1
			crudHostCursorU = crudHostCursorD
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			crudHostRow = crudHostRow + 1
			crudHostCursorD = crudHostCursorU
		end
		if crudHostRow < 1 then
			crudHostRow = 2
		elseif crudHostRow > 2 then
			crudHostRow = 1
		end
		if crudHostRow == 1 then
			if commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				crudHostCursorU = crudHostCursorU - 1
				crudHostCursorD = crudHostCursorD - 1
			elseif commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				crudHostCursorU = crudHostCursorU + 1
				crudHostCursorD = crudHostCursorD + 1
			end
		elseif crudHostRow == 2 then
			if commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				crudHostCursorD = crudHostCursorD - 1
				crudHostCursorU = crudHostCursorU - 1
			elseif commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				crudHostCursorD = crudHostCursorD + 1
				crudHostCursorU = crudHostCursorU + 1
			end
		end
		if crudHostCursorU < 1 then
			crudHostCursorU = #t_crudHostOptionU
		elseif crudHostCursorU > #t_crudHostOptionU then
			crudHostCursorU = 1
		end
		if crudHostCursorD < 1 then
			crudHostCursorD = #t_crudHostOptionD
		elseif crudHostCursorD > #t_crudHostOptionD then
			crudHostCursorD = 1
		end
		--ACTIONS
		if esc() or commandGetState(p1Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			f_crudHostReset()
		--BUTTON SELECTED
		elseif btnPalNo(p1Cmd) > 0 then
			--DELETE HOST ADDRESS
			if crudHostCursorU == 1 and crudHostRow == 1 then
				sndPlay(sysSnd, 100, 1)
				f_confirmReset()
				crudHostOption = 1
			--JOIN TO HOST ADDRESS
			elseif crudHostCursorU == 2 and crudHostRow == 1 then
				sndPlay(sysSnd, 100, 1)
				crudHostOption = 2
				crudHostScreen = false
			--EDIT HOST ADDRESS
			elseif crudHostCursorD == 1 and crudHostRow == 2 then
				sndPlay(sysSnd, 100, 1)
				crudHostOption = 3
				crudHostScreen = false
			--BACK
			elseif crudHostCursorD == 2 and crudHostRow == 2 then
				sndPlay(sysSnd, 100, 2)
				f_crudHostReset()
			end
		end
	end
	--Draw Crud Window BG
	animDraw(crudHostWindowBG)
	animUpdate(crudHostWindowBG)
	--Draw Crud Title
	txt_crudTitle = createTextImg(font6, 0, 0, hostRoomName.." ROOM", 160, 147.5)
	textImgDraw(txt_crudTitle)
	--Draw Input Hints Panel
	if crudHostOption ~= 1 then drawCrudHostInputHints() end
	--Draw Crud Menu Text
	for i=1, #t_crudHostOptionU do
		if i == crudHostCursorU and crudHostRow == 1 then
			bank = 5
		else
			bank = 0
		end
		t_crudHostOptionU[i].id = createTextImg(jgFnt, bank, 0, t_crudHostOptionU[i].text, 12+i*100, 170)
		textImgDraw(t_crudHostOptionU[i].id)
	end
	for i=1, #t_crudHostOptionD do
		if i == crudHostCursorD and crudHostRow == 2 then
			bank = 5
		else
			bank = 0
		end
		t_crudHostOptionD[i].id = createTextImg(jgFnt, bank, 0, t_crudHostOptionD[i].text, 12+i*100, 190)
		textImgDraw(t_crudHostOptionD[i].id)
	end
	if crudHostOption ~= 1 then
		--Draw Cursors
		if crudHostRow == 1 then
			animSetWindow(cursorBox, -16+crudHostCursorU*100,158, 55,16)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		elseif crudHostRow == 2 then
			animSetWindow(cursorBox, -16+crudHostCursorD*100,178, 55,16)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	end
end

function f_crudHostReset()
	crudHostScreen = false
	crudHostOption = 0
	--Cursor pos in JOIN
	crudHostRow = 1
	crudHostCursorU = 2
	crudHostCursorD = 2
end

--;===========================================================
--; CREATE/UPDATE HOST DATA
--;===========================================================
t_editOption = {
	{id = textImgNew(), text = " CANCEL"}, {id = textImgNew(), text = "  ENTER"},
}
for i=1, #t_editOption do
	t_editOption[i].id = createTextImg(jgFnt, 0, 0, t_editOption[i].text, 12+i*95, 151)
end

function f_editHost()
	cmdInput()
	--ENTER HOST NAME
	if not doneName then
		if commandGetState(p1Cmd, 'r') then
			sndPlay(sysSnd, 100, 0)
			editHostMenu = editHostMenu + 1
		elseif commandGetState(p1Cmd, 'l') then
			sndPlay(sysSnd, 100, 0)
			editHostMenu = editHostMenu - 1
		end
		if editHostMenu < 1 then editHostMenu = 2 elseif editHostMenu > 2 then editHostMenu = 1 end
		editHostName = inputText('',true)
		if clipboardPaste() then
			if string.match(getClipboardText(),'^(.*)') then
				setInputText(getClipboardText())
			else
				sndPlay(sysSnd, 100, 5)
			end
		end
		if editHostName:len() > 5 then
			editHostName = editHostName:sub(1,16)
			setInputText(editHostName)
		end
		if editHostName ~= '' and editHostName ~= nil then
			if editHostName:match('^"*(%")$') then
				editHostName = editHostName:gsub('^("*)[%"]$','%1')
				setInputText(editHostName)
			end
		end
		--ACTIONS
		if esc() then
			sndPlay(sysSnd, 100, 2)
			f_editHostReset()
		elseif commandGetState(p1Cmd, 'w') then
			--BACK
			if editHostMenu == 1 then
				sndPlay(sysSnd, 100, 2)
				f_editHostReset()
			--SAVE NAME
			elseif editHostMenu == 2 then
				if editHostName ~= '' and editHostName ~= nil then
					clearInputText()
					sndPlay(sysSnd, 100, 1)
					hostName = (tostring(editHostName))
					doneName = true
				else
					sndPlay(sysSnd, 100, 5)
				end
			end
		end
		--Draw Fade BG
		animDraw(fadeWindowBG)
		--Draw Name Window BG
		animDraw(textWindowBG)
		animUpdate(textWindowBG)
		--Draw Name Window Title
		textImgDraw(txt_clientName)
		--Draw Name Text
		textImgSetText(txt_ip,editHostName)
		textImgDraw(txt_ip)
		if textBar%60 < 30 then
			textImgPosDraw(txt_bar, 160+(textImgGetWidth(txt_ip)*0.5)+(textImgGetWidth(txt_ip)>0 and 2 or 0), 134)
		end
		--Draw Button Option Text
		for i=1, #t_editOption do
			if i == editHostMenu then
				textImgSetBank(t_editOption[i].id, 5)
			else
				textImgSetBank(t_editOption[i].id, 0)
			end
			textImgDraw(t_editOption[i].id)
		end
		--Draw Cursor
		animSetWindow(cursorBox, -9+editHostMenu*96,141, 48.5,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Hint Info
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, "COPIED TEXT CAN BE PASTED WITH CTRL V")
	--ENTER HOST IP ADDRESS
	else
		if commandGetState(p1Cmd, 'r') then
			sndPlay(sysSnd, 100, 0)
			editHostMenu = editHostMenu + 1
		elseif commandGetState(p1Cmd, 'l') then
			sndPlay(sysSnd, 100, 0)
			editHostMenu = editHostMenu - 1
		end
		if editHostMenu < 1 then editHostMenu = 2 elseif editHostMenu > 2 then editHostMenu = 1 end
		hostAddress = inputText('num',true)
		if clipboardPaste() then
			if string.match(getClipboardText(),'^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$') then
				setInputText(getClipboardText())
			elseif string.match(getClipboardText(),'^localhost$') then
				setInputText(getClipboardText())
			else
				sndPlay(sysSnd, 100, 5)
			end
		end
		if hostAddress:match('^%.') then
			hostAddress = ''
			setInputText(hostAddress)
		elseif hostAddress:len() > 15 then
			hostAddress = hostAddress:sub(1,15)
			setInputText(hostAddress)
		elseif hostAddress:match('%.%.+') then
			hostAddress = hostAddress:gsub('%.%.+','.')
			setInputText(hostAddress)
		elseif hostAddress:match('%d%d%d%d+') then
			hostAddress = hostAddress:gsub('(%d%d%d)%d+','%1')
			setInputText(hostAddress)
		elseif hostAddress:match('%d+%.%d+%.%d+%.%d+%.') then
			hostAddress = hostAddress:gsub('(%d+%.%d+%.%d+%.%d+)%.','%1')
			setInputText(hostAddress)
		end
		--ACTIONS
		if esc() then
			sndPlay(sysSnd, 100, 2)
			f_editHostReset()
		--BUTTON SELECTED
		elseif btnPalNo(p1Cmd) > 0 then
			--BACK
			if editHostMenu == 1 then
				sndPlay(sysSnd, 100, 2)
				f_editHostReset()
			--ENTER IP
			elseif editHostMenu == 2 then
				if hostAddress:match('^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$') then
					doneAddress = true
				elseif hostAddress:match('^localhost$') then
					doneAddress = true
				else
					sndPlay(sysSnd, 100, 5)
				end
			end
		end
		--Draw Fade BG
		animDraw(fadeWindowBG)
		--Draw IP Window BG
		animDraw(textWindowBG)
		animUpdate(textWindowBG)
		--Draw IP Window Title
		textImgSetText(txt_client, "Enter Host\'s IPv4")
		textImgDraw(txt_client)
		--Draw IP Text
		textImgSetText(txt_ip,hostAddress)
		textImgDraw(txt_ip)
		if textBar%60 < 30 then
			textImgPosDraw(txt_bar, 160+(textImgGetWidth(txt_ip)*0.5)+(textImgGetWidth(txt_ip)>0 and 2 or 0), 134)
		end
		--Draw Button Option Text
		for i=1, #t_editOption do
			if i == editHostMenu then
				textImgSetBank(t_editOption[i].id, 5)
			else
				textImgSetBank(t_editOption[i].id, 0)
			end
			textImgDraw(t_editOption[i].id)
		end
		--Draw Cursor
		animSetWindow(cursorBox, -9+editHostMenu*96,141, 48.5,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Hint Info
		textImgDraw(txt_titleFt)
		textImgSetText(txt_titleFt, "COPIED IP CAN BE PASTED WITH CTRL V")
	end
	--SAVE ALL DATA
	if doneAddress == true then
		sndPlay(sysSnd, 100, 1)
		if editHostRoom == true then host_rooms.IP[hostRoomName] = nil end --To Update Data
		host_rooms.IP[hostName] = hostAddress
		t_tmp = {}
		for i = 1, #t_hostList do
			if i < #t_hostList then
				t_tmp[i] = t_hostList[i]
			else
				t_tmp[i] = {id = textImgNew(), text = hostName, address = hostAddress}
				t_tmp[i + 1] = t_hostList[i]
			end
		end
		t_hostList = t_tmp
		local file = io.open("save/host_rooms.json","w+")
		file:write(json.encode(host_rooms, {indent = true}))
		file:close()
		f_hostTable() --Refresh
		f_editHostReset()
	end
	cmdInput()
end

function f_editHostReset()
	clearInputText()
	editHostScreen = false
	editHostRoom = false
	doneAddress = false
	doneName = false
	editHostName = ""
	hostAddress = ""
	textBar = 0
	editHostMenu = 2 --Cursor pos in ENTER
end

--;===========================================================
--; READ LOCAL DATABASE TO CONNECTING MENU
--;===========================================================
function f_databaseConnect()
	cmdInput()
	sndPlay(sysSnd, 100, 1)
	joinExit = false
	txt_clientTitle = createTextImg(jgFnt, 0, 0, hostRoomName.."'s ROOM", 159, 13)
	enterNetPlay(hostIP) --Connect to entered IP address
	netPlayer = "Client"
	textImgSetText(txt_connecting, "Now connecting to ["..hostIP.."]")
	while not connected() do
		--CANCEL CONNECTION
		if esc() or commandGetState(p1Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			netPlayer = ""
			joinExit = true
			return true
		end
		--Draw Connecting BG
		animDraw(f_animVelocity(onlineBG0, -1, -1))
		--Draw Connecting Title
		textImgDraw(txt_clientTitle)
		--Draw Window BG
		animDraw(joinWindowBG)
		animUpdate(joinWindowBG)
		--Draw Port Info
		textImgSetText(txt_netPort, "Netplay Port ["..getListenPort().."]")
		textImgDraw(txt_netPort)
		--Draw Connecting Info
		textImgDraw(txt_connecting)
		--Draw Cancel Button
		textImgDraw(txt_cancel)
		--Draw Cursor
		animSetWindow(cursorBox, 87,155, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Animated Icon
		animDraw(wirelessBG)
		animUpdate(wirelessBG)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
	return false
end

--;===========================================================
--; LOBBY MENU
--;===========================================================
t_mainLobby = {
	{id = textImgNew(), text = ""},
	{id = textImgNew(), text = "PRACTICE"},
	{id = textImgNew(), text = "ARCADE"},
	{id = textImgNew(), text = "TOWER"},
	{id = textImgNew(), text = "SURVIVAL"},
	{id = textImgNew(), text = "ENDLESS"},
	{id = textImgNew(), text = "BOSS RUSH"},
	{id = textImgNew(), text = "BONUS RUSH"},
	{id = textImgNew(), text = "SUDDEN DEATH"},
	--{id = textImgNew(), text = "TIME ATTACK"},
	--{id = textImgNew(), text = "SCORE ATTACK"},
	{id = textImgNew(), text = "ONLINE SETTINGS"},
}

function f_mainLobby()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local mainLobby = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local cancel = false
	while true do
		--assert(loadfile("save/temp_sav.lua"))()
		if esc() or commandGetState(p1Cmd, 'e') or data.replayDone == true then
			sndPlay(sysSnd, 100, 2)
			data.replayDone = false
			f_saveTemp()
			break
		end
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainLobby = mainLobby - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			mainLobby = mainLobby + 1
		end
		if mainLobby < 1 then
			mainLobby = #t_mainLobby
			if #t_mainLobby > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_mainLobby-1
			end
		elseif mainLobby > #t_mainLobby then
			mainLobby = 1
			cursorPosY = 0
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (mainLobby - 6) * 13
		elseif cursorPosY == 0 then
			moveTxt = (mainLobby - 1) * 13
		end
		if #t_mainLobby <= 5 then
			maxmainLobby = #t_mainLobby
		elseif mainLobby - cursorPosY > 0 then
			maxmainLobby = mainLobby + 5 - cursorPosY
		else
			maxmainLobby = 5
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			if replaygame == true then setGameMode('replay') end
			data.p2In = 2
			data.p2Faces = true
			data.coop = true
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 1)
			--ONLINE VERSUS
			if mainLobby == 1 then
				data.coop = false
				data.stageMenu = true
				setHomeTeam(1)
				data.gameMode = "versus"
				data.rosterMode = "versus"
				if data.ftcontrol > 0 then
					textImgSetText(txt_mainSelect, "ONLINE RANKED VERSUS")
				else
					textImgSetText(txt_mainSelect, "ONLINE VERSUS")
				end
				script.select.f_selectSimple()
			--ONLINE TRAINING
			elseif mainLobby == 2 then
				setRoundTime(-1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.coop = false
				data.stageMenu = true
				data.versusScreen = false
				data.gameMode = "training"
				data.rosterMode = "training"
				textImgSetText(txt_mainSelect, "ONLINE TRAINING")
				script.select.f_selectSimple()
			--ONLINE ARCADE	
			elseif mainLobby == 3 then
				data.serviceScreen = true
				data.gameMode = "arcade"
				data.rosterMode = "arcade"
				textImgSetText(txt_mainSelect, "ONLINE ARCADE COOPERATIVE")
                script.select.f_selectAdvance()
			--ONLINE TOWER
			elseif mainLobby == 4 then
				f_loadTowers()
				if #t_selTower ~= 0 then
					data.gameMode = "tower"
					data.rosterMode = "tower"
					--data.arcadeIntro = true
					data.arcadeEnding = true
					textImgSetText(txt_mainSelect, "ONLINE TOWER COOPERATIVE")
					script.select.f_selectAdvance()
				end
			--ONLINE SURVIVAL	
			elseif mainLobby == 5 then
				data.gameMode = "survival"
				data.rosterMode = "survival"
				textImgSetText(txt_mainSelect, "ONLINE SURVIVAL COOPERATIVE")
				script.select.f_selectAdvance()
			--ONLINE ENDLESS
			elseif mainLobby == 6 then
				data.gameMode = "endless"
				data.rosterMode = "endless"
				textImgSetText(txt_mainSelect, "ONLINE ENDLESS COOPERATIVE")
				script.select.f_selectAdvance()
			--ONLINE BOSS RUSH
			elseif mainLobby == 7 then
				if #t_bossChars ~= 0 then
					data.gameMode = "bossrush"
					data.rosterMode = "boss"
					textImgSetText(txt_mainSelect, "ONLINE BOSS RUSH COOPERATIVE")
					script.select.f_selectAdvance()
				end	
			--ONLINE BONUS RUSH
			elseif mainLobby == 8 then
				if #t_bonusChars ~= 0 then
					data.versusScreen = false
					data.gameMode = "bonusrush"
					data.rosterMode = "bonus"
					textImgSetText(txt_mainSelect, "ONLINE BONUS RUSH COOPERATIVE")
					script.select.f_selectAdvance()
				end	
			--ONLINE SUDDEN DEATH
			elseif mainLobby == 9 then
				setRoundTime(1000)
				setLifeMul(0)
				data.gameMode = "allroster"
				data.rosterMode = "suddendeath"
				textImgSetText(txt_mainSelect, "ONLINE SUDDEN DEATH COOPERATIVE")
				script.select.f_selectAdvance()
		--[[
			--ONLINE TIME ATTACK
			elseif mainLobby == 10 then
				setRoundTime(-1)
				data.gameMode = "allroster"
				data.rosterMode = "timeattack"
				textImgSetText(txt_mainSelect, "ONLINE TIME ATTACK COOPERATIVE")
				script.select.f_selectAdvance()
			--ONLINE SCORE ATTACK
			elseif mainLobby == 11 then
				setRoundTime(-1)
				data.gameMode = "allroster"
				data.rosterMode = "scoreattack"
				textImgSetText(txt_mainSelect, "ONLINE SCORE ATTACK COOPERATIVE")
				script.select.f_selectAdvance()
		]]
			--ONLINE SETTINGS
			elseif mainLobby == #t_mainLobby then
				script.options.f_onlineCfg()
			end			
		end
		drawBottomMenuSP()
		for i=1, #t_mainLobby do
			if i == mainLobby then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_mainLobby[i].id, jgFnt, bank, 0, t_mainLobby[i].text, 159, 122+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "ONLINE MENU")
		textImgDraw(txt_version)
		f_sysTime()
		if netPlayer == "Host" then
			t_mainLobby[1].text = "VERSUS PLAYER 2"
		elseif netPlayer == "Client" then
			t_mainLobby[1].text = "VERSUS PLAYER 1"
		end
		if maxmainLobby > 6 then
			animDraw(arrowsU)
			animUpdate(arrowsU)
		end
		if #t_mainLobby > 6 and maxmainLobby < #t_mainLobby then
			animDraw(arrowsD)
			animUpdate(arrowsD)
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; THE VAULT SCREENPACK
--;===========================================================
txt_vaultTitle = createTextImg(font6, 0, 0, "THE VAULT", 159, 28)
txt_vaultBar = createTextImg(opFnt, 0, 0, "|", 160, 130, 0.65, 0.65)
txt_vaultText = createTextImg(font14, 0, 0, "", 160, 117)

--Background
vaultBG0 = animNew(sysSff, [[
2000,1, 0,0,
]])
animSetPos(vaultBG0, 160, 119)
animUpdate(vaultBG0)
animSetScale(vaultBG0, 0.30, 0.305)

--Text Window BG
vaultWindowBG = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(vaultWindowBG, 20, 100)
animSetAlpha(vaultWindowBG, 20, 100)
animUpdate(vaultWindowBG)

--;===========================================================
--; THE VAULT MENU
--;===========================================================
t_vaultMenu = {
	{id = textImgNew(), text = "BACK"}, {id = textImgNew(), text = "ENTER"},
}
for i=1, #t_vaultMenu do
	t_vaultMenu[i].id = createTextImg(jgFnt, 0, 0, t_vaultMenu[i].text, 56+i*70, 230)
end

function f_randomWords()
	txt_vaultWords = createTextImg(jgFnt, 0, 0, "", 0, 0,0.9,0.9)
	local t_randomWord = {"Don't touch!", "Just, stop.", "No one seems to be home.", "zzzZZZ...", "Go away!", "No!", "It's a secret...", "Stop it!", "Not allowed!", "Nothing to see here...", '"CD3" is a joke alias of evil CD2.', "Ready to leave yet?", "Whenever you're ready...", "Fine, I can wait.", "So... what's up?", "Are you always like this?", "I mean, what's the point?", "Let me guess, you're gonna push the button?", "What a surprise...", "Don't push the button!", "I'm gonna stop talking", "...", "......", "GAH!", "I have heard about you "..data.userName..".", "Do you know what name of this Ikemen Plus was going to be?", "It was actually going to be called Ikemen Plus ???", "Zen is the search for enlightenment", "SSZ is a programming language written by Suehiro", "OpenGL? what's that?", "Who would thought that Ikemen Go had a Plus Version", "Go beyond, plus ULTRA!", "PlasmoidThunder? he is one of the greats devs", "If I could have access to an internet database...", "CD2 likes Geometry Dash so much that it occurred to him to imitate this screen", "I am a Legend?", "This is not supposed to be here but yes in the USX Project..", "I debuted in v1.3 of Ikemen Plus Ultra", "Is CD2 really planning to make all those changes from it TODO List?", "Did you know that this guy who programmed me started learning this in 2021?", "Let's play hangman S- _ _ _ E", "Let's play hangman U _ _ R _", "Let's play hangman _ _ N", "Press Start To Select an Option", "You can Write below", "Saquen a CD2 de Latinoamerica JAJAJA, mas bien por estar alli esto surgio", "Strong FS? is the guy that inspired CD2", "Greetings! "..data.userName}
	if data.userName == "Strong FS" or data.userName == "strong fs" or data.userName == "StrongFS" or data.userName == "strongfs" or data.userName == "Strong Fs" or data.userName == "STRONG FS" or data.userName == "STRONGFS" then
		table.insert(t_randomWord,1, "Hey Strong! CD2 te manda Saludoss")
		table.insert(t_randomWord,2, "Hmmm Strong XD")
	end
	txtRandom = (t_randomWord[math.random(1, #t_randomWord)])
end

function f_prizeWords()
	txt_vaultWords = createTextImg(jgFnt, 5, 0, "", 0, 0,0.9,0.9)
	local t_randomWord = {"YES! YOU DID IT. If you go back to Main Menu you might find a surprise 0_0", "Well, this is a little Minigame to show you what the LUA is capable of"}
	txtRandom = (t_randomWord[math.random(1, #t_randomWord)])
end

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
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	while true do
		--EXIT LOGIC
		if vaultExit == true then
			clearInputText()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			f_menuMusic()
			break
		end
		--MAIN SCREEN
		if esc() then
			vaultExit = true
		elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') then
			sndPlay(sysSnd, 100, 0)
			vaultMenu = vaultMenu + 1
		elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') then
			sndPlay(sysSnd, 100, 0)
			vaultMenu = vaultMenu - 1
		end
		if vaultMenu < 1 then vaultMenu = 2 elseif vaultMenu > 2 then vaultMenu = 1 end
		word = inputText('',true)
		if clipboardPaste() then
			if string.match(getClipboardText(),'^(.*)') then
				setInputText(getClipboardText())
			else
				sndPlay(sysSnd, 100, 5)
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
						sndPlay(sysSnd, 100, 1)
						data.vault = "Ultra"
						f_saveProgress()
						assert(loadfile("save/stats_sav.lua"))()
						prize = true
					elseif vaultKey == "zen" or vaultKey == "Zen" or vaultKey == "ZEN" then
						sndPlay(sysSnd, 100, 1)
						data.vault = "Zen"
						f_saveProgress()
						assert(loadfile("save/stats_sav.lua"))()
						prize = true
					elseif vaultKey == "ssz" or vaultKey == "Ssz" or vaultKey == "SSZ" then
						sndPlay(sysSnd, 100, 1)
						data.vault = "SSZ"
						f_saveProgress()
						assert(loadfile("save/stats_sav.lua"))()
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

--;===========================================================
-- LEADERBOARDS SCREEN (display rankings data)
--;===========================================================
function f_rankings()
	--TODO
end

--;===========================================================
--; UNLOCK INFO SCREEN
--;===========================================================
txt_msgMenu = createTextImg(jgFnt, 0, 1, "", 0, 0) --Text that appears in black screens important message

function f_secret()
	local i = 0
	txt = "COMPLETE THE ARCADE MODE TO UNLOCK THIS FEATURE!"
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
--; COMING SOON INFO SCREEN
--;===========================================================
function f_comingSoon()
	f_resetMenuInputs()
	local i = 0
	txt = "THIS FEATURE WILL BE AVAILABLE COMING SOON..."
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
--; INTERMISSION SCREENPACK
--;===========================================================
--Intermission Scrolling background
intermissionBG0 = animNew(sysSff, [[
101,0, 0,0, -1
]])
animAddPos(intermissionBG0, 160, 0)
animSetTile(intermissionBG0, 1, 1)
animSetColorKey(intermissionBG0, -1)

--Intermission Scrolling background 2
intermissionBG1 = animNew(towerSff, [[
0,0, 0,0, -1
]])
animAddPos(intermissionBG1, 160, 0)
animSetTile(intermissionBG1, 1, 1)
animSetColorKey(intermissionBG1, -1)
animSetAlpha(intermissionBG1, 150, 0)

--Intermission Scrolling background 2
intermissionBG2 = animNew(sysSff, [[
230,3, 0,0, -1
]])
animAddPos(intermissionBG2, -55, 47)
animSetScale(intermissionBG2, 2.849, 2.31)
animUpdate(intermissionBG2)

--Intermission Transparent Up BG
intermissionWindowSlideU = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(intermissionWindowSlideU, 160, 0)
animSetTile(intermissionWindowSlideU, 1, 1)
animSetWindow(intermissionWindowSlideU, -54, 28, 428, 20)

--Intermission Transparent Down BG
intermissionWindowSlideD = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(intermissionWindowSlideD, 160, 0)
animSetTile(intermissionWindowSlideD, 1, 1)
animSetWindow(intermissionWindowSlideD, -54, 190, 428, 20)

txt_intermissionBox = [[

CHALLENGER 
APPROACHING!

]]

--;===========================================================
--; INTERMISSION (SECRET FIGHT)
--;===========================================================
function f_getIntermission()
t_secretChallenger = {} --If you use a char that can appear in the intermission, this table will guarantee when randomizing it you fight against another
for i, c in ipairs(t_intermissionChars) do --Read all table items and save each value in c var
	local intermissionChar = c['path'] --Create variable with name from t_intermissionChars now stored in c var (Since it is in a for, the name will be different in each round)
	if getPlayerSide() == "p1left" or getPlayerSide() == "p2left" then
		selectaChar = data.t_p1selected[1]['path'] --Create another variable with the first name from data.t_p1selected (Your Selected Character)
	elseif getPlayerSide() == "p1right" or getPlayerSide() == "p2right" then
		selectaChar = data.t_p2selected[1]['path']
	end
	if intermissionChar ~= selectaChar then --Compare both names stored in previous vars and if the names are differents:
	--Add only different intermission chars from the one you are using in this table
		table.insert(t_secretChallenger, {['cel'] = t_charAdd[intermissionChar], ['name'] = t_selChars[t_charAdd[intermissionChar]+1].name, ['displayname'] = t_selChars[t_charAdd[intermissionChar]+1].displayname, ['path'] = intermissionChar, ['author'] = t_selChars[t_charAdd[intermissionChar]+1].author})
	end
end
if data.debugLog then f_printTable(t_secretChallenger, "save/debug/t_secretChallenger.txt") end
end

function f_intermission() --Secret Fight Intro
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	playBGM("sound/system/Intermission.mp3")
	local intermissionTime = 0
	local intermissionTxt = f_extractText(txt_intermissionBox)
	local txt = "WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!"
	local txt_warningInterU = createTextImg(font6, 0, 1, txt, 0, 42)
	local txt_warningInterD = createTextImg(font6, 0, -1, txt, 320, 205)
	local black = 0 --alphaS
	local charPortrait = false
	local charAnim = false
	secretSel = t_secretChallenger[math.random(#t_secretChallenger)].cel --pick a random intermission char
	secretChar = t_selChars[secretSel+1] --use previous selection to get table position
	local scaleData = nil
	if secretChar.intermissionSprScale ~= nil then
		scaleData = secretChar.intermissionSprScale
	else
		scaleData = "1.0,1.0"
	end
	local xPortScale, yPortScale = scaleData:match('^([^,]-)%s*,%s*(.-)$')
	if secretChar.sffData ~= nil and secretChar.stand ~= nil then
		charAnim = f_animFromTable(secretChar['stand'], secretChar.sffData, 160, 180, secretChar.xscale, secretChar.yscale, 0, 1, black)
	end
	if secretChar.sffData ~= nil and secretChar.intermissionSpr ~= nil then
		charPortrait = f_animFromTable(secretChar['intermissionSpr'], secretChar.sffData, 0, 40, xPortScale, yPortScale, 0, 1, black)
	end
	while true do
		if intermissionTime == 500 then
			--cmdInput()
			break
		end
		intermissionTime = intermissionTime + 1
		--Draw BG Assets
		animDraw(f_animVelocity(intermissionBG0, -1, -1))
		--animDraw(f_animVelocity(intermissionBG1, -1, -1))
		animDraw(intermissionBG2)
		animDraw(f_animVelocity(intermissionWindowSlideU, -1.5, 0))
		animDraw(f_animVelocity(intermissionWindowSlideD, 1.5, 0))
		--Draw Warning Text
		textImgDraw(f_textVelocity(txt_warningInterU, -1.5, 0))
		textImgDraw(f_textVelocity(txt_warningInterD, 1.2, 0))
		--Draw Approaching Text
		for i = 1, #intermissionTxt do
			textImgDraw(f_updateTextImg(textImgNew(), jgFnt, 5, 0, intermissionTxt[i], 255, 115 + 12 * (i - 1)))
		end
	--Draw Character Portraits
		if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
			if charPortrait then
				animDraw(charPortrait)
				animUpdate(charPortrait)
			end
		end
	--Draw Character Sprite Animations
		if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
			if charAnim then
				animDraw(charAnim)
				animUpdate(charAnim)
			end
		end
		--animDraw(data.fadeTitle)
		--animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

function f_secretFight()
	--Load Side Player Data
	if getPlayerSide() == "p1left" or getPlayerSide() == "p2left" then
		keepLSide = true
	elseif getPlayerSide() == "p1right" or getPlayerSide() == "p2right" then
		keepRSide = true
	end
	f_default()
	data.rosterMode = "versus"
	data.gameMode = "intermission"
	setGameMode('intermission')
	setRoundTime(-1)
	data.victoryscreen = false
	--ARCADE PLAYER IS IN LEFT SIDE - SECRET CHALLENGER COMES FROM RIGHT SIDE
	if keepLSide then
		data.p1TeamMenu = {mode = 0, chars = 1} --{mode = p1RestoreTeamMode, chars = p1RestoreCharsNo}
		data.p2TeamMenu = {mode = 0, chars = 1}
		data.p1Char = {data.t_p1selected[1].cel} --Get previous Arcade Character Selected --{t_charAdd[t_selChars[data.t_p1selected[1].cel+1].char]}
		data.p2Char = {secretSel} --Set intermission rival
		data.p1Pal = data.t_p1selected[1].pal --Get previous Palette Selected
		data.p2Pal = 1
		if P2overP1 then
			remapInput(1, 2)
		end
		data.p2In = 1
--ARCADE PLAYER IS IN RIGHT SIDE - SECRET CHALLENGER COMES FROM LEFT SIDE
	elseif keepRSide then
		data.p1TeamMenu = {mode = 0, chars = 1}
		data.p2TeamMenu = {mode = 0, chars = 1} --{mode = p2RestoreTeamMode, chars = p2RestoreCharsNo}
		data.p1Char = {secretSel}
		data.p2Char = {data.t_p2selected[1].cel}
		data.p1Pal = 1
		data.p2Pal = data.t_p2selected[1].pal
		remapInput(1, 2)
		if not P2overP1 then
			remapInput(2, 1)
		end
		setPlayerSide('p1right')
		data.p1In = 2
		data.p2In = 2
	end
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	script.select.f_selectSimple()
	if getPlayerSide() == "p1right" then --Player 1 in Right Side
		if script.select.winner == 2 then --Save progress only if you win
			secretTarget = data.t_p1selected --store character data to use for unlocking purposes
			f_secretProgress()
		end
	else --Player 1 in Left Side
		if script.select.winner == 1 then
			secretTarget = data.t_p2selected
			f_secretProgress()
		end
	end
end

function f_secretProgress()
local goukiName = "Shin Gouki"
local unlockScreen = t_selChars[secretTarget[1].cel+1]
--Show Unlock Screen if is available
if unlockScreen.UnlockStoryboard ~= nil and io.open(unlockScreen.UnlockStoryboard or '','r') ~= nil then
	f_storyboard(unlockScreen.UnlockStoryboard)
elseif unlockScreen.UnlockMovie ~= nil and io.open(unlockScreen.UnlockMovie or '','r') ~= nil then
	playVideo(unlockScreen.UnlockMovie)
end
if secretTarget[1].displayname == goukiName then data.gouki = true end --Unlock Shin Gouki if you defeat him in arcade intermission
secretTarget = "" --Reset Var
f_saveProgress()
end

--;===========================================================
--; CREDITS SCREEN
--;=========================================================== 
function f_playCredits()
	sndStop()
	if data.rosterMode ~= "story" then playBGM("sound/system/credits.mp3") end
	local scroll = 0
	local speed = 0
	local speed1 = 0.5
	local speed2 = 1.8
	local skip = false
	local txtFont = font7--font14
	local txtBank = 0
	local txtAline = 0 --[1]= Align text left | [0]= Center Text | [-1]= Align text right
	local txtSpacing = 12 --spacing between lines (rendering Y position increasement for each line)
	local txtScaleX = 1
	local txtScaleY = 1
	local txtAlphaS = 255
	local txtAlphaD = 0
	local creditsTable = f_extractText(txt_creditsBox) --This returns a table with all text in the same written order
	cmdInput()
	data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
	while true do
		if scroll > 2480 or esc() then break end --Credits Duration
		--Actions
		if (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) and not skip then --Skip Button
			skip = true
		elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) and skip then --Unskip Button
			skip = false
		end
		if not skip then speed = speed1 --Normal
		elseif skip then speed = speed2 --Faster
		end
		--Draw Text
		for i = 1, #creditsTable do
			textImgDraw(f_updateTextImg(textImgNew(), txtFont, txtBank, txtAline, creditsTable[i], 155, 260 + txtSpacing * (i - 1) - scroll, txtScaleX, txtScaleY, txtAlphaS, txtAlphaD))
		end
		if data.debugMode then
			f_drawQuickText(speedTest, font14, 0, 1, scroll, 50, 100) --Test Timer
		end
		scroll = scroll + speed
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
	--When End
	data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
	if data.attractMode == true then
		playBGM(bgmTitle)
	elseif data.rosterMode == "story" then
		playBGM(bgmStory)
	elseif data.rosterMode == "arcade" or data.rosterMode == "tower" then
		--Nothing because game over screen comes...
	else
		f_menuMusic()
	end
	if data.intermission then
		f_getIntermission() --Load t_secretChallenger
		--Conditions to enter in secret fight
		if #t_secretChallenger ~= 0 and data.continueCount == 0 and data.difficulty >= 4 then
			f_intermission()
			f_secretFight()
		end
	end
	f_default()
end

txt_creditsBox = [[
I.K.E.M.E.N PLUS ULTRA
DEVELOPER BUILD



MAIN PROGRAMMING

SUEHIRO
ALCERIS
K4THOS
SHINLUCHO
NEATUNSOU
WINDBLADE
DAN
KIDCY
WINTERMOURN
SHIYO KAKUGE
KAMEKAZE
TWO4TEEZEE
SUPER
THEFCLASS97
RODKNEE
ROS
YAMORI X
JADE MIDORI
PLASMOIDTHUNDER
STRONG FS
CD2


CHARACTERS DESIGN

ELECBYTE TEAM
A.K.A. TOASTED MILQUE
ARMIN_IUF
DIVINEWOLF
DONALDEUS
MASUKENPU-KUN
PHANTOM.OF.THE.SERVER
PROUD OF RAGEQUITTIN
S.Y.D
SENNOU-ROOM
SILVAN
STUPA
TARUSE
THE_NONE
YOSHIN222



STAGES DESIGN

ELECBYTE TEAM
AIROLG1990
APPLEST0RE
HEKUTTASAINT
JUANI GALAXY 2002
NEXT ONE
PHANTOM.OF.THE.SERVER
RIVIERA
SHIYO KAKUGE
THE PIERROT



GRAPHICS DESIGN

ELECBYTE TEAM
BALTHAZAR
CIRIO
ESAKA
FIRE WOLF
FIZZY
KOOROGI
OGGY
RAKAVOLVER
TARUSE
TONINHO-3RD
XWAGNERPLAGUESX
ZION


SOUNDS COMPOSER

AFRIM KOSOVRASTI
AKIO JINSENJI
AYAKO SASO
CAPCOM SOUND TEAM
DAISUKE ISHIWATARI
DING
GAROAD
HIDEYUKI FUKASAWA
IPPO YAMADA
J00LZ
JEFF WILLIAMS
JOSH KELLER
KARTSY HATAKKA
KEIKI KOBAYASHI
KENJI KAWAI
KIMMO KAJASTO
LEILANI WILSON
MAKOTO ASAI
NATHAN MCCREE
NOMOREHEROES2012
NORICHIKA SATO
MICHIRU YAMANE
PERTTU KIVILAAKSO
PETER CONNELLY
RAITO
SAITAMA SAISYU HEIKI
SAMPLEPACK - IMPACT SFX
SHINJI HOSOE
SHINSEKAI GAKKYOKU ZATSUGIDAN
SHIRO HAMAGUCHI
SILENT DREAMS
TANAKA KOUHEI
TERUO KONISHI
TETSUYA SHIBATA
TORU ITOGA
TOSHIHIKO HORIYAMA
WIZZYWHIPITWONDERFUL
XONTRON
YASUFUMI FUKUDA



STORY DIRECTOR

ELECBYTE TEAM
CD2



OPENING AND STORY PROLOGUE PRODUCER

SWEET CREATURES



THE LOST CHAPTER AUTHOR

MOST MYSTERIOUS



SPECIAL THANKS

FAMILY
STRONG FS
PLASMOIDTHUNDER
ACDGAMES
ABRAHAMXDA
RAYZENINFERNO
SWEET CREATURES
OLDGAMER
LASOMBRA DEMON
LIAM KUROSHI
LEVEN2IS2LIJDEN
BRUCELEE-WT7HK
ERU GURARA
HERMES
MORIA MORTIMORTE
PIZZADARIUS25
2DEE4EVER
ALEX TV G.T.M
UCHIHASLAYER8893
DJ DELORIE
SHAWN HARGREAVES
TOMISLAV UZELAC AND OVE KAAVEN
GUAN FOO WAH
PETER WANG AND BRENNAN UNDERWOOD
EARLE F. PHILHOWER III
DAVID CORNISH
THE ENHANCED SPECIAL TESTING PEOPLE


AND YOU





PRESENTED BY

CABLE DORADO 2
CD2

 ]]

--;===========================================================
--; INITIALIZE LOOPS
--;===========================================================
f_mainStart() --Start Menu

--[[
function f_mainStartA()
	while true do
		drawBottomMenuSP()
		drawMiddleMenuSP()
		cmdInput()
		refresh()
	end
end

f_mainStartA() --Start Menu
]]