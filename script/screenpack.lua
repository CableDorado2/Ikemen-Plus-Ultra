--;===========================================================
--; SCREENPACK ASSETS DEFINITION
--;===========================================================
--Paths Data
licensesPath = "docs/Licenses" --Licenses Path (Please always distribute license files for use this program)
replaysPath = "save/replays" --Replays Path
screenshotPath = "screenshots"
--screenshotPath = getScreenshotsPath() --to use config.ssz ScreenshotFolder path
musicPath = "sound" --Main Soundtrack Path
luaModulesPath = { --Lua External Modules Folder Paths
"script/mods",
"data/lua"
}

--Sprite Data
sprFade = sffNew("data/fade.sff") --load fade sprites
sprSys = sffNew("data/system.sff") --load screenpack/menu MUGEN sprites
sprIkemen = sffNew("data/ikemen.sff") --load screenpack/menu IKEMEN sprites
sprGlyphs = sffNew("data/glyphs.sff") --load movelist sprites
--[[Load input hints sprites data
group is organized based on controller type (0=Keyboard, 1=XBOX Gamepad, 2=PS3 Gamepad)
index is organized based on controller key/button id returned by SDL functions [getInputKeyboard(), getInputID()]
]]
sprInputHints = sffNew("data/inputhints.sff")
keyboardInputHintsScaleX = 0.7
keyboardInputHintsScaleY = 0.7
--
gamepadInputHintsScaleX = 0.7
gamepadInputHintsScaleY = 0.7

--Sound Data (Sound effects [SFX] do not interrupt music/bgm)
sndSys = sndNew("data/system.snd")
sndIkemen = sndNew("data/ikemen.snd")
sndTower = sndNew("data/tower.snd")
sndAnncr = sndNew("data/charSnd/announcer.snd")

--Music Data (ONLY MP3 and OGG formats are Supported)
bgmNothing = " .mp3"
bgmIntro = "sound/system/Opening.mp3"
bgmIntroJP = "sound/system/Opening Lyrics.mp3"
bgmTitle = "sound/system/Title.mp3"
bgmSelectBoss = "sound/system/Select Boss.mp3"
bgmSelectOrder = "sound/system/Order Select.mp3"
bgmSelectOrderFinal = "sound/system/Order Select Final.mp3"
bgmNextStage = "sound/system/Next Stage.mp3"
bgmIntermission = "sound/system/Intermission.mp3"
bgmVS = "sound/system/VS.mp3"
bgmVSFinal = "sound/system/VS Final.mp3"
bgmVSSpecial = "sound/system/VS Special.mp3"
bgmVictory = "sound/system/Results.mp3"
bgmResults = "sound/system/Results.mp3"
bgmService = "sound/system/Service.mp3"
bgmContinue = "sound/system/Continue.mp3"
bgmGameOver = "sound/system/Game Over.mp3"
bgmCredits = "sound/system/credits.mp3"
bgmTower = "sound/system/Tower.mp3"
bgmTourney = "sound/system/Tourney.mp3"
bgmTourneyChampion = "sound/system/Champion.mp3"
bgmAbyss = "sound/system/Abyss.mp3"

--Font Data (At the moments only FNT Format is Supported)
fontDebug = "font/14x14.fnt"
padFnt = fontNew("font/f-pad.fnt")
survNumFnt = fontNew("font/survival_nums.fnt")
jgFnt = fontNew("font/jg.fnt")
opFnt = fontNew("font/Options.fnt")
font1 = fontNew("font/f-4x6.fnt")
font2 = fontNew("font/f-6x9.fnt")
font3 = fontNew("font/14x14.fnt")
font4 = fontNew("font/18x18.fnt")
font7 = fontNew("font/f-6x8f.fnt")
font8 = fontNew("font/f-6x9f.fnt")
font15 = fontNew("font/name1.fnt")
font16 = fontNew("font/num1.fnt")
--Extra Fonts
fontMK = fontNew("font/extra/KombatZone.fnt")
fontMK2 = fontNew("font/extra/mk3-name-wins.fnt")
fontsfa2 = fontNew("font/extra/sfa2_font.fnt")
font5 = fontNew("font/extra/Qoh_small.fnt")
font6 = fontNew("font/extra/QOH_BIG.fnt")
font9 = fontNew("font/extra/font3.fnt")
font10 = fontNew("font/extra/font4.fnt")
font11 = fontNew("font/extra/font5.fnt")
font12 = fontNew("font/extra/kof2002um_score.fnt")
font13 = fontNew("font/extra/kof99.fnt")
font14 = fontNew("font/extra/mvc_name.fnt")
font17 = fontNew("font/extra/sf2_name.fnt")
font18 = fontNew("font/extra/sf2_small.fnt")
font19 = fontNew("font/extra/sf2_sys.fnt")
font20 = fontNew("font/extra/sfz2a_system.fnt")
font21 = fontNew("font/extra/ssf2x_10.fnt")
font22 = fontNew("font/extra/ssf2x_s.fnt")
font23 = fontNew("font/extra/ssf2x_sL.fnt")
font24 = fontNew("font/extra/ssf2x_vL.fnt")
font30 = fontNew("font/extra/F-.fnt")

--Storyboard Data (Optional)
storyboardLogo = "storyboards/logo.def"
storyboardIntro = "storyboards/intro.def"
storyboardGameOver = "storyboards/gameover.def"

--Video Data (Recommended for large cutscenes instead storyboards)
videoHowToPlay = "videos/How To Play.webm"

--Definition Data
selectDef = "data/select.def" --Characters and Stage selection list
fightDef = data.lifebar --Lifebar/Fight stored in data_sav.lua

--;===========================================================
--; MOVELIST SCREENPACK DEFINITION
--;===========================================================
t_glyphs = { --glyphs spr data
	['^A'] = {1, 0}, --A
	['^B'] = {2, 0}, --B
	['^C'] = {3, 0}, --C
	['^D'] = {4, 0}, --D
	['^W'] = {23, 0}, --W
	['^X'] = {24, 0}, --X
	['^Y'] = {25, 0}, --Y
	['^Z'] = {26, 0}, --Z
	['^L'] = {27, 0}, --L
	['^R'] = {28, 0}, --R
	['_+'] = {39, 0}, --+ (press at the same time as previous button)
	['_.'] = {40, 0}, --...
	['_DB'] = {41, 0}, --Down-Back
	['_D'] = {42, 0}, --Down
	['_DF'] = {43, 0}, --Down-Forward
	['_B'] = {44, 0}, --Back
	['_F'] = {46, 0}, --Forward
	['_UB'] = {47, 0}, --Up-Back
	['_U'] = {48, 0}, --Up
	['_UF'] = {49, 0}, --Up-Forward
	['^S'] = {51, 0}, --Start
	['^M'] = {52, 0}, --Menu (Select/Back)
	['^P'] = {53, 0}, --Any Punch (X / Y / Z)
	['^K'] = {54, 0}, --Any Kick (A / B / C)
	['^LP'] = {57, 0}, --Light Punch (X)
	['^MP'] = {58, 0}, --Medium Punch (Y)
	['^HP'] = {59, 0}, --Heavy Punch (Z)
	['^LK'] = {60, 0}, --Light Kick (A)
	['^MK'] = {61, 0}, --Medium Kick (B)
	['^HK'] = {62, 0}, --Heavy Kick (C)
	['^3K'] = {63, 0}, --3 Kick (A+B+C)
	['^3P'] = {64, 0}, --3 Punch (X+Y+Z)
	['^2K'] = {65, 0}, --2 Kick (A+B / B+C / A+C)
	['^2P'] = {66, 0}, --2 Punch (X+Y / Y+Z / X+Z)
	['_-'] = {90, 0}, --Arrow (tap following Button immediately - use in combos)
	['_!'] = {91, 0}, --Continue Arrow (follow with this move)
	['~DB'] = {92, 0}, --hold Down-Back
	['~D'] = {93, 0}, --hold Down
	['~DF'] = {94, 0}, --hold Down-Forward
	['~B'] = {95, 0}, --hold Back
	['~F'] = {96, 0}, --hold Forward
	['~UB'] = {97, 0}, --hold Up-Back
	['~U'] = {98, 0}, --hold Up
	['~UF'] = {99, 0}, --hold Up-Forward
	['_HCB'] = {100, 0}, --1/2 Circle Back
	['_HUF'] = {101, 0}, --1/2 Circle Forward Up
	['_HCF'] = {102, 0}, --1/2 Circle Forward
	['_HUB'] = {103, 0}, --1/2 Circle Back Up
	['_QFD'] = {104, 0}, --1/4 Circle Forward Down
	['_QDB'] = {105, 0}, --1/4 Circle Down Back (QCB/QDB)
	['_QCB'] = {105, 0}, --1/4 Circle Down Back (QCB/QDB)
	['_QBU'] = {106, 0}, --1/4 Circle Back Up
	['_QUF'] = {107, 0}, --1/4 Circle Up Forward
	['_QBD'] = {108, 0}, --1/4 Circle Back Down
	['_QDF'] = {109, 0}, --1/4 Circle Down Forward (QCF/QDF)
	['_QCF'] = {109, 0}, --1/4 Circle Down Forward (QCF/QDF)
	['_QFU'] = {110, 0}, --1/4 Circle Forward Up
	['_QUB'] = {111, 0}, --1/4 Circle Up Back
	['_FDF'] = {112, 0}, --Full Clock Forward
	['_FUB'] = {113, 0}, --Full Clock Back
	['_FUF'] = {114, 0}, --Full Count Forward
	['_FDB'] = {115, 0}, --Full Count Back
	['_XFF'] = {116, 0}, --2x Forward
	['_XBB'] = {117, 0}, --2x Back
	['_DSF'] = {118, 0}, --Dragon Screw Forward
	['_DSB'] = {119, 0}, --Dragon Screw Back
	['_AIR'] = {121, 0}, --AIR
	['_TAP'] = {122, 0}, --TAP
	['_MAX'] = {123, 0}, --MAX
	['_EX'] = {124, 0}, --EX
	['_^'] = {127, 0}, --Air
	['_='] = {128, 0}, --Squatting
	['_)'] = {129, 0}, --Close
	['_('] = {130, 0}, --Away
	['_`'] = {135, 0}, --Small Dot
}
if data.debugLog then f_printTable(t_glyphs, "save/debug/t_glyphs.log") end

--;===========================================================
--; DRAW SPRITES REFERENCES
--;===========================================================
---
-- animName = animNew(sprSys, [[ 
-- grpNo,indexNo, x,y, time, facing, trans
-- ]])

--[[
Description: Assigns new animation to animName variable of your choice.

Required parameters:
grpNo: SFF sprite's group number
indexNo: SFF sprite's image number
x: X offset to the sprite's position
y: Y offset to the sprite's position
time: length of time to display the element before moving onto the next, measured in game-ticks (-1 for static)

Optional parameters:
facing: H = Flip horizontally; V = Flip vertically
trans: transparency blending a = add; a1 = add1; s = sub; AS???D??? (??? - values of the source and destination alpha)
]]

--[[
animAddPos(animName, addX, addY)
Description: Dynamically assigns x- and y- element velocities movement in direction depending on the value.

animSetPos(animName, setX, setY)
Description: Changes x- and y- element position.

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
--; DRAW TEXT REFERENCES
--;===========================================================

--- textName = createTextImg(fontName, bankNo, alignNo, textData, x, y, xcale, yscale)
--[[
Description: Assigns new text to textName variable of your choice.

Required parameters:
fontName: font name
bankNo: number
alignNo: number
textData = text info that will be drawed
x: X offset to the text position
y: Y offset to the text position

Optional parameters:
xcale: X scale to the text
ycale: Y scale to the text
trans: transparency blending a = add; a1 = add1; s = sub; AS???D??? (??? - values of the source and destination alpha)
]]

--[[
textImgSetFont(textName, fontName)
Description: Assigns font to text.

textImgSetBank(textName, bankNo)
Description: Assigns bank to text.

textImgSetAlign(textName, alignNo)
Description: Assigns alignment to text. (1= Align text to Left; 0= Align text to Center; -1= Align text to Right)

textImgSetText(textName, text)
Description: Assigns text string to show.

textImgSetPos(textName, setX, setY)
Description: Assigns x- and y- position to text.

textImgSetScale(textName, scaleX, scaleY)
Description: scaleX: horizontal scale factor; scaleY: vertical scale factor.

textImgSetAlpha(textName, transRange1, transRange2)
Description: Assigns alpha channel to text. Ranges: 0-255.

textImgDraw(textName)
Description: Draw text on screen.
]]

--;===========================================================
--; LOADING GAME SCREENPACK DEFINITION
--;===========================================================
--Loading Text
txt_loading = createTextImg(font1, 0, -1, "", 310, 230)

--;===========================================================
--; TITLE SCREEN SCREENPACK DEFINITION
--;===========================================================
txt_mainTitle = createTextImg(jgFnt, 5, 0, "PRESS START", 159, 170) --Cool fonts: 3, 5, 6, 9, 10, 11, 12, 20, 21
--txt_version = createTextImg(font1, 0, -1, "v1.?.0", 319, 240)
txt_version = createTextImg(font1, 0, -1, "Dev. Build", 319, 240)
txt_f1 = createTextImg(font1, 0, 0, "Press F1 for Info", 159, 240)
txt_titleFt = createTextImg(font5, 0, 0, "", 156, 240)
txt_titleClock = createTextImg(font12, 0, -1, "", 0, 0)
txt_titleDate = createTextImg(font12, 0, 1, "", 0, 0)
txt_subTitle = createTextImg(font3, 0, 0, "", 159, 100) --PLUS ULTRA Sub-Title Text

--Buttons Background
titleBG0 = animNew(sprSys, [[
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
titleBG1 = animNew(sprSys, [[
5,2, -160,125, -1, 0, s
]])
animAddPos(titleBG1, 160, 0)
animUpdate(titleBG1)

--Background Top
titleBG2 = animNew(sprSys, [[
5,0, 0,10, -1
]])
animAddPos(titleBG2, 160, 0)
animSetTile(titleBG2, 1, 2)
animSetWindow(titleBG2, -54, 0, 428, 118)

--Logo
titleBG3 = animNew(sprSys, [[
0,0, 0,20, -1, 0, a
]])
animAddPos(titleBG3, 160, 0)
animUpdate(titleBG3)

--Background Middle (black text cover)
titleBG4 = animNew(sprSys, [[
5,1, 0,125, -1
]])
animAddPos(titleBG4, 160, 0)
animSetTile(titleBG4, 1, 1)
animSetWindow(titleBG4, 0, 118, 320, 7)
animSetAlpha(titleBG4, 0, 0)
animUpdate(titleBG4)

--Background Bottom (black text cover)
titleBG5 = animNew(sprSys, [[
5,1, 0,125, -1
]])
animAddPos(titleBG5, 160, 0)
animSetTile(titleBG5, 1, 1)
animSetWindow(titleBG5, 0, 203, 320, 40)
animSetAlpha(titleBG5, 0, 0)
animUpdate(titleBG5)

--Background Footer
titleBG6 = animNew(sprIkemen, [[
4,0, 0,233, -1
]])
animAddPos(titleBG6, 160, 0)
animSetTile(titleBG6, 1, 0)
animUpdate(titleBG6)

--;===========================================================
--; COMMON SCREENPACK DEFINITION
--;===========================================================
--Common Scrolling background
commonBG0 = animNew(sprSys, [[
100,0, 0,0, -1
]])
animAddPos(commonBG0, 160, 0)
animSetTile(commonBG0, 1, 1)
animSetColorKey(commonBG0, -1)

--Common Transparent background
commonTBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(commonTBG, 0, 20)
animSetAlpha(commonTBG, 20, 100)
animUpdate(commonTBG)

--Cursor Box
cursorBox = animNew(sprSys, [[
100,1, 0,0, -1
]])
animSetTile(cursorBox, 1, 1)

--Optimized Cursor Box
--cursorBox = animNew(sprIkemen, [[
--2,0, 0,0, -1
--]])
--animSetPos(cursorBox, 80, 20)
--animSetAlpha(cursorBox, 20, 100)
--animUpdate(cursorBox)

--Message Fade BG
fadeWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(fadeWindowBG, -54, 0)
animSetScale(fadeWindowBG, 427, 240)
animUpdate(fadeWindowBG)

--Common Input Hints BG
inputHintsBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(inputHintsBG, 2.9, 0.35)
animSetAlpha(inputHintsBG, 155, 22)

--Common Padlock Sprite
padlock = animNew(sprIkemen, [[
108,0, 0,0, -1
]])
animSetScale(padlock, 0.20, 0.20)
animUpdate(padlock)

--Common Menu Up Arrows
menuArrowUp = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animSetScale(menuArrowUp, 0.5, 0.5)

--Common Menu Down Arrows
menuArrowDown = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animSetScale(menuArrowDown, 0.5, 0.5)

function f_resetMenuArrowsPos() --Used in Main Menus
animSetPos(menuArrowUp, 153.5, 116)
animSetPos(menuArrowDown, 153.5, 204)
end

function f_resetListArrowsPos() --Used in many List Menus
animSetPos(menuArrowUp, 228, 11)
animSetPos(menuArrowDown, 228, 201.5)
end

--Common Menu Left Arrows
menuArrowLeft = animNew(sprIkemen, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animSetScale(menuArrowLeft, 0.5, 0.5)

--Common Menu Right Arrows
menuArrowRight = animNew(sprIkemen, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animSetScale(menuArrowRight, 0.5, 0.5)

function f_titleText()
	if stats.vault == "Ultra" then textImgSetText(txt_subTitle, "PLUS ULTRA")
	elseif stats.vault == "Zen" then textImgSetText(txt_subTitle, "PLUS ZEN")
	elseif stats.vault == "SSZ" then textImgSetText(txt_subTitle, "SSZ")
	end
	textImgDraw(txt_subTitle)
end

function drawBottomMenuSP() --Layer 0
	animDraw(f_animVelocity(titleBG0, -2.15, 0))
end

function drawMiddleMenuSP() --Layer 1 (After Cursor Box)
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

function drawTopMenuSP() --Layer 2 (Always In front)
	
end

function drawTitleInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	animPosDraw(inputHintsBG, -56, 212)
	drawMenuInputHints("s","100,"..inputHintYPos,"e","170,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
end

--;===========================================================
--; ATTRACT MENU SCREENPACK DEFINITION
--;===========================================================
txt_attractState = createTextImg(jgFnt, 0, 0, "", 159, 170)
txt_attractTimer = createTextImg(jgFnt, 0, 0, "", 159, 200)
txt_attractCredits = createTextImg(fontsfa2, 0, -1, "", 318, 230)
txt_attractCopyrightCfg = createTextImg(font14, 0, 0, "", 159, 220, 0.8, 0.8)

txt_attractState0 = "INSERT COIN"
txt_attractState1 = "PRESS 1P OR 2P START"
txt_attractState2 = "PRESS START" --After Start a Game to Challenger Join
txt_attractState3 = "GAME OVER" --When any side lose in Arcade
txt_attractStateChallenger = "CHALLENGER" --During Versus Mode
txt_attractFreePlay = "FREE PLAY"
txt_attractSelectTitle = "PLAYER SELECT"

txt_attractCopyright = [[
Itsu made mo Kansei shinai Eien ni Mikansei ENgine
@SUEHIRO., S-SIZE PROJECT 2006
]]

function f_attractCredits(x, y, align)
	local x = x or 318
	local y = y or 215
	local align = align or -1
	local s = ""
	local zero = ""
	if getCredits() > 1 then s = "s" else s = "" end
	if getCredits() > 9 then zero = "" else zero = "0" end
	textImgSetPos(txt_attractCredits, x, y)
	textImgSetAlign(txt_attractCredits, align)
	textImgSetText(txt_attractCredits, "CREDIT"..s.." "..zero..getCredits())
	textImgDraw(txt_attractCredits)
end

attractCnt = 0
function drawAttractStatus(state, x, y, align, scaleX, scaleY)
	local state = state or 1
	local x = x or 159
	local y = y or 170
	local align = align or 0
	local scaleX = scaleX or 1
	local scaleY = scaleY or 1
	textImgSetPos(txt_attractState, x, y)
	textImgSetScale(txt_attractState, scaleX, scaleY)
	textImgSetAlign(txt_attractState, align)
	if attractCnt % 60 < 30 then
	--Title Screen
		if state == 1 then
			if getCredits() > 0 then
				textImgSetBank(txt_attractState, 5)
				textImgSetText(txt_attractState, txt_attractState1)
			else
				textImgSetBank(txt_attractState, 0)
				textImgSetText(txt_attractState, txt_attractState0)
			end
	--Character Select and Next
		elseif state == 2 then
			if getCredits() > 0 then
				textImgSetBank(txt_attractState, 5)
				textImgSetText(txt_attractState, txt_attractState2)
			else
				textImgSetBank(txt_attractState, 0)
				textImgSetText(txt_attractState, txt_attractState0)
			end
		end
		textImgDraw(txt_attractState)
	end
	attractCnt = attractCnt >= 60 and 0 or attractCnt + 1
end

--;===========================================================
--; F1 INFOBOX MESSAGE SCREENPACK DEFINITION
--;===========================================================
infoboxCfg = createTextImg(font1, 0, 1, "", 0, 0)
txt_infobox = [[















This is an unofficial version of S-SIZE I.K.E.M.E.N. Engine maintained by CD2.

* This is a public development release, for testing purposes.
* This build may contain bugs and incomplete features.
* Your help and cooperation are appreciated!
* Ikemen GO engine is the lastest and supported version by original developers.
* Original repo source code: https://osdn.net/users/supersuehiro/
]]

--;===========================================================
--; INFORMATION MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_infoTitle = createTextImg(font5, 0, 0, "INFORMATION", 157, 86)
txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0, 0.7, 0.7)

--Info Window BG
infoWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(infoWindowBG, 39, 80)
animSetScale(infoWindowBG, 1.6, 1.3)
animUpdate(infoWindowBG)

function drawInfoInputHints()
	local inputHintYPos = 134
	local hintFont = font2
	local hintFontYPos = 148
--Draw Cursor
	animSetWindow(cursorBox, 43.9,134, 232,20)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Inputs
	drawMenuInputHints("s","137,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Ok", 158, hintFontYPos)
end

--;===========================================================
--; CONFIRM MENU SCREENPACK DEFINITION
--;===========================================================
txt_confirmTitle = createTextImg(jgFnt, 1, 0, "", 160, 110)
txt_abyssDatConfirmTitle = createTextImg(jgFnt, 0, 0, "", 161.5, 112)

t_confirmMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

txt_confirmQuestion = "ARE YOU SURE?"
txt_exitQuestion = "CLOSE ENGINE?"
txt_restartQuestion = "RESTART ENGINE?"

txt_tourneyConfirmExit = [[
Return to Tournament Rules Menu
Tournament will End
]]

txt_abyssConfirmShopBack = [[
Return to Main Menu
Items purchased at the Shop will reset
and Currency spended will be returned
]]

txt_abyssConfirmCheckpoint = [[
Reward acquired will be converted to IKC
Items discovered will be added to the Shop
Would you like to Stop Exploring this Abyss?
]]

--Confirm Window BG
confirmWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(confirmWindowBG, 39, 80)
animSetScale(confirmWindowBG, 1.6, 1.3)
animUpdate(confirmWindowBG)

--Abyss Confirm Window BG
abyssConfirmWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(abyssConfirmWindowBG, 62, 97)
animSetScale(abyssConfirmWindowBG, 1.3, 1)
animUpdate(abyssConfirmWindowBG)

--Input Hints Panel
function drawConfirmInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;===========================================================
--; MAIN MENU SCREENPACK DEFINITION
--;===========================================================
txt_gameFt = createTextImg(font5, 0, 1, "", 2, 240) --Text to identify the game mode in menus
MainFadeInTime = 30

t_mainMenu = {
	{text = "ARCADE", 		gotomenu = "f_arcadeMenu()"}, --Each function loaded by "gotomenu", need to be declared in main.lua
	{text = "VERSUS", 		gotomenu = "f_vsMenu()"},
	{text = "NETPLAY", 		gotomenu = "f_mainNetplay()"},
	{text = "PRACTICE", 	gotomenu = "f_practiceMenu()"},
	{text = "CHALLENGES", 	gotomenu = "f_challengeMenu()"},
	{text = "EXTRAS", 		gotomenu = "f_extrasMenu()"},
	{text = "WATCH", 		gotomenu = "f_watchMenu()"},
	{text = "OPTIONS", 		gotomenu = "f_optionsMenu()"},
	{text = "EXIT", 		gotomenu = "f_exitMenu()"},
}
--Set ID to all final items
for i=1, #t_mainMenu do
	t_mainMenu[i]['id'] = textImgNew()
end

function drawMainMenuInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	animPosDraw(inputHintsBG, -56, 212)
	drawMenuInputHints("u","20,"..inputHintYPos,"d","40,"..inputHintYPos,"s","100,"..inputHintYPos,"e","165,"..inputHintYPos,"q","227,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 61, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 186, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":???", 248, hintFontYPos)
end

function drawListInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;===========================================================
--; ARCADE MENU SCREENPACK DEFINITION
--;===========================================================
t_arcadeMenu = {
	{text = "CLASSIC",	  gotomenu = "f_arcadeBoot()"},
	{text = "TOWER", 	  gotomenu = "f_towerBoot()"},
}
for i=1, #t_arcadeMenu do
	t_arcadeMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; VERSUS MENU SCREENPACK DEFINITION
--;===========================================================
t_vsMenu = {
	{text = "QUICK MATCH",  gotomenu = "f_quickvsBoot()"},
	{text = "FREE BATTLE",  gotomenu = "f_vsBoot()"},
	{text = "BOSS ASSAULT", gotomenu = "f_bossChars()"},
}
for i=1, #t_vsMenu do
	t_vsMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; PRACTICE MENU SCREENPACK DEFINITION
--;===========================================================
t_practiceMenu = {
	{text = "TRAINING", gotomenu = "f_training()"},
	{text = "TRIALS", 	gotomenu = "f_comingSoon()"},
}
for i=1, #t_practiceMenu do
	t_practiceMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; CHALLENGES MENU SCREENPACK DEFINITION
--;===========================================================
t_challengeMenu = {
	{text = "SURVIVAL", 	gotomenu = "f_survivalMenu()"},
	{text = "TIME ATTACK", 	gotomenu = "f_timeattackBoot()"}, --"f_timeattackMenu()"},
	{text = "SCORE ATTACK", gotomenu = "f_scoreattackBoot()"}, --"f_scoreattackMenu()"},
}
for i=1, #t_challengeMenu do
	t_challengeMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; SURVIVAL MENU SCREENPACK DEFINITION
--;===========================================================
t_survivalMenu = {
	{text = "CLASSIC", 	 	gotomenu = "f_survivalBoot()"},
	{text = "ABYSS", 	 	gotomenu = "f_abyssSelect()"},
	{text = "BOSS RUSH", 	gotomenu = "f_bossrushBoot()"},
	{text = "SUDDEN DEATH", gotomenu = "f_suddendeathBoot()"},
}
for i=1, #t_survivalMenu do
	t_survivalMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; TIME ATTACK MENU SCREENPACK DEFINITION
--;===========================================================
t_timeattackMenu = {
	{text = "CLASSIC", 		gotomenu = "f_timeattackBoot()"},
	{text = "SPEED STAR", 	gotomenu = "f_speedstarBoot()"},
	{text = "???", 			gotomenu = "f_comingSoon()"},
}
for i=1, #t_timeattackMenu do
	t_timeattackMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; SCORE ATTACK MENU SCREENPACK DEFINITION
--;===========================================================
t_scoreattackMenu = {
	{text = "CLASSIC", 	gotomenu = "f_scoreattackBoot()"},
	{text = "???", 		gotomenu = "f_comingSoon()"},
}
for i=1, #t_scoreattackMenu do
	t_scoreattackMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; EXTRAS MENU SCREENPACK DEFINITION
--;===========================================================
t_extrasMenu = {
	--{text = "BEAT EM UP", gotomenu = "f_comingSoon()"},
	--{text = "PLATFORM", gotomenu = "f_comingSoon()"},
	{text = "BONUS GAMES", 	gotomenu = "f_bonusMenu()"},
	{text = "TOURNAMENT", 	gotomenu = "f_tourneyCfg()"},
	{text = "ENDLESS", 		gotomenu = "f_endlessBoot()"},
	{text = "VS X KUMITE", 	gotomenu = "f_kumiteBoot()"},
}
for i=1, #t_extrasMenu do
	t_extrasMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; BONUS GAMES MENU SCREENPACK DEFINITION
--;===========================================================
t_bonusMenu = {
	{text = "GAME SELECT",  gotomenu = "f_bonusExtras()"},
	{text = "MARATHON",		gotomenu = "f_bonusrushBoot()"},
}
for i=1, #t_bonusMenu do
	t_bonusMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; WATCH MENU SCREENPACK DEFINITION
--;===========================================================
t_watchMenu = {
	{text = "REPLAYS", 		 gotomenu = "f_replayMenu()"},
	{text = "STAGE VIEWER",  gotomenu = "f_stageViewer()"},
	{text = "SOUND TEST", 	 gotomenu = "soundTest = true f_songMenu()"},
	{text = "PROFILE", 		 gotomenu = "f_profileMenu()"},
	{text = "LICENSES", 	 gotomenu = "f_licenseMenu()"},
	{text = "STAFF CREDITS", gotomenu = "f_playCredits()"},
}
for i=1, #t_watchMenu do
	t_watchMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; PROFILE MENU SCREENPACK DEFINITION
--;===========================================================
t_profileMenu = {
	{text = "RECORDS", 		gotomenu = "f_statsMenu()"},
	{text = "LEADERBOARDS", gotomenu = "f_rankings()"},
}
for i=1, #t_profileMenu do
	t_profileMenu[i]['id'] = textImgNew()
end

--;===========================================================
--; REPLAY MENU SCREENPACK DEFINITION
--;===========================================================
t_replayMenu = {
	{id = textImgNew(), text = "ONLINE REPLAYS"},
	{id = textImgNew(), text = "LOCAL REPLAYS"},
}

--;===========================================================
--; ONLINE REPLAYS MENU SCREENPACK DEFINITION
--;===========================================================
txt_replay = createTextImg(jgFnt, 0, 0, "REPLAY SELECT", 159, 13)
txt_replayData = createTextImg(jgFnt, 0, 0, "REPLAY OPTIONS", 159, 72)
txt_replayName = createTextImg(font2, 0, 0, "", 159.5, 16)
txt_replaySize = createTextImg(font2, 0, 0, "", 159.5, 27)

t_replayOption = {
	{id = '', text = "DELETE"}, {id = '', text = "WATCH"}, {id = '', text = "RETURN"},
}
for i=1, #t_replayOption do
	t_replayOption[i].id = createTextImg(jgFnt, 0, 0, t_replayOption[i].text, -80 + i * 120, 172)
end

--Replay Title Transparent background
replayMenuBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(replayMenuBG, 0, 5)
animSetAlpha(replayMenuBG, 20, 100)
animUpdate(replayMenuBG)

--Replay Option background
replayMenuBG2 = animNew(sprIkemen, [[
250,0, 0,0, -1
]])
animSetPos(replayMenuBG2, -13, 77)
animSetScale(replayMenuBG2, 0.9, 0.9)
animUpdate(replayMenuBG2)

--Replay Option Input Hints Panel
function drawReplayInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;===========================================================
--; PLAYER RECORDS SCREENPACK DEFINITION
--;===========================================================
txt_statsMenu = createTextImg(jgFnt, 0, -1, "", 202, 13)
txt_statsProgress = createTextImg(jgFnt, 2, 1, "", 208, 13)

t_statsMenu = {
	{text = "Play Time"},
	{text = "Training Time"},
	{text = "In-Game Currency"},
	{text = "Matchs Played"},
	{text = "Wins"},
	{text = "Loses"},
	{text = "Favorite Character"},
	{text = "Favorite Stage"},
	{text = "Favorite Game Mode"},
	{text = "BACK"},
}
for i=1, #t_statsMenu do
	t_statsMenu[i]['varID'] = textImgNew()
	t_statsMenu[i]['varText'] = ""
end

--;===========================================================
--; LEADERBOARDS SCREENPACK DEFINITION
--;===========================================================
txt_rankingMenu = createTextImg(jgFnt, 0, -1, "LEADERBOARDS", 202, 13)

--;===========================================================
--; SOUND TEST MENU SCREENPACK DEFINITION
--;===========================================================
txt_song = createTextImg(jgFnt, 0, 0, "", 159, 13)

--Menu Arrows
function f_resetSoundTestArrowsPos()
animSetPos(menuArrowLeft, 69, 21)
animSetPos(menuArrowRight, 242, 21)
end

--Input Hints Panel
function drawSoundTestInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints(
		"u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,
		"s","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Play", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Mute", 266, hintFontYPos)
end

--;===========================================================
--; CONFIRM SONG MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_confirmSong = createTextImg(jgFnt, 0, 0, "USE THIS SONG?", 160, 108, 0.63, 0.63)

--Confirm Window BG
confirmSongWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(confirmSongWindowBG, 83.5, 97)
animSetScale(confirmSongWindowBG, 1, 1)
animUpdate(confirmSongWindowBG)

t_confirmSongMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

--;===========================================================
--; LICENSES MENU SCREENPACK DEFINITION
--;===========================================================
txt_licenseTitle = createTextImg(jgFnt, 0, 0, "", 159, 13)
txt_license = createTextImg(font2, 0, 1, "", 0, 0)

--Background
licenseBG = animNew(sprIkemen, [[
0,0, 0,0, -1
]])
animAddPos(licenseBG, 160, 0)
animSetTile(licenseBG, 1, 1)
animSetColorKey(licenseBG, -1)
animSetAlpha(licenseBG, 150, 0)

--Title BG
licenseTitleBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(licenseTitleBG, 2.9, 0.30)
animSetAlpha(licenseTitleBG, 155, 22)

--Input Hints Panel
function drawLicenseInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("l","45,"..inputHintYPos,"r","65,"..inputHintYPos,"u","127,"..inputHintYPos,"d","147,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 86, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Scroll", 169, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;===========================================================
--; ONLINE MENU SCREENPACK DEFINITION
--;===========================================================
t_mainNetplay = {
	{id = textImgNew(), text = "HOST [CREATE ROOM]"},
	{id = textImgNew(), text = "CLIENT [JOIN A ROOM]"},
}

--;===========================================================
--; ONLINE HOST ROOM SCREENPACK DEFINITION
--;===========================================================
txt_hostTitle = createTextImg(jgFnt, 5, 0, "ONLINE ROOM CREATED", 159, 13)
txt_netPort = createTextImg(jgFnt, 0, 0, "", 159, 72, 0.9, 0.9)
txt_hosting = createTextImg(jgFnt, 0, 0, "", 159, 228)
txt_cancel = createTextImg(jgFnt, 1, 0, "CANCEL(ESC)", 161, 165)
txt_noInternet = "UNABLE TO CONNECT TO SERVER"
txt_connectingNet = "CONNECTING TO SERVER..."

--IP Window BG
textWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(textWindowBG, 83.5, 97)
animSetScale(textWindowBG, 1, 1)
animUpdate(textWindowBG)

--Connecting Window BG
joinWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(joinWindowBG, 83.5, 54)
animSetScale(joinWindowBG, 1, 2)
animUpdate(joinWindowBG)

--Connecting Icon
wirelessBG = animNew(sprIkemen, [[
400,0, 0,0, 18
400,1, 0,0, 18
400,2, 0,0, 18
400,3, 0,0, 18
400,4, 0,0, 18
400,5, 0,0, 18
400,6, 0,0, 18
]])
animAddPos(wirelessBG, 125, 87.5)
animSetScale(wirelessBG, 0.25, 0.25)
animUpdate(wirelessBG)

--;===========================================================
--; ONLINE DIRECT JOIN CLIENT MENU SCREENPACK DEFINITION
--;===========================================================
txt_clientTitle = createTextImg(jgFnt, 0, 0, "", 159, 13)
txt_client = createTextImg(jgFnt, 0, 0, "Enter Host\'s IPv4", 159, 111)
txt_clientName = createTextImg(jgFnt, 0, 0, "Enter Host\'s Nickname", 159, 110, 0.9, 0.9)
txt_bar = createTextImg(opFnt, 0, 0, "|", 160, 133, 0.65, 0.65)
txt_ip = createTextImg(font14, 0, 0, "", 160, 132)
txt_connecting = createTextImg(jgFnt, 5, 0, "", 159, 228)

t_directJoinMenu = {
	{id = textImgNew(), text = "BACK"}, {id = textImgNew(), text = "JOIN"},
}
for i=1, #t_directJoinMenu do
	t_directJoinMenu[i].id = createTextImg(jgFnt, 0, 0, t_directJoinMenu[i].text, 12 + i * 95, 151)
end

--;===========================================================
--; ONLINE DATABASE JOIN CLIENT MENU SCREENPACK DEFINITION
--;===========================================================
txt_crudTitle = createTextImg(font6, 0, 0, "", 160, 147.5)

t_crudHostOptionU = {{id = '', text = "DELETE"},{id = '', text = "JOIN"},}
t_crudHostOptionD = {{id = '', text = "EDIT"}, {id = '', text = "RETURN"},}

t_editOption = {
	{id = textImgNew(), text = " CANCEL"}, {id = textImgNew(), text = "  ENTER"},
}
for i=1, #t_editOption do
	t_editOption[i].id = createTextImg(jgFnt, 0, 0, t_editOption[i].text, 12 + i * 95, 151)
end

--CRUD Window BG
crudHostWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(crudHostWindowBG, 60.5, 125)
animSetScale(crudHostWindowBG, 1.3, 1.3)
animUpdate(crudHostWindowBG)

function drawCrudHostInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	animPosDraw(inputHintsBG, -56, 212)
	drawMenuInputHints("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","120,"..inputHintYPos,"e","185,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
end

--;===========================================================
--; ONLINE LOBBY MENU SCREENPACK DEFINITION
--;===========================================================
t_mainLobby = {
	{text = ""},
	{text = "PRACTICE"},
	{text = "ARCADE"},
	{text = "TOWER"},
	{text = "SURVIVAL"},
	{text = "ENDLESS"},
	{text = "BOSS RUSH"},
	{text = "BONUS RUSH"},
--[[
	{text = "TIME RUSH"},
	{text = "SCORE RUSH"},
]]
	{text = "SPEED STAR"},
	{text = "TIME ATTACK"},
	{text = "SCORE ATTACK"},
	{text = ""}, --VS X KUMITE
	{text = "SUDDEN DEATH"},
	{text = "ONLINE SETTINGS"},
}
for i=1, #t_mainLobby do
	t_mainLobby[i]['id'] = textImgNew()
end

--;===========================================================
--; SIDE SELECT SCREENPACK DEFINITION
--;===========================================================
txt_sideTitle = createTextImg(font14, 0, 0, "SIDE SELECT", 157, 8, 0.9, 0.9)
txt_sideWarning = createTextImg(font6, 0, 0, "THE SIDE SELECTED IS NOT ALLOWED FOR THIS GAME MODE", 157, 70, 0.75, 0.75)

--Gamepad Icon
gamepadIcon = animNew(sprIkemen, [[
15,0, 0,0, -1
]])

--Lifebars Image
lifebarsImg = animNew(sprIkemen, [[
16,0, 0,0, -1
]])

--Left Arrows
sideSelArrowLeft = animNew(sprIkemen, [[
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
sideSelArrowRight = animNew(sprIkemen, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])

--Input Hints Panel
function drawSideInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	animPosDraw(inputHintsBG, -56, 212)
	drawMenuInputHints("l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;===========================================================
--; HERE COMES A NEW CHALLENGER SCREENPACK DEFINITION
--;===========================================================
--Challenger Transparent BG
challengerWindow = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(challengerWindow, 160, 0)
animSetTile(challengerWindow, 1, 1)
animSetWindow(challengerWindow, -54, 67, 428, 100)

--Challenger Text
challengerText = animNew(sprIkemen, [[
500,0, 0,0, 5
500,1, 0,0, 5
500,2, 0,0, 5
500,3, 0,0, 5
500,4, 0,0, 5
500,5, 0,0, 5
500,6, 0,0, 5
500,7, 0,0, 5
500,8, 0,0, 5
500,9, 0,0, 5
]])
animAddPos(challengerText, 19, 100)
animUpdate(challengerText)

--;===========================================================
--; INTERMISSION SCREENPACK DEFINITION
--;===========================================================
txt_interWarning = "WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!"
txt_warningInterU = createTextImg(font6, 0, 1, txt_interWarning, 0, 42)
txt_warningInterD = createTextImg(font6, 0, -1, txt_interWarning, 320, 205)

txt_intermissionBox = [[

CHALLENGER 
APPROACHING!

]]

--Intermission Scrolling background
intermissionBG0 = animNew(sprIkemen, [[
0,0, 0,0, -1
]])
animAddPos(intermissionBG0, 160, 0)
animSetTile(intermissionBG0, 1, 1)
animSetColorKey(intermissionBG0, -1)
animSetAlpha(intermissionBG0, 150, 0)

--Intermission Scrolling background 2
intermissionBG2 = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animAddPos(intermissionBG2, -55, 47)
animSetScale(intermissionBG2, 2.849, 2.31)
animUpdate(intermissionBG2)

--Intermission Transparent Up BG
intermissionWindowSlideU = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(intermissionWindowSlideU, 160, 0)
animSetTile(intermissionWindowSlideU, 1, 1)
animSetWindow(intermissionWindowSlideU, -54, 28, 428, 20)

--Intermission Transparent Down BG
intermissionWindowSlideD = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(intermissionWindowSlideD, 160, 0)
animSetTile(intermissionWindowSlideD, 1, 1)
animSetWindow(intermissionWindowSlideD, -54, 190, 428, 20)

--;===========================================================
--; BLACK SCREEN MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_msgMenu = createTextImg(jgFnt, 0, 1, "", 0, 0) --Text that appears in black screens important message

--;===========================================================
--; CHARACTER SELECT SCREENPACK DEFINITION
--;===========================================================
txt_mainSelect = createTextImg(jgFnt, 0, 0, "", 159, 13) --Text that appears in character select with the name of the game mode
txt_charTime = createTextImg(jgFnt, 0, 0, "", 160, 70)
txt_backquestion = createTextImg(jgFnt, 0, 0, "BACK TO MAIN MENU?", 160.5, 110, 0.9, 0.9)
txt_p1Wins = createTextImg(font6, 0, 1, "", 2, 13)
txt_p2Wins = createTextImg(font6, 0, -1, "", 318, 13)

selectFadeinTime = 10 --TODO
selectFadeoutTime = 10 --TODO

--Back Window BG
backWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(backWindowBG, 83.5, 97)
animSetScale(backWindowBG, 1, 1)
animUpdate(backWindowBG)

t_backMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

--Hardcore Scrolling background
selectHardBG0 = animNew(sprIkemen, [[
0,1, 0,0, -1
]])
animAddPos(selectHardBG0, 160, 0)
animSetTile(selectHardBG0, 1, 1)
animSetColorKey(selectHardBG0, -1)

--Tower Scrolling background
selectTowerBG0 = animNew(sprIkemen, [[
0,0, 0,0, -1
]])
animAddPos(selectTowerBG0, 160, 0)
animSetTile(selectTowerBG0, 1, 1)
animSetColorKey(selectTowerBG0, -1)
animSetAlpha(selectTowerBG0, 150, 0)

--P1 Cursor
p1CursorActiveAnim = 160
p1CursorDoneSpr = 161,0 --TODO
p1CursorMoveSnd = 100,0
p1CursorDoneSnd = 100,1
p1RandomMoveSnd = 100,0
--P2 Cursor
p2CursorActiveAnim = 170
p2CursorDoneSpr = 171,0
p2CursorBlink = 0       --1 to blink p2's cursor if overlapping p1's (TODO)
p2CursorMoveSnd = 100,0
p2CursorDoneSnd = 100,1
p2RandomMoveSnd = 100,0

--Cell background
selectCell = animNew(sprSys, [[
150,0, 0,0, -1
]])

--P1 active cursor
p1ActiveCursor = animNew(sprSys, [[
160,0, 0,0, -1
]])

--P2 active cursor
p2ActiveCursor = animNew(sprSys, [[
170,0, 0,0, -1
]])

--Dark Box (Player1 side)
selectBG1a = animNew(sprSys, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1a, 160, 0)
animSetTile(selectBG1a, 1, 0)
animSetWindow(selectBG1a, 5, 0, 151, 239)

--Dark Box (Player2 side)
selectBG1b = animNew(sprSys, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1b, 160, 0)
animSetTile(selectBG1b, 1, 0)
animSetWindow(selectBG1b, 164, 0, 151, 239)

--Dark Box (when Player2 side is not displayed)
selectBG1c = animNew(sprSys, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1c, 160, 0)
animSetTile(selectBG1c, 1, 0)
--animSetWindow(selectBG1c, 0, 0, 351, 239)

--Title background
selectBG2a = animNew(sprSys, [[
102,0, 0,2, -1, 0, s
]])
animAddPos(selectBG2a, 160, 0)
animSetTile(selectBG2a, 1, 0)

--Title background B
selectBG2b = animNew(sprSys, [[
102,1, 0,2, -1, 0, a
]])
animAddPos(selectBG2b, 160, 0)
animSetTile(selectBG2b, 1, 0)

--Title background C
selectBG2c = animNew(sprSys, [[
102,2, 0,2, -1, 0, a
]])
animAddPos(selectBG2c, 160, 0)
animSetTile(selectBG2c, 1, 0)

--nothing but changed to fade if needed
data.fadeSelect = animNew(sprSys, [[
-1,-1, 0,0, -1
]])

--Char Screen (left portrait background)
charBG2 = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(charBG2, 160, 0)
animSetTile(charBG2, 1, 1)
animSetWindow(charBG2, 0, 20, 120, 140)

--Char Screen (right portrait background)
charBG3 = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(charBG3, 160, 0)
animSetTile(charBG3, 1, 1)
animSetWindow(charBG3, 200, 20, 120, 140)

--Cell Lock
cellLock = animNew(sprIkemen, [[
108,0, 0,0, -1
]])
animSetScale(cellLock, 0.07, 0.07)
animUpdate(cellLock)

--Cell Locked Fade Window
cellLockWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetScale(cellLockWindowBG, 91.5, 51)
animUpdate(cellLockWindowBG)

--Input Hints Panel
function drawSelectInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints(
		"u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,
		"s","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos,"w","265,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Switch", 286, hintFontYPos)
end

function drawStageInputHints()
	local inputHintYPos = 21
	local hintFont = font2
	local hintFontYPos = 35
	animPosDraw(inputHintsBG, -56, 21)
	drawMenuInputHints(
		"u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,
		"s","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos,"w","265,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Switch", 286, hintFontYPos)
end

--;===========================================================
--; PLAYER 1 TEAM SELECT SCREENPACK DEFINITION
--;===========================================================
p1SelTmTxt = createTextImg(jgFnt, 5, 1, "TEAM MODE", 20, 30)
IASelTmTxt = createTextImg(jgFnt, 5, 1, "CPU MODE", 20, 30)

t_p1selTeam = {
	{text = "SINGLE"},
	{text = "SIMUL"},
	{text = "TURNS"},
}
for i=1, #t_p1selTeam do
	t_p1selTeam[i]['id'] = createTextImg(jgFnt, 0, 1, t_p1selTeam[i].text, 20, 35 + i * 15)
end

--P1 Team cursor
p1TmCursor = animNew(sprSys, [[
180,0, 0,0, -1
]])

--P1 Team Icon
p1TmIcon = animNew(sprSys, [[
181,0, 0,0, -1
]])

--P1 Empty Team Icon
p1TmEmpty = animNew(sprSys, [[
182,0, 0,0, -1
]])

--;===========================================================
--; PLAYER 2 TEAM SELECT SCREENPACK
--;===========================================================
p2SelTmTxt = createTextImg(jgFnt, 5, -1, "TEAM MODE", 300, 30)
IASelTmTxt2 = createTextImg(jgFnt, 5, -1, "CPU MODE", 300, 30)

t_p2selTeam = {
	{text = t_p1selTeam[1].text}, --Get text from player 1 team table
	{text = t_p1selTeam[2].text},
	{text = t_p1selTeam[3].text},
}
for i=1, #t_p2selTeam do
	t_p2selTeam[i]['id'] = createTextImg(jgFnt, 0, -1, t_p2selTeam[i].text, 300, 35 + i * 15)
end

--P2 Team cursor
p2TmCursor = animNew(sprSys, [[
190,0, 0,0, -1
]])

--P2 Team icon
p2TmIcon = animNew(sprSys, [[
191,0, 0,0, -1
]])

--P2 Empty Team Icon
p2TmEmpty = animNew(sprSys, [[
192,0, 0,0, -1
]])

--;===========================================================
--; PLAYER 1 CHARACTER SELECTING SCREENPACK DEFINITION
--;===========================================================
txt_p1Name = createTextImg(jgFnt, 4, 1, "", 0, 0, 0.8, 0.8)
txt_p1Author = createTextImg(jgFnt, 0, 1, "", 0, 20, 0.65, 0.65)
txt_authorText = "AUTHOR: "

--P1 Random Portrait
p1randomPortrait = animNew(sprIkemen, [[
152,0, 0,0, -1
]])

--P1 Random Sprite
p1randomSprite = animNew(sprIkemen, [[
153,0, 0,0, -1
]])

--P1 Big Portrait Lock
p1portraitLock = animNew(sprIkemen, [[
108,0, 0,0, -1
]])

--P1 Big Portrait Locked Fade Window
p1portraitLockWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])

function f_p1charAnnouncer(p1Cursor)
	if f_getName(p1Cursor) == "Kung Fu Man" then
		sndPlay(sndAnncr, 1, 0)
	elseif f_getName(p1Cursor) == "Kung Fu Girl" then
		sndPlay(sndAnncr, 1, 1)
	elseif f_getName(p1Cursor) == "Suave Dude" then
		sndPlay(sndAnncr, 1, 2)
	elseif f_getName(p1Cursor) == "Mako Mayama" then
		sndPlay(sndAnncr, 1, 3)
	elseif f_getName(p1Cursor) == "Reika Murasame" then
		sndPlay(sndAnncr, 1, 4)
	elseif f_getName(p1Cursor) == "Evil Kung Fu Man" then
		sndPlay(sndAnncr, 1, 5)
	elseif f_getName(p1Cursor) == "Shin Gouki" then
		sndPlay(sndAnncr, 1, 6)
	--elseif f_getName(p1Cursor) == "Your Character Name" then
		--sndPlay(sndAnncr, 1, 1)
	end
end

--;===========================================================
--; PLAYER 2 CHARACTER SELECTING SCREENPACK DEFINITION
--;===========================================================
txt_p2Name = createTextImg(jgFnt, 1, -1, "", 0, 0, 0.8, 0.8)
txt_p2Author = createTextImg(jgFnt, 0, -1, "", 320, 20, 0.65, 0.65)

--P2 Random Portrait
p2randomPortrait = animNew(sprIkemen, [[
152,0, -120,0, -1
]])

--P2 Random Sprite
p2randomSprite = animNew(sprIkemen, [[
153,0, 0,0, -1
]])

--P2 Big Portrait Lock
p2portraitLock = animNew(sprIkemen, [[
108,0, -320,0, -1
]])

--P2 Big Portrait Locked Fade Window
p2portraitLockWindowBG = animNew(sprIkemen, [[
3,0, -1,0, -1
]])

function f_p2charAnnouncer(p2Cursor)
	if f_getName(p2Cursor) == "Kung Fu Man" then
		sndPlay(sndAnncr, 2, 0)
	elseif f_getName(p2Cursor) == "Kung Fu Girl" then
		sndPlay(sndAnncr, 2, 1)
	elseif f_getName(p2Cursor) == "Suave Dude" then
		sndPlay(sndAnncr, 2, 2)
	elseif f_getName(p2Cursor) == "Mako Mayama" then
		sndPlay(sndAnncr, 2, 3)
	elseif f_getName(p2Cursor) == "Reika Murasame" then
		sndPlay(sndAnncr, 2, 4)
	elseif f_getName(p2Cursor) == "Evil Kung Fu Man" then
		sndPlay(sndAnncr, 2, 5)
	elseif f_getName(p2Cursor) == "Shin Gouki" then
		sndPlay(sndAnncr, 2, 6)
	--elseif f_getName(p2Cursor) == "Your Character Name" then
		--sndPlay(sndAnncr, 2, 1)
	end
end

--;===========================================================
--; PALETTE SELECT SCREENPACK DEFINITION
--;===========================================================
txt_palText = "COLOR SELECT"
txt_p1Pal = createTextImg(jgFnt, 5, 1, txt_palText, 5, 183)
txt_p2Pal = createTextImg(jgFnt, 5, -1, txt_palText, 280, 183)
txt_p1PalNo = createTextImg(font14, 0, 1, "", 117, 183)
txt_p2PalNo = createTextImg(font14, 0, -1, "", 310, 183)
--txt_p1PalTime = createTextImg(jgFnt, 0, 0, "", 160, 55)
--txt_p2PalTime = createTextImg(jgFnt, 0, 0, "", 160, 55)

--Palette Select Left Arrow
palSelArrowLeft = animNew(sprIkemen, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animSetScale(palSelArrowLeft, 0.45, 0.45)

palSelArrowLP1posX = 105 --Player 1 X-Axis
palSelArrowLP1posY = 174.5 --Player 1 Y-Axis

palSelArrowLP2posX = 285 --Player 2 X-Axis
palSelArrowLP2posY = 174.5 --Player 2 Y-Axis

--Palette Select Right Arrow
palSelArrowRight = animNew(sprIkemen, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animSetScale(palSelArrowRight, 0.45, 0.45)

palSelArrowRP1posX = 135 --Player 1 X-Axis
palSelArrowRP1posY = 174.5 --Player 1 Y-Axis

palSelArrowRP2posX = 312 --Player 2 X-Axis
palSelArrowRP2posY = 174.5 --Player 2 Y-Axis

--Palette Select BG
palSelBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(palSelBG, 0.97, 0.41)
animSetAlpha(palSelBG, 155, 22)

palSelBGP1posX = 0 --Player 1 X-Axis
palSelBGP1posY = 166 --Player 1 Y-Axis

palSelBGP2posX = 173 --Player 2 X-Axis
palSelBGP2posY = 166 --Player 2 Y-Axis

--;===========================================================
--; HANDICAP SELECT SCREENPACK DEFINITION
--;===========================================================
txt_handicapTitle = "HANDICAP SELECT"
txt_handicapP1 = createTextImg(font6, 0, 0, txt_handicapTitle, 77, 168)
txt_handicapP2 = createTextImg(font6, 0, 0, txt_handicapTitle, 248, 168)
--txt_p1HandicapTime = createTextImg(jgFnt, 0, 0, "", 160, 55)
--txt_p2HandicapTime = createTextImg(jgFnt, 0, 0, "", 160, 55)

t_handicapSelect = {
	{text = "NORMAL", 	 service = "", 	    val = nil}, --NO HANDICAP
	{text = "HP-75%", 	 service = "life",  val = 1.333}, --setLife(lifemax() / 1.333)
	{text = "HP-50%", 	 service = "life",  val = 2}, --setLife(lifemax() / 2)
	{text = "HP-25%", 	 service = "life",  val = 4}, --setLife(lifemax() / 4)
	{text = "INSTAKILL", service = "life",  val = nil}, --setLife(lifemax() / lifemax())
	{text = "POW-LV1", 	 service = "power", val = 1000}, --setPower(1000)
	{text = "POW-LV2", 	 service = "power", val = 2000}, --setPower(2000)
	{text = "POW-MAX", 	 service = "power", val = nil}, --setPower(powermax())
	{text = "DEFENCE-75%", service = "defence", val = 1.333}, --setDefence(defence() / 1.333)
	{text = "DEFENCE-50%", service = "defence", val = 2}, --setDefence(defence() / 2)
	{text = "DEFENCE-25%", service = "defence", val = 4}, --setDefence(defence() / 4)
}
for i=1, #t_handicapSelect do
	--t_handicapSelect[i] = {}
	t_handicapSelect[i]['id'] = textImgNew()
end

t_handicapSelect2 = {}
for i=1, #t_handicapSelect do --Make a copy of all items from t_handicapSelect table
	t_handicapSelect2[i] = {}
	t_handicapSelect2[i]['id'] = t_handicapSelect[i].id
	t_handicapSelect2[i]['text'] = t_handicapSelect[i].text
end

--Handicap Select Up Arrows
handicapSelArrowUp = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animSetScale(handicapSelArrowUp, 0.5, 0.5)

handicapSelArrowUP1posX = 138 --Player 1 X-Axis
handicapSelArrowUP1posY = 165 --Player 1 Y-Axis

handicapSelArrowUP2posX = 175 --Player 2 X-Axis
handicapSelArrowUP2posY = 165 --Player 2 Y-Axis

--Handicap Select Down Arrows
handicapSelArrowDown = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animSetScale(handicapSelArrowDown, 0.5, 0.5)

handicapSelArrowDP1posX = 138 --Player 1 X-Axis
handicapSelArrowDP1posY = 210 --Player 1 Y-Axis

handicapSelArrowDP2posX = 175 --Player 2 X-Axis
handicapSelArrowDP2posY = 210 --Player 2 Y-Axis

--Handicap Window BG
handicapWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetScale(handicapWindowBG, 1.005, 0.85)

handicapSelBGP1posX = 0.4 --Player 1 X-Axis
handicapSelBGP1posY = 166 --Player 1 Y-Axis

handicapSelBGP2posX = 168.4 --Player 2 X-Axis
handicapSelBGP2posY = 166 --Player 2 Y-Axis

--;===========================================================
--; STAGE SELECT SCREENPACK DEFINITION
--;===========================================================
txt_stageSelect = createTextImg(jgFnt, 0, 0, "STAGE SELECT", 159, 13)
txt_authorStageText = "AUTHOR: "
txt_locationStageText = "LOCATION: "
txt_daytimeStageText = "TIME: "
txt_selStage = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_stageTime = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_selectMusic = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_stageAuthor = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_stageLocation = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_stageDayTime = createTextImg(jgFnt, 0, 0, "", 0, 0)

--Stage Title background
selectSBG2a = animNew(sprSys, [[
102,0, 0,2, -1, 0, s
]])
animAddPos(selectSBG2a, 160, 192)
animSetTile(selectSBG2a, 1, 0)

--Stage Title background B
selectSBG2b = animNew(sprSys, [[
102,1, 0,2, -1, 0, a
]])
animAddPos(selectSBG2b, 160, 192)
animSetTile(selectSBG2b, 1, 0)

--Stage Title background C
selectSBG2c = animNew(sprSys, [[
102,2, 0,2, -1, 0, a
]])
animAddPos(selectSBG2c, 160, 192)
animSetTile(selectSBG2c, 1, 0)

--Stage Select Title background
selectSTBG2a = animNew(sprSys, [[
102,0, 0,2, -1, 0, s
]])
animAddPos(selectSTBG2a, 160, 46)
animSetTile(selectSTBG2a, 1, 0)

--Stage Select Title background B
selectSTBG2b = animNew(sprSys, [[
102,1, 0,2, -1, 0, a
]])
animAddPos(selectSTBG2b, 160, 46)
animSetTile(selectSTBG2b, 1, 0)

--Stage Select Title background C
selectSTBG2c = animNew(sprSys, [[
102,2, 0,2, -1, 0, a
]])
animAddPos(selectSTBG2c, 160, 46)
animSetTile(selectSTBG2c, 1, 0)

--Classic Stage Select
selStage = animNew(sprIkemen, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStage, 83.5, 166)
animUpdate(selStage)

--Modern Stage Select
selStageM = animNew(sprIkemen, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStageM, 0.4, 63)
animUpdate(selStageM)
animSetScale(selStageM, 2.10, 2.10)

--Classic Stage 0 (Random Icon)
stage0 = animNew(sprIkemen, [[
111,0, 0,0, -1
]])
animAddPos(stage0, 115, 172)
animUpdate(stage0)
animSetScale(stage0, 0.98, 0.98)

--Modern Stage 0 (Random Icon)
stage0M = animNew(sprIkemen, [[
111,0, 0,0, -1
]])
animSetPos(stage0M, 66, 76)
animUpdate(stage0M)
animSetScale(stage0M, 2.09, 2.09)

--Classic Lock
stageLock = animNew(sprIkemen, [[
108,0, 0,0, -1
]])
animAddPos(stageLock, 144, 178)
animSetScale(stageLock, 0.10, 0.10)
animUpdate(stageLock)

--Modern Lock
stageMLock = animNew(sprIkemen, [[
108,0, 0,0, -1
]])
animAddPos(stageMLock, 130.5, 90)
animSetScale(stageMLock, 0.20, 0.20)
animUpdate(stageMLock)

--Classic Locked Fade Window
stageLockWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(stageLockWindowBG, 114, 172)
animSetScale(stageLockWindowBG, 91.5, 51)
animUpdate(stageLockWindowBG)

--Modern Locked Fade Window
stageMLockWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(stageMLockWindowBG, 64, 74)
animSetScale(stageMLockWindowBG, 192, 108)
animUpdate(stageMLockWindowBG)

function f_stageAnnouncer()
	if getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') == "Training Room" then sndPlay(sndAnncr, 0,0) --Stage Announcer Voice Example
	elseif getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') == "Training Room 2" then sndPlay(sndAnncr, 0,0)
	--elseif getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') == "Your Stage Name" then sndPlay(sndAnncr, 0,1)
	end
end

--;===========================================================
--; ARCADE TRAVEL SCREENPACK DEFINITION
--;===========================================================
txt_nextStage = createTextImg(font21, 0, 0, "NEXT STAGE", 160, 16)
txt_nextStageName = createTextImg(font14, 0, 0, "", 160, 27)
txt_nextEnemyName = createTextImg(font14, 0, 0, "", 160, 198)

--Up Bar
travelBarUp = animNew(sprIkemen, [[
290,0, 0,0, -1
]])
animAddPos(travelBarUp, 0, 0)
animUpdate(travelBarUp)

--Down Bar
travelBarDown = animNew(sprIkemen, [[
291,0, 0,0, -1
]])
animAddPos(travelBarDown, 0, 181)
animUpdate(travelBarDown)

--Travel Char Preview Platform
travelCharPlatform = animNew(sprIkemen, [[
292,0, 0,0, -1
]])

--Travel Arrow
travelArrow = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animSetScale(travelArrow, 0.5, 0.5)
animUpdate(travelArrow)

--Travel Slot
travelSlotIcon = animNew(sprIkemen, [[
295,0, 0,0, -1
]])

--Travel Random Icon
travelRandomIcon = animNew(sprSys, [[
151,0, 0,0, -1
]])

--;===========================================================
--; ORDER SELECT AND VERSUS SCREEN COMMON SCREENPACK DEFINITION
--;===========================================================
txt_hints = createTextImg(font5, 0, 0, "", 160, 239)

--VS Logo
vsLogo = animNew(sprSys, [[
200,4, 0,0, 1
200,3, 0,0, 2
200,2, 0,0, 3
200,1, 0,0, 4
200,0, 0,0, 8
200,5, 0,0, 3
200,6, 0,0, 3
200,7, 0,0, 3
200,8, 0,0, 3
200,0, 0,0, -1
]])
animAddPos(vsLogo, 160, 95)

--Background Footer
footerBG = animNew(sprIkemen, [[
4,0, 0,128, -1
]])
animSetScale(footerBG, 1.2, 1.8)
animAddPos(footerBG, 160, 0)
animSetTile(footerBG, 1, 0)
animUpdate(footerBG)

--;===========================================================
--; ORDER SELECT SCREENPACK DEFINITION
--;===========================================================
txt_orderSelect = createTextImg(font14, 0, 0, "ORDER SELECT", 160, 10)
txt_orderRandom = createTextImg(jgFnt, 0, 0, "RANDOM", 160, 238)
txt_orderTime = createTextImg(jgFnt, 0, 0, "", 160, 65)
txt_p1State = createTextImg(jgFnt, 0, 0, "", 78, 22)
txt_p2State = createTextImg(jgFnt, 0, 0, "", 241, 22)
txt_waitingOrder = "WAITING ORDER"
txt_orderFinished = "READY!"

txt_p1NameOrder = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_p2NameOrder = createTextImg(jgFnt, 0, 0, "", 0, 0)

txt_p1OrderNo = createTextImg(jgFnt, 0, 0, "", 9.2, 175)
txt_p2OrderNo = createTextImg(jgFnt, 0, 0, "", 310.2, 175)

--Order Window (left portrait background)
orderWindowL = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(orderWindowL, 160, 0)
animSetTile(orderWindowL, 1, 1)
animSetWindow(orderWindowL, 0, 25, 140, 140)

--Order Window (right portrait background)
orderWindowR = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(orderWindowR, 160, 0)
animSetTile(orderWindowR, 1, 1)
animSetWindow(orderWindowR, 180, 25, 140, 140)

--P1 Order cursor
p1OrderCursor = animNew(sprIkemen, [[
195,0, 0,0, -1
]])
animSetScale(p1OrderCursor, 0.10, 0.10)
animUpdate(p1OrderCursor)

--P2 Order cursor
p2OrderCursor = animNew(sprIkemen, [[
195,1, 0,0, -1
]])
animSetScale(p2OrderCursor, 0.10, 0.10)
animUpdate(p2OrderCursor)

--P1 Order Waiting 1st Member Icon
p1OrderWaiting1st = animNew(sprIkemen, [[
810,1, 0,0, -1
]])
animSetScale(p1OrderWaiting1st, 0.3, 0.3)
animUpdate(p1OrderWaiting1st)

--P1 Order Waiting 2nd Member Icon
p1OrderWaiting2nd = animNew(sprIkemen, [[
810,2, 0,0, -1
]])
animSetScale(p1OrderWaiting2nd, 0.3, 0.3)
animUpdate(p1OrderWaiting2nd)

--P1 Order Waiting 3rd Member Icon
p1OrderWaiting3rd = animNew(sprIkemen, [[
810,3, 0,0, -1
]])
animSetScale(p1OrderWaiting3rd, 0.3, 0.3)
animUpdate(p1OrderWaiting3rd)

--P1 Order Waiting 4th Member Icon
p1OrderWaiting4th = animNew(sprIkemen, [[
810,4, 0,0, -1
]])
animSetScale(p1OrderWaiting4th, 0.3, 0.3)
animUpdate(p1OrderWaiting4th)

--P2 Order Waiting 1st Member Icon
p2OrderWaiting1st = animNew(sprIkemen, [[
810,6, 0,0, -1
]])
animSetScale(p2OrderWaiting1st, 0.3, 0.3)
animUpdate(p2OrderWaiting1st)

--P2 Order Waiting 2nd Member Icon
p2OrderWaiting2nd = animNew(sprIkemen, [[
810,7, 0,0, -1
]])
animSetScale(p2OrderWaiting2nd, 0.3, 0.3)
animUpdate(p2OrderWaiting2nd)

--P2 Order Waiting 3rd Member Icon
p2OrderWaiting3rd = animNew(sprIkemen, [[
810,8, 0,0, -1
]])
animSetScale(p2OrderWaiting3rd, 0.3, 0.3)
animUpdate(p2OrderWaiting3rd)

--P2 Order Waiting 4th Member Icon
p2OrderWaiting4th = animNew(sprIkemen, [[
810,9, 0,0, -1
]])
animSetScale(p2OrderWaiting4th, 0.3, 0.3)
animUpdate(p2OrderWaiting4th)

--P1 Order Done Icon
p1OrderDone = animNew(sprIkemen, [[
810,0, 0,0, -1
]])
animSetScale(p1OrderDone, 0.25, 0.25)
animUpdate(p1OrderDone)

--P2 Order Done Icon
p2OrderDone = animNew(sprIkemen, [[
810,5, 0,0, -1
]])
animSetScale(p2OrderDone, 0.25, 0.25)
animUpdate(p2OrderDone)

--Order Button Interaction Type Sprites
--A Button
orderBtnA = animNew(sprGlyphs, [[
1,0, 0,0, -1
]])
animSetScale(orderBtnA, 0.35, 0.35)
animUpdate(orderBtnA)

--B Button
orderBtnB = animNew(sprGlyphs, [[
2,0, 0,0, -1
]])
animSetScale(orderBtnB, 0.35, 0.35)
animUpdate(orderBtnB)

--C Button
orderBtnC = animNew(sprGlyphs, [[
3,0, 0,0, -1
]])
animSetScale(orderBtnC, 0.35, 0.35)
animUpdate(orderBtnC)

--X Button
orderBtnX = animNew(sprGlyphs, [[
24,0, 0,0, -1
]])
animSetScale(orderBtnX, 0.35, 0.35)
animUpdate(orderBtnX)

--Y Button
orderBtnY = animNew(sprGlyphs, [[
25,0, 0,0, -1
]])
animSetScale(orderBtnY, 0.35, 0.35)
animUpdate(orderBtnY)

--Z Button
orderBtnZ = animNew(sprGlyphs, [[
26,0, 0,0, -1
]])
animSetScale(orderBtnZ, 0.35, 0.35)
animUpdate(orderBtnZ)

--L Button
orderBtnL = animNew(sprGlyphs, [[
27,0, 0,0, -1
]])
animSetScale(orderBtnL, 0.35, 0.35)
animUpdate(orderBtnL)

--R Button
orderBtnR = animNew(sprGlyphs, [[
28,0, 0,0, -1
]])
animSetScale(orderBtnR, 0.35, 0.35)
animUpdate(orderBtnR)

--Start Button
orderBtnS = animNew(sprGlyphs, [[
51,0, 0,0, -1
]])
animSetScale(orderBtnS, 0.35, 0.35)
animUpdate(orderBtnS)

t_orderButtons = {
	{spr = orderBtnA}, --1st
	{spr = orderBtnB}, --2nd
	{spr = orderBtnC}, --3rd
	{spr = orderBtnX}, --4th
}

function drawOrderInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","80,"..inputHintYPos,"r","100,"..inputHintYPos,"s","179,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Edit Order", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 199.5, hintFontYPos)
end

--;===========================================================
--; VERSUS SCREENPACK DEFINITION
--;===========================================================
txt_p1NameVS = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_p2NameVS = createTextImg(jgFnt, 0, 0, "", 0, 0)

--VS Window (left portrait background)
vsWindowL = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(vsWindowL, 160, 0)
animSetTile(vsWindowL, 1, 1)
animSetWindow(vsWindowL, 20, 30, 120, 140)

--VS Window (right portrait background)
vsWindowR = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(vsWindowR, 160, 0)
animSetTile(vsWindowR, 1, 1)
animSetWindow(vsWindowR, 180, 30, 120, 140)

t_vsHints = {
--[[
	{text = "KEEP START IN CHAR SELECT AND PRESS C or Z BUTTON"},
	{text = "WHEN CHARS GETTING BUG PRESS F4 TO RELOAD THE MATCH"},
	{text = "PRESS THE IMPR PANT KEY TO TAKE A SCREENSHOT"},
	{text = "PRESS (RIGHT OR LEFT) + Y + A TO CHANGE BETWEEN THE CHARACTERS IN TAG MODE"},
	{text = "WHILE YOU FIGHT, PRESS Y + A TO ACTIVATE THE PARTNER ASSIST IN TAG MODE"},
]]
	{text = "ADD YOUR HINTS HERE"},
	{text = "ADD YOUR HINTS HERE"},
}

--;===========================================================
--; MATCH INFO SCREENPACK DEFINITION
--;===========================================================
txt_matchNo = createTextImg(font21, 0, 0, "", 160, 20)
txt_gameNo = createTextImg(font21, 0, 0, "", 160, 20)
txt_bossNo = createTextImg(font12, 0, 0, "", 160, 20)
txt_bonusNo = createTextImg(font21, 0, 0, "", 160, 20)
arcadeRivalMatchNo = 3 --Set Rival MatchNo to show "Rival Match" Text in Arcade VS Screen

function f_matchInfo() --Not draws! only prepare the info for use in versus screen
--Match Info Vars
	gameNo = gameNo + 1
	bossNo = bossNo + 1
	bonusNo = bonusNo + 1
--Set Match Info Texts
	if data.gameMode == "arcade" and matchNo == arcadeRivalMatchNo then textImgSetText(txt_matchNo, "RIVAL MATCH") --Set rival match text
	elseif (data.gameMode == "arcade" or data.gameMode == "allroster") and matchNo ~= lastMatch then textImgSetText(txt_matchNo, "STAGE "..matchNo) --Set Arcade Match Text
	elseif data.gameMode == "tower" and matchNo == 1 then textImgSetText(txt_matchNo, "LOW LEVEL") --Set Tower 1st Match Text
	elseif data.gameMode == "tower" and matchNo ~= lastMatch then textImgSetText(txt_matchNo, "FLOOR "..matchNo - 1) --Set Tower Match Text
	elseif data.gameMode == "abyss" then textImgSetText(txt_matchNo, "DEPTH "..getAbyssDepth()) --Set Abyss Depth Match Text
	end
	if data.gameMode == "survival" then textImgSetText(txt_gameNo, "REMAINING MATCHES: "..(lastMatch - gameNo)) --Set All Roster Match Text
	elseif data.gameMode == "vskumite" then textImgSetText(txt_gameNo, gameNo.."/"..data.kumite) --Set VS X Kumite Match Text
	elseif data.gameMode == "bossrush" then textImgSetText(txt_bossNo, "REMAINING BOSSES: "..(lastMatch - bossNo)) --Set Boss Rush Match Text
	elseif data.gameMode == "bonusrush" then textImgSetText(txt_bonusNo, "BONUS "..bonusNo) --Set Bonus Rush Match Text
	elseif data.gameMode == "intermission" then textImgSetText(txt_gameNo, "EXTRA STAGE") --Set Intermission Match Text
	else textImgSetText(txt_gameNo, "MATCH "..gameNo) --Set Versus Match Text
	end
--Set Final Matchs Text
	if (data.gameMode == "arcade" or data.gameMode == "allroster") and matchNo == lastMatch then textImgSetText(txt_matchNo, "FINAL STAGE") --Set Arcade Final Match Text
	elseif data.gameMode == "tower" and matchNo == lastMatch then textImgSetText(txt_matchNo, "LAST FLOOR") --Set Tower Final Match Text
	end
	if data.gameMode == "survival" and (lastMatch - gameNo == 0) then textImgSetText(txt_gameNo, "FINAL MATCH") --Set All Roster Final Match Text
	elseif data.gameMode == "bossrush" and (lastMatch - bossNo == 0) then textImgSetText(txt_bossNo, "FINAL BOSS") --Set Boss Rush Final Match Text
	elseif data.gameMode == "bonusrush" and (lastMatch - bonusNo == 0) then textImgSetText(txt_bonusNo, "LAST GAME") --Set Bonus Rush Final Match Text
	end
--Set Tournament Matchs Text
	if data.gameMode == "tourney" then
		if endTourney then --To Show in VS Screen
			textImgSetText(txt_matchNo, txt_tourneyR2)
		else
			f_setTourneyState()
			if tourneyGroupNo == 1 then --Display for Left Side
				if tourneyFightNo == 1 then textImgSetText(txt_matchNo, tourneyState.." - 1ST MATCH")
				elseif tourneyFightNo == 2 then textImgSetText(txt_matchNo, tourneyState.." - 2ND MATCH")
				elseif tourneyFightNo == 3 then textImgSetText(txt_matchNo, tourneyState.." - 3RD MATCH")
				elseif tourneyFightNo >= 4 then textImgSetText(txt_matchNo, tourneyState.." - "..tourneyFightNo.."TH MATCH")
				end
			elseif tourneyGroupNo == 2 then --Display for Right Side
				local previousMatches = #t_tourneyMenu.Group[1].Round[tourneyRoundNo]
				local currentMatch = previousMatches / 2
				if tourneyFightNo + currentMatch == 1 then textImgSetText(txt_matchNo, tourneyState.." - 1ST MATCH")
				elseif tourneyFightNo + currentMatch == 2 then textImgSetText(txt_matchNo, tourneyState.." - 2ND MATCH")
				elseif tourneyFightNo + currentMatch == 3 then textImgSetText(txt_matchNo, tourneyState.." - 3RD MATCH")
				elseif tourneyFightNo + currentMatch >= 4 then textImgSetText(txt_matchNo, tourneyState.." - "..tourneyFightNo + currentMatch.."TH MATCH")
				end
			end
		end
	end
end

function f_setTourneyState()
	if endTourney then --To Show in Tournament Menu
		tourneyState = txt_tourneyR2 --Final
	else
		if data.tourneySize == 16 then
			if tourneyRoundNo == 1 then tourneyState = txt_tourneyR16 --8th-Finals
			elseif tourneyRoundNo == 2 then tourneyState = txt_tourneyR8 --Quarterfinals
			elseif tourneyRoundNo == 3 then tourneyState = txt_tourneyR4 --Semifinals
			end
		elseif data.tourneySize == 8 then
			if tourneyRoundNo == 1 then tourneyState = txt_tourneyR8 --Quarterfinals
			elseif tourneyRoundNo == 2 then tourneyState = txt_tourneyR4 --Semifinals
			end
		elseif data.tourneySize == 4 then
			if tourneyRoundNo == 1 then tourneyState = txt_tourneyR4 end --Semifinals
		end
	end
end

--;===========================================================
--; VICTORY SCREEN SCREENPACK DEFINITION
--;===========================================================
txt_winnername = createTextImg(jgFnt, 0, 1, "", 20, 162)
txt_winquote = createTextImg(font2, 0, 1, "", 0, 0)
txt_winquoteFix = createTextImg(jgFnt, 0, 1, "", 20, 162)
	
--Win Char Modern Transparent BG
wincharBG = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(wincharBG, 160, 0)
animSetTile(wincharBG, 1, 1)
animSetWindow(wincharBG, -54, 0, 428, 142)

--Win Char Classic Transparent (left portrait background)
wincharBGC1 = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(wincharBGC1, 160, 0)
animSetTile(wincharBGC1, 1, 1)
animSetWindow(wincharBGC1, 32, 5, 120, 140)

--Win Char Classic Transparent (right portrait background)
wincharBGC2 = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(wincharBGC2, 160, 0)
animSetTile(wincharBGC2, 1, 1)
animSetWindow(wincharBGC2, 169, 5, 120, 140)

--Win Quote Transparent BG
quoteBG = animNew(sprSys, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(quoteBG, 160, 0)
animSetTile(quoteBG, 1, 1)
animSetWindow(quoteBG, 14, 152, 290, 65)

--;===========================================================
--; REMATCH SCREENPACK DEFINITION
--;===========================================================
txt_rematchCPU = createTextImg(font6, 0, 0, "BATTLE OPTION", 160, 87)
txt_rematch = createTextImg(font6, 0, 0, "P1 BATTLE OPTION", 76, 87)
txt_rematch2 = createTextImg(font6, 0, 0, "P2 BATTLE OPTION", 246, 87)
txt_rematchTime = createTextImg(jgFnt, 0, 0, "", 160, 55)

t_battleOption = {
	{text = "REMATCH"},
	{text = "CHARACTER SELECT"},
	{text = "STAGE SELECT"},
	{text = "MAIN MENU"},
}
for i=1, #t_battleOption do
	t_battleOption[i]['id'] = textImgNew()
end
t_battleOption2 = t_battleOption --Reuse t_battleOption to generate P2 table

--Rematch Window BG
rematchWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(rematchWindowBG, 0.4, 82)
animSetScale(rematchWindowBG, 1.005, 1.1)
animUpdate(rematchWindowBG)

--Rematch Window BG CPU
rematchCPUWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(rematchCPUWindowBG, 83.5, 82)
animSetScale(rematchCPUWindowBG, 1.005, 1.1)
animUpdate(rematchCPUWindowBG)

--Rematch Window BG Player 2
rematch2WindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(rematch2WindowBG, 168.4, 82)
animSetScale(rematch2WindowBG, 1.005, 1.1)
animUpdate(rematch2WindowBG)

--Rematch Input Hints Panel
function drawRematchInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","80,"..inputHintYPos,"d","100,"..inputHintYPos,"s","172,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 193, hintFontYPos)
end

--;===========================================================
--; END RANKED MATCH SCREENPACK DEFINITION
--;===========================================================
txt_rankInfo = createTextImg(font5, 0, 0, "INFORMATION", 157, 111)
txt_rankESC = createTextImg(jgFnt, 5, 0, "PRESS ESC TO EXIT", 159, 151)
txt_rankText = createTextImg(jgFnt, 0, 0, "", 0, 0, 0.56, 0.56)
txt_rankMsg = "ONLINE RANKED MATCH HAS FINISHED"

--Ranked Info Window BG
rankWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(rankWindowBG, 83.5, 97)
animSetScale(rankWindowBG, 1, 1)
animUpdate(rankWindowBG)

--;===========================================================
--; SERVICE SCREENPACK
--;===========================================================
txt_service = createTextImg(jgFnt, 0, 0, "CONTINUE SERVICE", 159, 13)
txt_serviceTime = createTextImg(jgFnt, 0, 0, "", 160, 235)
txt_noService = createTextImg(font2, 0, 0, "", 159.5, 210)

txt_noServiceCoop = "This service is Unavailable in Co-Op Mode."
txt_noServiceQuickCont = "You have Disabled Change Characters by Quick Continue."

--Service Button Interaction Type Sprites
--A Button
serviceBtnA = animNew(sprGlyphs, [[
1,0, 0,0, -1
]])
animSetScale(serviceBtnA, 0.35, 0.35)
animUpdate(serviceBtnA)

--B Button
serviceBtnB = animNew(sprGlyphs, [[
2,0, 0,0, -1
]])
animSetScale(serviceBtnB, 0.35, 0.35)
animUpdate(serviceBtnB)

--C Button
serviceBtnC = animNew(sprGlyphs, [[
3,0, 0,0, -1
]])
animSetScale(serviceBtnC, 0.35, 0.35)
animUpdate(serviceBtnC)

--X Button
serviceBtnX = animNew(sprGlyphs, [[
24,0, 0,0, -1
]])
animSetScale(serviceBtnX, 0.35, 0.35)
animUpdate(serviceBtnX)

--Y Button
serviceBtnY = animNew(sprGlyphs, [[
25,0, 0,0, -1
]])
animSetScale(serviceBtnY, 0.35, 0.35)
animUpdate(serviceBtnY)

--Z Button
serviceBtnZ = animNew(sprGlyphs, [[
26,0, 0,0, -1
]])
animSetScale(serviceBtnZ, 0.35, 0.35)
animUpdate(serviceBtnZ)

--L Button
serviceBtnL = animNew(sprGlyphs, [[
27,0, 0,0, -1
]])
animSetScale(serviceBtnL, 0.35, 0.35)
animUpdate(serviceBtnL)

--R Button
serviceBtnR = animNew(sprGlyphs, [[
28,0, 0,0, -1
]])
animSetScale(serviceBtnR, 0.35, 0.35)
animUpdate(serviceBtnR)

--Start Button
serviceBtnS = animNew(sprGlyphs, [[
51,0, 0,0, -1
]])
animSetScale(serviceBtnS, 0.35, 0.35)
animUpdate(serviceBtnS)

t_service = {
	{text = "DIFFICULTY LEVEL DOWN",	button = "A", spr = serviceBtnA, service = "aileveldown"},
	{text = "POWER WILL START AT MAX",	button = "B", spr = serviceBtnB, service = "max power"},
	{text = "ENEMY LIFE AT 1/3",		button = "C", spr = serviceBtnC, service = "low cpu life"},
	{text = "CHANGE TEAM MODE",			button = "X", spr = serviceBtnX, service = "team change"},
	{text = "DOUBLE DEFENCE",			button = "Y", spr = serviceBtnY, service = "defence x2"},
	{text = "NO SERVICE",				button = "Z", spr = serviceBtnZ, service = ""},
}
for i=1, #t_service do
	t_service[i]['id'] = ''
end

--Service Input Hints Panel
function drawServiceInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":No Service", 231, hintFontYPos)
end

--;===========================================================
--; RESULTS SCREENPACK
--;===========================================================
txt_resultTitle = createTextImg(font14, 0, 0, "", 203, 20)
txt_resultNo = createTextImg(survNumFnt, 0, -1, "", 320, 150)
txt_resultWins = createTextImg(survNumFnt, 0, -1, "", 320, 120)
txt_resultLoses = createTextImg(survNumFnt, 0, -1, "", 320, 192)
txt_resultTime = createTextImg(jgFnt, 0, -1, "", 266, 220)
txt_resultScore = createTextImg(jgFnt, 0, -1, "", 266, 234)
txt_resultRank = createTextImg(jgFnt, 5, -1, "RANK", 318, 205)
txt_resultRecord = createTextImg(jgFnt, 5, 1, "NEW RECORD!", 2, 26, 0.75, 0.75)
txt_resultTeam = createTextImg(font6, 0, 1, "", 1, 206)
txt_resultName = createTextImg(font6, 0, 1, "", 1, 221)
txt_resultStatus = createTextImg(survNumFnt, 0, -1, "", 318, 54)

function f_drawScoreAttackResults()
	f_drawQuickText(txt_scoreResult, survNumFnt, 0, -1, f_setThousandsFormat(score()).."PTS", 320, 110, 0.45, 0.45)
	f_drawQuickText(txt_scoreTotal, survNumFnt, 0, -1, "TOTAL SCORE", 320, 125, 0.8, 0.8)
	
	f_drawQuickText(txt_scoreRecord, survNumFnt, 0, -1, f_setThousandsFormat(score()).."PTS", 320, 165, 0.3, 0.3)
	f_drawQuickText(txt_scoreBest, survNumFnt, 0, -1, "BEST SCORE", 320, 178, 0.7, 0.7)
	
	f_drawQuickText(txt_scoreWins, jgFnt, 0, -1, "WINS: "..winCnt, 266, 234)
end

function f_drawTimeAttackResults()
	f_drawQuickText(txt_timeResult, survNumFnt, 0, -1, f_setTimeFormat(timerTotal()), 320, 110, 0.45, 0.45)
	f_drawQuickText(txt_timeTotal, survNumFnt, 0, -1, "TOTAL TIME", 320, 125, 0.8, 0.8)
	
	f_drawQuickText(txt_timeRecord, survNumFnt, 0, -1, f_setTimeFormat(timerTotal()), 320, 165, 0.3, 0.3)
	f_drawQuickText(txt_timeBest, survNumFnt, 0, -1, "BEST TIME", 320, 178, 0.7, 0.7)
	
	f_drawQuickText(txt_timeWins, jgFnt, 0, -1, "WINS: "..winCnt, 266, 220)
end

function f_drawAbyssResults()
	local PosX = 318
	local PosY = 130
	local font = jgFnt
	f_drawQuickText(txt_resultDepthLv, survNumFnt, 0, -1, getAbyssDepth(), PosX - 10, PosY, 0.82, 0.82)
	f_drawQuickText(txt_resultDepthTitle, survNumFnt, 0, -1, "DEPTH", PosX, PosY + 20)
	f_drawQuickText(txt_winsTitle, font, 0, -1, winCnt.." WINS", PosX, PosY + 40)
	f_drawQuickText(txt_expenseTitle, font, 0, -1, abyssDat.nosave.expense.." IKC SPENT", PosX, PosY + 52)
end

--Result BG
resultBG = animNew(sprIkemen, [[
280,0, 0,0, -1
]])
animAddPos(resultBG, 0, 0)
animUpdate(resultBG)

--Rank F
rankF = animNew(sprIkemen, [[
210,0, 0,0, -1
]])
animAddPos(rankF, 256, 205)
animSetScale(rankF, 0.5, 0.5)
animUpdate(rankF)

--Rank D-
rankDM = animNew(sprIkemen, [[
210,1, 0,0, -1
]])
animAddPos(rankDM, 256, 205)
animSetScale(rankDM, 0.5, 0.5)
animUpdate(rankDM)

--Rank D
rankD = animNew(sprIkemen, [[
210,2, 0,0, -1
]])
animAddPos(rankD, 256, 205)
animSetScale(rankD, 0.5, 0.5)
animUpdate(rankD)

--Rank D+
rankDP = animNew(sprIkemen, [[
210,3, 0,0, -1
]])
animAddPos(rankDP, 254, 205)
animSetScale(rankDP, 0.5, 0.5)
animUpdate(rankDP)

--Rank C
rankC = animNew(sprIkemen, [[
210,4, 0,0, -1
]])
animAddPos(rankC, 256, 205)
animSetScale(rankC, 0.5, 0.5)
animUpdate(rankC)

--Rank C+
rankCP = animNew(sprIkemen, [[
210,5, 0,0, -1
]])
animAddPos(rankCP, 253, 205)
animSetScale(rankCP, 0.5, 0.5)
animUpdate(rankCP)

--Rank B
rankB = animNew(sprIkemen, [[
210,6, 0,0, -1
]])
animAddPos(rankB, 256, 205)
animSetScale(rankB, 0.5, 0.5)
animUpdate(rankB)

--Rank B+
rankBP = animNew(sprIkemen, [[
210,7, 0,0, -1
]])
animAddPos(rankBP, 255, 205)
animSetScale(rankBP, 0.5, 0.5)
animUpdate(rankBP)

--Rank A
rankA = animNew(sprIkemen, [[
210,8, 0,0, -1
]])
animAddPos(rankA, 256, 205)
animSetScale(rankA, 0.5, 0.5)
animUpdate(rankA)

--Rank A+
rankAP = animNew(sprIkemen, [[
210,9, 0,0, -1
]])
animAddPos(rankAP, 253, 205)
animSetScale(rankAP, 0.5, 0.5)
animUpdate(rankAP)

--Rank S
rankS = animNew(sprIkemen, [[
210,10, 0,0, -1
]])
animAddPos(rankS, 256, 205)
animSetScale(rankS, 0.5, 0.5)
animUpdate(rankS)

--Rank S+
rankSP = animNew(sprIkemen, [[
210,11, 0,0, -1
]])
animAddPos(rankSP, 255, 205)
animSetScale(rankSP, 0.5, 0.5)
animUpdate(rankSP)

--Rank XS
rankXS = animNew(sprIkemen, [[
210,12, 0,0, -1
]])
animAddPos(rankXS, 252, 205)
animSetScale(rankXS, 0.5, 0.5)
animUpdate(rankXS)

--Rank GDLK
rankGDLK = animNew(sprIkemen, [[
210,13, 0,0, -1
]])
animAddPos(rankGDLK, 265, 211)
animSetScale(rankGDLK, 0.35, 0.35)
animUpdate(rankGDLK)

--;===========================================================
--; CONTINUE SCREENPACK DEFINITION
--;===========================================================
--Times Continue Text
txt_contTimesCfg = createTextImg(jgFnt, 0, 1, "", 15, 30)
txt_contTimes = "TIMES CONTINUED: "

--Background
contBG0 = animNew(sprIkemen, [[
1000,0, -32,8, -1
]])
animUpdate(contBG0)

--Black Background Cover Top
contBG1 = animNew(sprIkemen, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG1, -1)
animSetTile(contBG1, 1, 0)
animSetWindow(contBG1, 0, 0, 320, 40)
animSetAlpha(contBG1, 0, 0)
animUpdate(contBG1)

--Black Background Cover Bottom
contBG2 = animNew(sprIkemen, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG2, -1)
animSetTile(contBG2, 1, 0)
animSetWindow(contBG2, 0, 200, 320, 40)
animSetAlpha(contBG2, 0, 0)
animUpdate(contBG2)

--Continue Input Hints Panel
function drawContinueInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	drawMenuInputHints(
		"a","60,200","b","80,200","c","100,200",
		"x","60,"..inputHintYPos,"y","80,"..inputHintYPos,"z","100,"..inputHintYPos,
		"s","180,211"
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Countdown", 121, 224)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Continue", 201, 224)
end

--;===========================================================
--; GAME OVER SCREENPACK DEFINITION
--;===========================================================

--Continue Time Animation
contTimer = animNew(sprIkemen, [[
909,0, 0,0, 1 ;1 (count 9 start initial animation)
909,1, 0,0, 1 ;2
909,2, 0,0, 1 ;3
909,3, 0,0, 3 ;6
909,4, 0,0, 3 ;9
909,5, 0,0, 1 ;10
909,6, 0,0, 3 ;13
909,7, 0,0, 2 ;15
909,8, 0,0, 2 ;17
909,9, 0,0, 2 ;19
909,10, 0,0, 1 ;20
909,11, 0,0, 5 ;25
909,12, 0,0, 5 ;30
909,13, 0,0, 1 ;31
909,14, 0,0, 1 ;32
909,15, 0,0, 3 ;35
909,16, 0,0, 3 ;38
909,17, 0,0, 1 ;39
909,18, 0,0, 5 ;44
909,19, 0,0, 1 ;45
909,20, 0,0, 4 ;49
909,21, 0,0, 1 ;50
909,22, 0,0, 1 ;51
909,23, 0,0, 1 ;52
909,24, 0,0, 2 ;54
909,25, 0,0, 1 ;55
909,26, 0,0, 5 ;60
909,27, 0,0, 5 ;65
909,28, 0,0, 1 ;66
909,29, 0,0, 3 ;69
909,30, 0,0, 2 ;71
909,31, 0,0, 6 ;77 (count 9 actual counter)
909,32, 0,0, 54 ;131
909,33, 0,0, 4 ;135
909,34, 0,0, 4 ;139
909,35, 0,0, 4 ;143
909,36, 0,0, 4 ;147
909,37, 0,0, 44 ;191
909,38, 0,0, 9 ;200
909,39, 0,0, 4 ;204
909,40, 0,0, 3 ;207
909,41, 0,0, 2 ;209
909,42, 0,0, 2 ;211
909,43, 0,0, 1 ;212
909,44, 0,0, 2 ;214
909,45, 0,0, 1 ;215
909,46, 0,0, 1 ;216
909,47, 0,0, 2 ;218
909,48, 0,0, 1 ;219
909,49, 0,0, 1 ;220
909,50, 0,0, 1 ;221 (count 9 end)
908,0, 0,0, 1 ;222 (count 8 start)
908,1, 0,0, 2 ;224
908,2, 0,0, 2 ;226
908,3, 0,0, 2 ;228
908,4, 0,0, 2 ;230
908,5, 0,0, 2 ;232
908,6, 0,0, 2 ;234
908,7, 0,0, 1 ;235
908,8, 0,0, 2 ;237
908,9, 0,0, 3 ;240
908,10, 0,0, 4 ;244
908,11, 0,0, 9 ;253
908,12, 0,0, 5 ;258
908,13, 0,0, 4 ;262
908,14, 0,0, 4 ;266
908,15, 0,0, 4 ;270
908,16, 0,0, 4 ;274
908,17, 0,0, 44 ;318
908,18, 0,0, 9 ;327
908,19, 0,0, 4 ;331
908,20, 0,0, 3 ;334
908,21, 0,0, 2 ;336
908,22, 0,0, 2 ;338
908,23, 0,0, 1 ;339
908,24, 0,0, 2 ;341
908,25, 0,0, 1 ;342
908,26, 0,0, 1 ;343
908,27, 0,0, 2 ;345
908,28, 0,0, 1 ;346
908,29, 0,0, 1 ;347
908,30, 0,0, 1 ;348 (count 8 end)
907,0, 0,0, 1 ;349 (count 7 start)
907,1, 0,0, 2 ;351
907,2, 0,0, 2 ;353
907,3, 0,0, 2 ;355
907,4, 0,0, 2 ;357
907,5, 0,0, 2 ;359
907,6, 0,0, 2 ;361
907,7, 0,0, 1 ;362
907,8, 0,0, 2 ;364
907,9, 0,0, 3 ;367
907,10, 0,0, 4 ;371
907,11, 0,0, 9 ;380
907,12, 0,0, 5 ;385
907,13, 0,0, 4 ;389
907,14, 0,0, 4 ;393
907,15, 0,0, 4 ;397
907,16, 0,0, 4 ;401
907,17, 0,0, 44 ;445
907,18, 0,0, 9 ;454
907,19, 0,0, 4 ;458
907,20, 0,0, 3 ;461
907,21, 0,0, 2 ;463
907,22, 0,0, 2 ;465
907,23, 0,0, 1 ;466
907,24, 0,0, 2 ;468
907,25, 0,0, 1 ;469
907,26, 0,0, 1 ;470
907,27, 0,0, 2 ;472
907,28, 0,0, 1 ;473
907,29, 0,0, 1 ;474
907,30, 0,0, 1 ;475 (count 7 end)
906,0, 0,0, 1 ;476 (count 6 start)
906,1, 0,0, 2 ;478
906,2, 0,0, 2 ;480
906,3, 0,0, 2 ;482
906,4, 0,0, 2 ;484
906,5, 0,0, 2 ;486
906,6, 0,0, 2 ;488
906,7, 0,0, 1 ;489
906,8, 0,0, 2 ;491
906,9, 0,0, 3 ;494
906,10, 0,0, 4 ;498
906,11, 0,0, 9 ;507
906,12, 0,0, 5 ;512
906,13, 0,0, 4 ;516
906,14, 0,0, 4 ;520
906,15, 0,0, 4 ;524
906,16, 0,0, 4 ;528
906,17, 0,0, 44 ;572
906,18, 0,0, 9 ;581
906,19, 0,0, 4 ;585
906,20, 0,0, 3 ;588
906,21, 0,0, 2 ;590
906,22, 0,0, 2 ;592
906,23, 0,0, 1 ;593
906,24, 0,0, 2 ;595
906,25, 0,0, 1 ;596
906,26, 0,0, 1 ;597
906,27, 0,0, 2 ;599
906,28, 0,0, 1 ;600
906,29, 0,0, 1 ;601
906,30, 0,0, 1 ;602 (count 6 end)
905,0, 0,0, 1 ;603 (count 5 start)
905,1, 0,0, 2 ;605
905,2, 0,0, 2 ;607
905,3, 0,0, 2 ;609
905,4, 0,0, 2 ;611
905,5, 0,0, 2 ;613
905,6, 0,0, 2 ;615
905,7, 0,0, 1 ;616
905,8, 0,0, 2 ;618
905,9, 0,0, 3 ;621
905,10, 0,0, 4 ;625
905,11, 0,0, 9 ;634
905,12, 0,0, 5 ;639
905,13, 0,0, 4 ;643
905,14, 0,0, 4 ;647
905,15, 0,0, 4 ;651
905,16, 0,0, 4 ;655
905,17, 0,0, 44 ;699
905,18, 0,0, 9 ;708
905,19, 0,0, 4 ;712
905,20, 0,0, 3 ;715
905,21, 0,0, 2 ;717
905,22, 0,0, 2 ;719
905,23, 0,0, 1 ;720
905,24, 0,0, 2 ;722
905,25, 0,0, 1 ;723
905,26, 0,0, 1 ;724
905,27, 0,0, 2 ;726
905,28, 0,0, 1 ;727
905,29, 0,0, 1 ;728
905,30, 0,0, 1 ;729 (count 5 end)
904,0, 0,0, 1 ;730 (count 4 start)
904,1, 0,0, 2 ;732
904,2, 0,0, 2 ;734
904,3, 0,0, 2 ;736
904,4, 0,0, 2 ;738
904,5, 0,0, 2 ;740
904,6, 0,0, 2 ;742
904,7, 0,0, 1 ;743
904,8, 0,0, 2 ;745
904,9, 0,0, 3 ;748
904,10, 0,0, 4 ;752
904,11, 0,0, 9 ;761
904,12, 0,0, 5 ;766
904,13, 0,0, 4 ;770
904,14, 0,0, 4 ;774
904,15, 0,0, 4 ;778
904,16, 0,0, 4 ;782
904,17, 0,0, 44 ;826
904,18, 0,0, 9 ;835
904,19, 0,0, 4 ;839
904,20, 0,0, 3 ;842
904,21, 0,0, 2 ;844
904,22, 0,0, 2 ;846
904,23, 0,0, 1 ;847
904,24, 0,0, 2 ;849
904,25, 0,0, 1 ;850
904,26, 0,0, 1 ;851
904,27, 0,0, 2 ;853
904,28, 0,0, 1 ;854
904,29, 0,0, 1 ;855
904,30, 0,0, 1 ;856 (count 4 end)
903,0, 0,0, 1 ;857 (count 3 start)
903,1, 0,0, 2 ;859
903,2, 0,0, 2 ;861
903,3, 0,0, 2 ;863
903,4, 0,0, 2 ;865
903,5, 0,0, 2 ;867
903,6, 0,0, 2 ;869
903,7, 0,0, 1 ;870
903,8, 0,0, 2 ;872
903,9, 0,0, 3 ;875
903,10, 0,0, 4 ;879
903,11, 0,0, 9 ;888
903,12, 0,0, 5 ;893
903,13, 0,0, 4 ;897
903,14, 0,0, 4 ;901
903,15, 0,0, 4 ;905
903,16, 0,0, 4 ;909
903,17, 0,0, 44 ;953
903,18, 0,0, 9 ;962
903,19, 0,0, 4 ;966
903,20, 0,0, 3 ;969
903,21, 0,0, 2 ;971
903,22, 0,0, 2 ;973
903,23, 0,0, 1 ;974
903,24, 0,0, 2 ;976
903,25, 0,0, 1 ;977
903,26, 0,0, 1 ;978
903,27, 0,0, 2 ;980
903,28, 0,0, 1 ;981
903,29, 0,0, 1 ;982
903,30, 0,0, 1 ;983 (count 3 end)
902,0, 0,0, 1 ;984 (count 2 start)
902,1, 0,0, 2 ;986
902,2, 0,0, 2 ;988
902,3, 0,0, 2 ;990
902,4, 0,0, 2 ;992
902,5, 0,0, 2 ;994
902,6, 0,0, 2 ;996
902,7, 0,0, 1 ;997
902,8, 0,0, 2 ;999
902,9, 0,0, 3 ;1002
902,10, 0,0, 4 ;1006
902,11, 0,0, 9 ;1015
902,12, 0,0, 5 ;1020
902,13, 0,0, 4 ;1024
902,14, 0,0, 4 ;1028
902,15, 0,0, 4 ;1032
902,16, 0,0, 4 ;1036
902,17, 0,0, 44 ;1080
902,18, 0,0, 9 ;1089
902,19, 0,0, 4 ;1093
902,20, 0,0, 3 ;1096
902,21, 0,0, 2 ;1098
902,22, 0,0, 2 ;1100
902,23, 0,0, 1 ;1101
902,24, 0,0, 2 ;1103
902,25, 0,0, 1 ;1104
902,26, 0,0, 1 ;1105
902,27, 0,0, 2 ;1107
902,28, 0,0, 1 ;1108
902,29, 0,0, 1 ;1109
902,30, 0,0, 1 ;1110 (count 2 end)
901,0, 0,0, 1 ;1111 (count 1 start)
901,1, 0,0, 2 ;1113
901,2, 0,0, 2 ;1115
901,3, 0,0, 2 ;1117
901,4, 0,0, 2 ;1119
901,5, 0,0, 2 ;1121
901,6, 0,0, 2 ;1123
901,7, 0,0, 1 ;1124
901,8, 0,0, 2 ;1126
901,9, 0,0, 3 ;1129
901,10, 0,0, 4 ;1133
901,11, 0,0, 9 ;1142
901,12, 0,0, 5 ;1147
901,13, 0,0, 4 ;1151
901,14, 0,0, 4 ;1155
901,15, 0,0, 4 ;1159
901,16, 0,0, 4 ;1163
901,17, 0,0, 44 ;1207
901,18, 0,0, 9 ;1216
901,19, 0,0, 4 ;1220
901,20, 0,0, 3 ;1223
901,21, 0,0, 2 ;1225
901,22, 0,0, 2 ;1227
901,23, 0,0, 1 ;1228
901,24, 0,0, 2 ;1230
901,25, 0,0, 1 ;1231
901,26, 0,0, 1 ;1232
901,27, 0,0, 2 ;1234
901,28, 0,0, 1 ;1235
901,29, 0,0, 1 ;1236
901,30, 0,0, 1 ;1237 (count 1 end)
900,0, 0,0, 1 ;1238 (count 0 start)
900,1, 0,0, 2 ;1240
900,2, 0,0, 2 ;1242
900,3, 0,0, 2 ;1244
900,4, 0,0, 2 ;1246
900,5, 0,0, 2 ;1248
900,6, 0,0, 2 ;1250
900,7, 0,0, 1 ;1251
900,8, 0,0, 2 ;1253
900,9, 0,0, 3 ;1256
900,10, 0,0, 4 ;1260
900,11, 0,0, 9 ;1269
900,12, 0,0, 5 ;1274
900,13, 0,0, 4 ;1278
900,14, 0,0, 4 ;1282
900,15, 0,0, 4 ;1286
900,16, 0,0, 4 ;1290
900,17, 0,0, 75 ;1365
900,18, 0,0, 1 ;1366 (count 0 end)
]])
--black background for 1 frame
animAddPos(contTimer, -53, 0)

--Game Over Animation
gameOver = animNew(sprIkemen, [[
910,0, 0,0, 1 ;1367 (1) (gameover start)
910,1, 0,0, 1 ;1368 (2)
910,2, 0,0, 1 ;1369 (3)
910,3, 0,0, 1 ;1370 (4)
910,4, 0,0, 1 ;1371 (5)
910,5, 0,0, 1 ;1372 (6)
910,6, 0,0, 1 ;1373 (7)
910,7, 0,0, 1 ;1374 (8)
910,8, 0,0, 1 ;1375 (9)
910,9, 0,0, 1 ;1376 (10)
910,10, 0,0, 1 ;1377 (11)
910,11, 0,0, 1 ;1378 (12)
910,12, 0,0, 1 ;1379 (13)
910,13, 0,0, 1 ;1380 (14)
910,14, 0,0, 1 ;1381 (15)
910,15, 0,0, 1 ;1382 (16)
910,16, 0,0, 1 ;1383 (17)
910,17, 0,0, 1 ;1384 (18)
910,18, 0,0, 1 ;1385 (19)
910,19, 0,0, 1 ;1386 (20)
910,20, 0,0, 1 ;1387 (21)
910,21, 0,0, 1 ;1388 (22)
910,22, 0,0, 1 ;1389 (23)
910,23, 0,0, 1 ;1390 (24)
910,24, 0,0, 1 ;1391 (25)
910,25, 0,0, 1 ;1392 (26)
910,26, 0,0, 1 ;1393 (27)
910,27, 0,0, 1 ;1394 (28)
910,28, 0,0, 1 ;1395 (29)
910,29, 0,0, 1 ;1396 (30)
910,30, 0,0, 1 ;1397 (31)
910,31, 0,0, 1 ;1398 (32)
910,32, 0,0, 1 ;1399 (33)
910,33, 0,0, 1 ;1400 (34)
910,34, 0,0, 1 ;1401 (35)
910,35, 0,0, 1 ;1402 (36)
910,36, 0,0, 1 ;1403 (37)
910,37, 0,0, 1 ;1404 (38)
910,38, 0,0, 1 ;1405 (39)
910,39, 0,0, 1 ;1406 (40)
910,40, 0,0, 1 ;1407 (41)
910,41, 0,0, 1 ;1408 (42)
910,42, 0,0, 1 ;1409 (43)
910,43, 0,0, 1 ;1410 (44)
910,44, 0,0, 1 ;1411 (45)
910,45, 0,0, 1 ;1412 (46)
910,46, 0,0, 1 ;1413 (47)
910,47, 0,0, 1 ;1414 (48)
910,48, 0,0, 1 ;1415 (49)
910,49, 0,0, 1 ;1416 (50)
910,50, 0,0, 1 ;1417 (51)
910,51, 0,0, 1 ;1418 (52)
910,52, 0,0, 1 ;1419 (53)
910,53, 0,0, 1 ;1420 (54)
910,54, 0,0, 1 ;1421 (55)
910,55, 0,0, 1 ;1422 (56)
910,56, 0,0, 1 ;1423 (57)
910,57, 0,0, 1 ;1424 (58)
910,58, 0,0, 1 ;1425 (59)
910,59, 0,0, 1 ;1426 (60)
910,60, 0,0, 1 ;1427 (61)
910,61, 0,0, 1 ;1428 (62)
910,62, 0,0, 1 ;1429 (63)
910,63, 0,0, 1 ;1430 (64)
910,64, 0,0, 1 ;1431 (65)
910,65, 0,0, 1 ;1432 (66)
910,66, 0,0, 1 ;1433 (67)
910,67, 0,0, 1 ;1434 (68)
910,68, 0,0, 1 ;1435 (69)
910,69, 0,0, 1 ;1436 (70)
910,70, 0,0, 1 ;1437 (71)
910,71, 0,0, 1 ;1438 (72)
910,72, 0,0, 1 ;1439 (73)
910,73, 0,0, 1 ;1440 (74)
910,74, 0,0, 1 ;1441 (75)
910,75, 0,0, 1 ;1442 (76)
910,76, 0,0, 1 ;1443 (77)
910,77, 0,0, 1 ;1444 (78)
910,78, 0,0, 1 ;1445 (79)
910,79, 0,0, 1 ;1446 (80)
910,80, 0,0, 1 ;1447 (81)
910,81, 0,0, 1 ;1448 (82)
910,82, 0,0, 1 ;1449 (83)
910,83, 0,0, 1 ;1450 (84)
910,84, 0,0, 1 ;1451 (85)
910,85, 0,0, 1 ;1452 (86)
910,86, 0,0, 1 ;1453 (87)
910,87, 0,0, 1 ;1454 (88)
910,88, 0,0, 1 ;1455 (89)
910,89, 0,0, 1 ;1456 (90)
910,90, 0,0, 1 ;1457 (91)
910,91, 0,0, 1 ;1458 (92)
910,92, 0,0, 1 ;1459 (93)
910,93, 0,0, 1 ;1460 (94)
910,94, 0,0, 1 ;1461 (95)
910,95, 0,0, 1 ;1462 (96)
910,96, 0,0, 1 ;1463 (97)
910,97, 0,0, 1 ;1464 (98)
910,98, 0,0, 1 ;1465 (99)
910,99, 0,0, 1 ;1466 (100)
910,100, 0,0, 1 ;1467 (101)
910,101, 0,0, 1 ;1468 (102)
910,102, 0,0, 1 ;1469 (103)
910,103, 0,0, 1 ;1470 (104)
910,104, 0,0, 1 ;1471 (105)
910,105, 0,0, 1 ;1472 (106)
910,106, 0,0, 1 ;1473 (107)
910,107, 0,0, 119 ;1592 (226)
910,107, 0,0, -1 ;1593+
]])
--black background for 24 frames
animAddPos(gameOver, -53, 0)

--;=================================================================================================
--; TOWER DESTINY SCREENPACK DEFINITION
--;=================================================================================================
txt_towerSelect = createTextImg(fontMK2, 0, 0, "CHOOSE YOUR DESTINY", 159, 13, 0.5, 0.5)
txt_destinyTime = createTextImg(jgFnt, 0, 0, "", 160, 28)

--Destiny Select BG
destinyBG = animNew(sprIkemen, [[
40,0, 0,0, -1
]])
animAddPos(destinyBG, -55, 0)
animSetScale(destinyBG, 1.1, 1)
animUpdate(destinyBG)

--Destiny Cursor
destinyCursor = animNew(sprIkemen, [[
42,0, 0,0, 3
42,1, 0,0, 3
42,2, 0,0, 3
42,3, 0,0, 3
42,4, 0,0, 3
42,5, 0,0, 3
42,6, 0,0, 3
42,7, 0,0, 3
42,8, 0,0, 3
42,9, 0,0, 3
42,10, 0,0, 3
42,11, 0,0, 3
42,12, 0,0, 3
42,13, 0,0, 3
42,14, 0,0, 3
42,15, 0,0, 3
42,16, 0,0, 3
42,17, 0,0, 3
42,18, 0,0, 3
42,19, 0,0, 3
42,20, 0,0, 3
42,21, 0,0, 3
42,22, 0,0, 3
42,23, 0,0, 3
]])
animSetScale(destinyCursor, 0.135, 0.135)
animSetAlpha(destinyCursor, 188, 0)
animUpdate(destinyCursor)

--Tower Slot
towerSlot = animNew(sprIkemen, [[
43,0, 0,0, -1
]])
animSetScale(towerSlot, 0.5, 0.5)
animUpdate(towerSlot)

--Tower Stage Preview (Random Icon)
towerStgPreview = animNew(sprIkemen, [[
111,0, 0,0, -1
]])
animSetScale(towerStgPreview, 0.79, 0.50)
animUpdate(towerStgPreview)

--Menu Arrows
function f_resetTowerArrowsPos()
animSetPos(menuArrowLeft, 0, 200)
animSetPos(menuArrowRight, 310, 200)
end

--Tower Input Hints Panel
function drawTowerInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;=================================================================================================
--; TOWER BATTLE PLAN SCREENPACK DEFINITION
--;=================================================================================================
--Final Destiny BG
destinyFinalBG = animNew(sprIkemen, [[
40,1, 0,0, -1
]])
animAddPos(destinyFinalBG, 0, 0)
animSetScale(destinyFinalBG, 1.1, 1)
animUpdate(destinyFinalBG)

--Tower Slot
battleSlot = animNew(sprIkemen, [[
43,1, 0,0, -1
]])
animSetScale(battleSlot, 1.3, 1.3)
animUpdate(battleSlot)

--VS Preview
vsPreview = animNew(sprIkemen, [[
44,1, 0,0, -1
]])
animAddPos(vsPreview, 138, 113)
animSetScale(vsPreview, 0.75, 0.75)
animUpdate(vsPreview)

--Stage Preview (Random Icon)
battleStgPreview = animNew(sprIkemen, [[
111,0, 0,0, -1
]])
animSetScale(battleStgPreview, 1.53, 1.34)
animUpdate(battleStgPreview)

--;===========================================================
--; TOURNAMENT SETTINGS SCREENPACK DEFINITION
--;===========================================================
txt_tourneyCfg = createTextImg(jgFnt, 0, 0, "TOURNAMENT RULES", 159, 13)

t_tourneyCfg = {
	{text = "Max Participants",	     varText = data.tourneySize},
	--{text = "Format",				 varText = data.tourneyType},
	--{text = "Team Mode",		     varText = data.tourneyTeam},
	{text = "Character Select",		 varText = data.tourneyCharSel},
	{text = "Stage Select",			 varText = data.tourneyStgSel},
	{text = "Time Limit",         	 varText = data.tourneyRoundTime},
	{text = "Rounds to Win",      	 varText = data.tourneyRoundsNum},
	{text = "Matchs to Win",         varText = data.tourneyMatchsNum},
	--{text = "3rd Place Match",     varText = data.tourney3rdPlace},
	{text = "CREATE TOURNAMENT", 	 varText = ""},
}
for i=1, #t_tourneyCfg do
	t_tourneyCfg[i]['varID'] = textImgNew()
end

--Input Hints Panel
function drawTourneyInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints(
		"u","30,"..inputHintYPos,"d","50,"..inputHintYPos,"l","70,"..inputHintYPos,"r","90,"..inputHintYPos,
		"s","150,"..inputHintYPos,"e","215,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 111, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 236, hintFontYPos)
end

--4 Players Grid
tourney4 = animNew(sprIkemen, [[
50,1, 0,0, -1
]])

--8 Players Grid
tourney8 = animNew(sprIkemen, [[
50,2, 0,0, -1
]])

--16 Players Grid
tourney16 = animNew(sprIkemen, [[
50,3, 0,0, -1
]])

--;===========================================================
--; TOURNAMENT MENU SCREENPACK DEFINITION
--;===========================================================
txt_tourneyType = createTextImg(jgFnt, 0, 0, "", 159, 12)
txt_tourneyState = createTextImg(jgFnt, 5, 0, "", 159, 24)
txt_tourneyBracket = createTextImg(jgFnt, 2, 0, "", 159, 222)
txt_tourneyTitle = createTextImg(jgFnt, 0, 0, "TOURNAMENT MODE", 159, 235)
txt_tourneyType1 = "SINGLE-ELIMINATION"
txt_tourneyType2 = "DOUBLE-ELIMINATION"
txt_tourneyWinners = "WINNERS BRACKET"
txt_tourneyLosers = "LOSERS BRACKET"
txt_tourneyR128 = "64TH-FINALS"
txt_tourneyR64 = "32ND-FINALS"
txt_tourneyR32 = "16TH-FINALS"
txt_tourneyR16 = "8TH-FINALS"
txt_tourneyR8 = "QUARTERFINALS"
txt_tourneyR4 = "SEMIFINALS"
txt_tourneyR2 = "GRAND FINAL"

function f_addTourneySlots()
	t_tourneyMenu = {
		Group = {
			[1] = {
				Round = {
					[1] = {}
				}
			},
			[2] = {
				Round = {
					[1] ={}
				}
			}
		}
	}
	for i=1, data.tourneySize/2 do --Insert the amount of items using data.tourneySize as reference to t_tourneyMenu table
		t_tourneyMenu.Group[1].Round[1][i] = {}
		t_tourneyMenu.Group[1].Round[1][i]['CharID'] = "randomselect" --Store character cell ID
		t_tourneyMenu.Group[1].Round[1][i]['up'] = false --Enable character select animation
		t_tourneyMenu.Group[1].Round[1][i]['pal'] = 1 --Store Character palette
		t_tourneyMenu.Group[1].Round[1][i]['CharControl'] = "CPU" --Who have control of character (CPU or HUMAN)
		t_tourneyMenu.Group[1].Round[1][i]['AIlevel'] = i --Store AI Level (1,2,3..8)
		t_tourneyMenu.Group[1].Round[1][i]['Player'] = 0 --What Human Player have control of character (0=CPU, 1=P1, 2=P2)
		t_tourneyMenu.Group[1].Round[1][i]['Loser'] = false --If is true this character will go to losers bracket in a double elimination tourney
		t_tourneyMenu.Group[1].Round[1][i]['Active'] = true --Identify if this character continue participating or was defeated
	end
	for i=1, data.tourneySize/2 do
		t_tourneyMenu.Group[2].Round[1][i] = {}
		t_tourneyMenu.Group[2].Round[1][i]['CharID'] = "randomselect"
		t_tourneyMenu.Group[2].Round[1][i]['up'] = false
		t_tourneyMenu.Group[2].Round[1][i]['pal'] = 1
		t_tourneyMenu.Group[2].Round[1][i]['CharControl'] = "CPU"
		t_tourneyMenu.Group[2].Round[1][i]['AIlevel'] = i
		t_tourneyMenu.Group[2].Round[1][i]['Player'] = 0
		t_tourneyMenu.Group[2].Round[1][i]['Loser'] = false
		t_tourneyMenu.Group[2].Round[1][i]['Active'] = true
	end
	if data.debugLog then f_printTable(t_tourneyMenu, "save/debug/t_tourneyMenu.log") end
end

--P1 active cursor
tourneyP1Cursor = animNew(sprIkemen, [[
51,1, 0,0, -1
]])

--P2 active cursor
tourneyP2Cursor = animNew(sprIkemen, [[
52,1, 0,0, -1
]])

--Player 1 Control
tourneyP1 = animNew(sprIkemen, [[
53,1, 0,0, -1
]])

--Player 2 Control
tourneyP2 = animNew(sprIkemen, [[
53,2, 0,0, -1
]])

--CPU Level 1
tourneyAI1 = animNew(sprIkemen, [[
54,1, 0,0, -1
]])

--CPU Level 2
tourneyAI2 = animNew(sprIkemen, [[
54,2, 0,0, -1
]])

--CPU Level 3
tourneyAI3 = animNew(sprIkemen, [[
54,3, 0,0, -1
]])

--CPU Level 4
tourneyAI4 = animNew(sprIkemen, [[
54,4, 0,0, -1
]])

--CPU Level 5
tourneyAI5 = animNew(sprIkemen, [[
54,5, 0,0, -1
]])

--CPU Level 6
tourneyAI6 = animNew(sprIkemen, [[
54,6, 0,0, -1
]])

--CPU Level 7
tourneyAI7 = animNew(sprIkemen, [[
54,7, 0,0, -1
]])

--CPU Level 8
tourneyAI8 = animNew(sprIkemen, [[
54,8, 0,0, -1
]])

--Random Icon
tourneyRandomIcon = animNew(sprIkemen, [[
55,0, 0,0, -1
]])

--Input Hints BG
tourneyInputsBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(tourneyInputsBG, 2.9, 0.75)
animSetAlpha(tourneyInputsBG, 155, 22)

--Tournament Not Started Input Hints Panel
function drawTourneyInputHints2()
	local inputHintYPosUp = 199
	local inputHintYPosDown = 220
	local hintFont = font2
	local hintFontYPosUp = 212
	local hintFontYPosDown = 234
	animPosDraw(tourneyInputsBG, -56, 198) --Draw Input Hints BG
	drawMenuInputHints(
		"w","25,"..inputHintYPosUp,"s","110,"..inputHintYPosUp,"e","185,"..inputHintYPosUp,"q","250,"..inputHintYPosUp,
		"u","5,"..inputHintYPosDown,"d","25,"..inputHintYPosDown,"l","45,"..inputHintYPosDown,"r","65,"..inputHintYPosDown,
		"a","125,"..inputHintYPosDown,"b","145,"..inputHintYPosDown,"c","165,"..inputHintYPosDown,"x","185,"..inputHintYPosDown,
		"y","205,"..inputHintYPosDown,"z","225,"..inputHintYPosDown
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Set Control", 46, hintFontYPosUp)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Edit Slot", 131, hintFontYPosUp)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPosUp)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Hide", 271, hintFontYPosUp)
	--
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 86, hintFontYPosDown)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start Tourney", 246, hintFontYPosDown)
end

--Tournament Started Input Hints Panel
function drawTourneyInputHints3()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(tourneyInputsBG, -56, 219) --Draw Input Hints BG
	drawMenuInputHints("s","40,"..inputHintYPos,"e","162,"..inputHintYPos,"q","223,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start Next Match", 61, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Exit", 183, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Hide", 244, hintFontYPos)
end

--;===========================================================
--; TOURNAMENT CHAMPION SCREENPACK DEFINITION
--;===========================================================
txt_tourneyChampionTitle = createTextImg(font21, 0, 0, "CONGRATULATIONS!", 159, 18) 
txt_tourneyPlace1 = createTextImg(font13, 0, 0, "", 163, 157, 0.65, 0.65)
txt_tourneyPlace2 = createTextImg(font13, 0, 0, "", 62, 182, 0.65, 0.65)
txt_tourneyPlace3 = createTextImg(font13, 0, 0, "", 261, 201, 0.65, 0.65)

--Awards Assets
tourneyAwards = animNew(sprIkemen, [[
56,0, 0,0, -1
]])
animAddPos(tourneyAwards, 0, 0)
animUpdate(tourneyAwards)

--;===========================================================
--; ABYSS SELECT MENU SCREENPACK DEFINITION
--;===========================================================
txt_abyssSel = createTextImg(font11, 0, 0, "ABYSS SELECT", 159, 30, 1.2, 1.2)
txt_abyssLv = createTextImg(font20, 2, 0, "", 0, 0)
txt_abyssDepth = createTextImg(font20, 1, 0, "DEPTH", 0, 0)
txt_abyssContinue = createTextImg(font6, 0, 0, "CONTINUE", 159, 165)
txt_abyssContinueInfo = "Begin the game from where you last left off."
txt_abyssLvInfo = createTextImg(font5, 0, 0, "", 159, 200)

abyssCheckpointNo = 100 --Each 100 Depths you will reach a checkpoint (Back to Abyss Map to choose "continue" or "stop exploring")
abyssBossMatchNo = 20 --Each 20 match a boss will appear
abyssBossStatsIncrease = 5 --How much will the Abyss CPU Stats values (cpustats) ​​increase when facing a normal boss

t_abyssSel = { --TODO: Generate this via .def file format for end-user comfortable customization
	{depth = 100, cpustats = 0, ailevel = 1, info = "[Easy] difficulty geared towards beginners",
		specialboss = {
		--Boss 1
			{
				char = "Kung Fu Man/Evil/Evil Kung Fu Man.def", --Special Boss Character Path (Need to be loaded in select.def) if it is empty a random char will be loaded
				stage = "stages/Mountainside Temple/Lobby Night.def", --Stage Path (Need to be loaded in select.def) if it is empty an auto stage will be loaded
				--music = "sound/boss.mp3", --Song Path (if it is empty an auto song will be loaded)
				depth = 100, --At what depth/matchNo will the special boss appear
				stats = 5, --Special Boss stats (life, power, attack, defence)
				pal = 1, --Palette
				ailevel = 8, --CPU Level
				itemslot = {[1] = "Power Drain", [2] = "", [3] = "", [4] = ""} --Special Items
			},
		},
	},
	{depth = 500, cpustats = 5, ailevel = 3, info = "[Normal] difficulty for average players",
		specialboss = {
		--Boss 1
			{
				char = "Kung Fu Man/Master/Master Kung Fu Man.def",
				stage = "stages/Mountainside Temple/Lobby Night.def",
				depth = 200,
				stats = 10,
				pal = 1,
				ailevel = 8
			},
		--Boss 2
			{
				char = "Suave Dude",
				stage = "stages/Mountainside Temple/Outside.def",
				music = "sound/Death Corridor.mp3",
				depth = 400,
				stats = 15,
				pal = 1,
				ailevel = 8
			},
		--Boss 3
			{
				char = "Kung Fu Girl/Master/Master Kung Fu Girl.def",
				stage = "stages/Mountainside Temple/Temple Entrance Night.def",
				--music = "sound/",
				depth = 500,
				stats = 20,
				pal = 1,
				ailevel = 8
			},
		},
	},
	{depth = 999, cpustats = 10, ailevel = 6, info = "[Hard] difficulty for expert players",
		specialboss = {
		--Boss 1
			{
				char = "Kung Fu Man/Evil/Evil Kung Fu Man.def",
				stage = "stages/Mountainside Temple/Lobby Night.def",
				music = "sound/Killer Mirror.mp3",
				depth = 40,
				stats = 15,
				pal = 1,
				ailevel = 8
			},
		--Boss 2
			{
				char = "Kung Fu Man/Master/Master Kung Fu Man.def",
				stage = "stages/Mountainside Temple/Outside.def",
				depth = 200,
				stats = 20,
				pal = 1,
				ailevel = 8
			},
		--Boss 3
			{
				char = "Kung Fu Girl/Master/Master Kung Fu Girl.def",
				stage = "stages/Mountainside Temple/Temple Entrance Night.def",
				depth = 400,
				stats = 25,
				pal = 7,
				ailevel = 8
			},
		--Boss 4
			{
				char = "Shin Gouki",
				stage = "stages/Mountainside Temple/Hidden Path Night.def",
				music = "sound/God Hands.mp3",
				depth = 700,
				stats = 30,
				pal = 1,
				ailevel = 8
			},
		--Boss 5
			{
				char = "Red Dragon",
				--stage = "stages/",
				--music = "sound/",
				depth = 999,
				stats = 35,
				pal = 1,
				ailevel = 8
			},
		},
	},
	{depth = -1, cpustats = 15, ailevel = 8, info = "[Infinite] difficulty for insane players"},
	{depth = 20000, cpustats = 20, info = "[TEST] difficulty for ??? players"},
}
for i=1, #t_abyssSel do
	t_abyssSel[i]['id'] = textImgNew()
end
if data.debugLog then f_printTable(t_abyssSel, "save/debug/t_abyssSel.log") end

--Background
abyssBG = animNew(sprIkemen, [[
60,0, 0,0, -1
]])
animSetScale(abyssBG, 0.40, 0.60)
animSetPos(abyssBG, -400,-475)
animUpdate(abyssBG)

--BG Fog
abyssFog = animNew(sprSys, [[
100,1, 0,0, -1
]])
animSetTile(abyssFog, 1, 1)
animSetAlpha(abyssFog, 50,255)

--Info BG
abyssSelInfoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetScale(abyssSelInfoBG, 430, 24)
animSetAlpha(abyssSelInfoBG, 0, 50)
animUpdate(abyssSelInfoBG)

--Info Window BG
abyssSelWindowBG = animNew(sprIkemen, [[
230,2, 0,0, -1
]])
animSetScale(abyssSelWindowBG, 0.8, 1.4)
animUpdate(abyssSelWindowBG)

--Continue Window BG
abyssContBG = animNew(sprIkemen, [[
230,2, 0,0, -1
]])
animSetScale(abyssContBG, 0.95, 0.40)
animUpdate(abyssContBG)

--Menu Arrows
function f_resetAbyssArrowsPos()
animSetPos(menuArrowLeft, 0, 90)
animSetPos(menuArrowRight, 312, 90)
end

function drawAbyssSelInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints(
		"u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,
		"s","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Drop Skills", 266, hintFontYPos)
end

--;===========================================================
--; ABYSS SAVE/LOAD MENU SCREENPACK DEFINITION
--;===========================================================
txt_abyssDatTitle = createTextImg(font11, 0, 0, "", 159, 15, 1.2, 1.2)

--Data Slot
abyssDatSlot = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetScale(abyssDatSlot, 2.12, 1.40)
animUpdate(abyssDatSlot)

--Data Slot Cursor
abyssDatSlotCursor = animNew(sprIkemen, [[
231,1, 0,0, -1
]])
animSetScale(abyssDatSlotCursor, 2.12, 1.40)
animUpdate(abyssDatSlotCursor)

--Special Item Sprite
abyssSpecialItem = animNew(sprIkemen, [[
62,4, 0,0, -1
]])
animSetScale(abyssSpecialItem, 0.5, 0.5)
animUpdate(abyssSpecialItem)

function f_abyssDatProfile(posX, posY, itemNo, data)
	local NewPosX = posX or 0
	local NewPosY = posY or 0
	local itemNo = itemNo
	local saveDat = data or false
	animPosDraw(abyssDatSlot, 0 + NewPosX, 40 + NewPosY)
	f_drawQuickText(txt_abyssDatNo, font11, 0, 1, "DATA "..itemNo, 10 + NewPosX, 37 + NewPosY, 1.2, 1.2)
	if not saveDat.player then --No Data Saved
		f_drawQuickText(txt_abyssNoDat, font11, 0, 0, "NO DATA", 159 + NewPosX, 90 + NewPosY, 1.2, 1.2)
	else --Show Data Saved
		--local pLevel = math.floor((abyssDat.nosave.attack + abyssDat.nosave.power + abyssDat.nosave.defence + abyssDat.nosave.life) / 4) --Just an Average
		drawPortrait(saveDat.player[1].cel, 6 + NewPosX, 47 + NewPosY, 0.515, 0.517)
		animPosDraw(abyssProfileAtributes, 207 + NewPosX, 47 + NewPosY)
	--Stats
		local stsFont = font2
		local stsFontXPos = 70 + NewPosX
		local stsFontYPos = 56 + NewPosY
		f_drawQuickText(txt_abyssDatName, stsFont, 0, 1, saveDat.player[1].displayname, stsFontXPos, stsFontYPos)
		f_drawQuickText(txt_abyssDatDepth, stsFont, 0, 1, "PLAYER DEPTH: "..saveDat.depth, stsFontXPos, stsFontYPos + 20)
		f_drawQuickText(txt_abyssDatDiff, stsFont, 0, 1, "ABYSS DEPTH: "..t_abyssSel[saveDat.abysslv].depth, stsFontXPos, stsFontYPos + 40)
		f_drawQuickText(txt_abyssDatReward, stsFont, 0, 1, "REWARD: "..saveDat.reward.." IKC", stsFontXPos, stsFontYPos + 60)
	--Attributes
		local attrFont = font2
		local attrFontXPos = 225 + NewPosX
		local attrFontYPos = 58 + NewPosY
		local attrSymb = "+"
		local attrMax = "MAX"
		f_drawQuickText(txt_abyssDatAttack, attrFont, 0, 1, attrSymb..saveDat.attack, attrFontXPos, attrFontYPos)
		f_drawQuickText(txt_abyssDatPower, attrFont, 0, 1, attrSymb..saveDat.power, attrFontXPos, attrFontYPos + 18)
		f_drawQuickText(txt_abyssDatDefence, attrFont, 0, 1, attrSymb..saveDat.defence, attrFontXPos + 62, attrFontYPos)
		f_drawQuickText(txt_abyssDatLife, attrFont, 0, 1, attrSymb..saveDat.life, attrFontXPos + 62, attrFontYPos + 18)
	--Special Items
		local spFont = font2
		local spFontXPos = 310 + NewPosX
		local spFontYPos = 88 + NewPosY
		f_drawQuickText(txt_abyssDatSP1, spFont, 0, -1, saveDat.itemslot[1], spFontXPos, spFontYPos)
		f_drawQuickText(txt_abyssDatSP2, spFont, 0, -1, saveDat.itemslot[2], spFontXPos, spFontYPos + 10)
		f_drawQuickText(txt_abyssDatSP3, spFont, 0, -1, saveDat.itemslot[3], spFontXPos, spFontYPos + 20)
		f_drawQuickText(txt_abyssDatSP4, spFont, 0, -1, saveDat.itemslot[4], spFontXPos, spFontYPos + 30)
	end
end

--Menu Arrows
function f_resetAbyssDatArrowsPos()
animSetPos(menuArrowUp, 305, 14)
animSetPos(menuArrowDown, 305, 220)
end

function drawAbyssDatInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","30,"..inputHintYPos,"d","50,"..inputHintYPos,"s","108,"..inputHintYPos,"e","171,"..inputHintYPos,"q","229,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 71, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 129, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Cancel", 192, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Delete", 250, hintFontYPos)
end

--;===========================================================
--; ABYSS MAIN MENU SCREENPACK DEFINITION
--;===========================================================
txt_abyssMain = createTextImg(font11, 0, 0, "", 80, 18, 1.2, 1.2)
txt_abyssShopItemLock = "???"
txt_abyssShopInfoLock = "This item has yet to be discovered"
txt_abyssShopItemSold = "Sold Out"
txt_abyssShopInfoSold = "This item has already been obtained"

--Special Items Common Name Text (This names are used in match.lua)
txt_abyssShopLifeRegeneration = "Regeneration Lv."
txt_abyssShopLifeRestore = "Victory Rush Lv."
txt_abyssShopPowerRegeneration = "Burning Soul Lv."
txt_abyssShopPoison = "Poison Lv."
txt_abyssShopCurse = "Cursed Touch Lv."
txt_abyssShopDepthSpeed = "Maze Walker"
txt_abyssShopAutoguard = "Autoguard"
txt_abyssShopDamageX2 = "Revenger"
txt_abyssShopNoPowerCPU = "Power Drain"
txt_abyssShopNoGuardCPU = "Guard Destroy"
txt_abyssShopGuardInfinite = "Infinite Guard"
txt_abyssShopNoDizzy = "Hard Body"
txt_abyssShopPowerMax = "Start Heat Up"
txt_abyssShopTimeStats = "Slow Starter"
txt_abyssShopDepthStats = "Heart of the Hero"
txt_abyssShopRewardUp = "Trader"
txt_abyssShopTimeControl = "Time Lord"
txt_abyssShopMirror = "Glass Mirror"

--Common Item Prices
txt_abyssShopItemPrice1 = 250
txt_abyssShopItemPrice2 = txt_abyssShopItemPrice1 * 2
txt_abyssShopItemPrice3 = txt_abyssShopItemPrice1 * 3
txt_abyssShopItemPriceMax = txt_abyssShopItemPrice1 * 4

t_abyssMenu = {
 {id = textImgNew(), text = "Item Shop", 		info = "Purchase items"},
 {id = textImgNew(), text = "Begin the Game", 	info = "Enter the Abyss"},
}

--Special Items without Levels
local t_nolvItems = {
 {showfromdepth = 0, text = txt_abyssShopDepthSpeed, price = 3000, info = "Increases the rate of descent into the Abyss.", unlock = "true"},
 {showfromdepth = 0, text = txt_abyssShopTimeControl, price = 2400, info = "Shortens the time of a round.", unlock = "true"},
 {showfromdepth = 0, text = txt_abyssShopDamageX2, price = 4200, info = "When remaining HP is low, Player damage output is multiplied by 2.", unlock = "true"},
 {showfromdepth = 0, text = txt_abyssShopAutoguard, price = 2500, info = "Guard attacks automatically.", unlock = "true"},
 --{showfromdepth = 0, text = txt_abyssShopGuardInfinite, price = 3000, info = "Guard Gauge becomes infinite.", unlock = "true"},
 {showfromdepth = 0, text = txt_abyssShopPowerMax, price = 4500, info = "Upon entering battle, the Power Gauge will be maxed out.", unlock = "true"},
 {showfromdepth = 0, text = txt_abyssShopNoPowerCPU, price = 6400, info = "Enemy Power Gauge will deplete automatically.", unlock = "true"},
 --{showfromdepth = 0, text = txt_abyssShopNoGuardCPU, price = 5500, info = "Enemy Guard Gauge will deplete automatically.", unlock = "true"},
 --{showfromdepth = 0, text = txt_abyssShopNoDizzy, price = 3500, info = "Your character cannot be dizzied, and guard damage is reduced.", unlock = "true"},
 {showfromdepth = 0, text = txt_abyssShopTimeStats, price = 2000, info = "Increases you character stats when the remaining time is low.", unlock = "true"},
 --{showfromdepth = 0, text = txt_abyssShopRewardUp, price = 5000, info = "All basic stats will return to their default values.IKC earned will double.", unlock = "true"},
 --{showfromdepth = 0, text = txt_abyssShopDepthStats, price = 10000, info = "Increases your character stats as the depth increases.", unlock = "true"},
 --{showfromdepth = 0, text = txt_abyssShopMirror, price = 8200, info = "Makes your items and stats the same as your opponent.", unlock = "true"},
}

--Special Items with Levels
local t_regenHPItems = {
 {showfromdepth = 0, price = 1000, lvinfo = "", unlock = "true"},
 {showfromdepth = 0, price = 4000, lvinfo = " (Quicker than Lv.1)", unlock = "true"},
 {showfromdepth = 0, price = 7000, lvinfo = " (Quicker than Lv.2)", unlock = "true"},
}
for i=1, #t_regenHPItems do
	local lv = i
	if i == #t_regenHPItems then lv = "MAX" end --How will be named the last level for a item
	--t_regenHPItems[i].life = true
	t_regenHPItems[i].text = txt_abyssShopLifeRegeneration..lv
	t_regenHPItems[i].info = "Gradually regenerates Life over time."..t_regenHPItems[i].lvinfo
end
--====================================================================================================
local t_poisonItems = {
 {showfromdepth = 0, price = 2000, lvinfo = "short", unlock = "true"},
 {showfromdepth = 0, price = 5000, lvinfo = "medium", unlock = "true"},
 {showfromdepth = 0, price = 8000, lvinfo = "long", unlock = "true"},
}
for i=1, #t_poisonItems do
	local lv = i
	if i == #t_poisonItems then lv = "MAX" end
	--t_poisonItems[i].life = true
	t_poisonItems[i].text = txt_abyssShopPoison..lv
	t_poisonItems[i].info = "Landing an attack on the opponent will poison him for a "..t_poisonItems[i].lvinfo.." time."
end
--====================================================================================================
local t_restoreHPItems = {
 {showfromdepth = 0, price = 1500, lvinfo = "small", unlock = "true"},
 {showfromdepth = 0, price = 4500, lvinfo = "medium", unlock = "true"},
 {showfromdepth = 0, price = 8000, lvinfo = "large", unlock = "true"},
}
for i=1, #t_restoreHPItems do
	local lv = i
	if i == #t_restoreHPItems then lv = "MAX" end
	--t_restoreHPItems[i].life = true
	t_restoreHPItems[i].text = txt_abyssShopLifeRestore..lv
	t_restoreHPItems[i].info = "Regenerates a "..t_restoreHPItems[i].lvinfo.." amount of Life after the match has been won."
end
--====================================================================================================
local t_curseItems = {
 {showfromdepth = 0, price = 6660, lvinfo = "Half", unlock = "true"},
 {showfromdepth = 0, price = 9990, lvinfo = "All", unlock = "true"},
}
for i=1, #t_curseItems do
	local lv = i
	if i == #t_curseItems then lv = "MAX" end
	--t_curseItems[i].life = true
	t_curseItems[i].text = txt_abyssShopCurse..lv
	t_curseItems[i].info = t_curseItems[i].lvinfo.." of the damage you take, your opponent will take."
end
--====================================================================================================
local t_regenPowItems = {
 {showfromdepth = 0, price = 1000, lvinfo = "", unlock = "true"},
 {showfromdepth = 0, price = 4000, lvinfo = " (Quicker than Lv.1)", unlock = "true"},
 {showfromdepth = 0, price = 7000, lvinfo = " (Quicker than Lv.2)", unlock = "true"},
}
for i=1, #t_regenPowItems do
	local lv = i
	if i == #t_regenPowItems then lv = "MAX" end
	--t_regenPowItems[i].life = true
	t_regenPowItems[i].text = txt_abyssShopPowerRegeneration..lv
	t_regenPowItems[i].info = "Gradually regenerates Power over time."..t_regenPowItems[i].lvinfo
end
--====================================================================================================
t_abyssSpecialItems = {"delete"} --Create All Special Items Table
local function f_addAbyssSPItems(t)
	for i=1, #t do --Send all Items from "t" table to t_abyssSpecialItems
		table.insert(t_abyssSpecialItems, #t_abyssSpecialItems, t[i])
	end
end
--Add Special Items in the following order:
f_addAbyssSPItems(t_regenHPItems)
f_addAbyssSPItems(t_poisonItems)
f_addAbyssSPItems(t_restoreHPItems)
f_addAbyssSPItems(t_curseItems)
f_addAbyssSPItems(t_regenPowItems)
f_addAbyssSPItems(t_nolvItems)
--When all items are ready:
table.remove(t_abyssSpecialItems, t_abyssSpecialItems.delete) --Remove first item ("delete") generate as placeholder to use f_addAbyssSPItems
if data.debugLog then f_printTable(t_abyssSpecialItems, "save/debug/t_abyssSpecialItems.log") end
--====================================================================================================
--Life Items
t_abyssLife = {
 {val = 1,  showfromdepth = 0, 	 price = txt_abyssShopItemPrice1 - 50,   unlock = "true"},
 {val = 2,  showfromdepth = 100, price = txt_abyssShopItemPrice1 - 50,   unlock = "true"},
 {val = 3,  showfromdepth = 200, price = txt_abyssShopItemPrice1 - 50,   unlock = "true"},
 {val = 4,  showfromdepth = 300, price = txt_abyssShopItemPrice2 - 50,   unlock = "true"},
 {val = 5,  showfromdepth = 400, price = txt_abyssShopItemPrice2 - 50,   unlock = "true"},
 {val = 6,  showfromdepth = 500, price = txt_abyssShopItemPrice2 - 50,   unlock = "true"},
 {val = 7,  showfromdepth = 600, price = txt_abyssShopItemPrice3 - 50,   unlock = "true"},
 {val = 8,  showfromdepth = 700, price = txt_abyssShopItemPrice3 - 50,   unlock = "true"},
 {val = 9,  showfromdepth = 800, price = txt_abyssShopItemPrice3 - 50,   unlock = "true"},
 {val = 10, showfromdepth = 900, price = txt_abyssShopItemPriceMax - 50, unlock = "true"},
}
for i=1, #t_abyssLife do --Set common values to all table items
	t_abyssLife[i].life = true --Make this item recognizable as a life increase item
	t_abyssLife[i].text = "Life +"..t_abyssLife[i].val
	t_abyssLife[i].info = "Increases Life Level by "..t_abyssLife[i].val
end

--Power Items
t_abyssPower = {
 {val = 1,  showfromdepth = 0, 	 price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 2,  showfromdepth = 100, price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 3,  showfromdepth = 200, price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 4,  showfromdepth = 300, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 5,  showfromdepth = 400, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 6,  showfromdepth = 500, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 7,  showfromdepth = 600, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 8,  showfromdepth = 700, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 9,  showfromdepth = 800, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 10, showfromdepth = 900, price = txt_abyssShopItemPriceMax, unlock = "true"},
}
for i=1, #t_abyssPower do
	t_abyssPower[i].power = true
	t_abyssPower[i].text = "Power +"..t_abyssPower[i].val
	t_abyssPower[i].info = "Increases Power Level by "..t_abyssPower[i].val
end

--Attack Items
t_abyssAttack = {
 {val = 1,  showfromdepth = 0, 	 price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 2,  showfromdepth = 100, price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 3,  showfromdepth = 200, price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 4,  showfromdepth = 300, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 5,  showfromdepth = 400, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 6,  showfromdepth = 500, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 7,  showfromdepth = 600, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 8,  showfromdepth = 700, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 9,  showfromdepth = 800, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 10, showfromdepth = 900, price = txt_abyssShopItemPriceMax, unlock = "true"},
}
for i=1, #t_abyssAttack do
	t_abyssAttack[i].attack = true
	t_abyssAttack[i].text = "Attack +"..t_abyssAttack[i].val
	t_abyssAttack[i].info = "Increases Attack Level by "..t_abyssAttack[i].val
end

--Defence Items
t_abyssDefence = {
 {val = 1,  showfromdepth = 0, 	 price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 2,  showfromdepth = 100, price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 3,  showfromdepth = 200, price = txt_abyssShopItemPrice1,   unlock = "true"},
 {val = 4,  showfromdepth = 300, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 5,  showfromdepth = 400, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 6,  showfromdepth = 500, price = txt_abyssShopItemPrice2,   unlock = "true"},
 {val = 7,  showfromdepth = 600, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 8,  showfromdepth = 700, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 9,  showfromdepth = 800, price = txt_abyssShopItemPrice3,   unlock = "true"},
 {val = 10, showfromdepth = 900, price = txt_abyssShopItemPriceMax, unlock = "true"},
}
for i=1, #t_abyssDefence do
	t_abyssDefence[i].defence = true
	t_abyssDefence[i].text = "Defence +"..t_abyssDefence[i].val
	t_abyssDefence[i].info = "Increases Defence Level by "..t_abyssDefence[i].val
end

--Depth Descend Items
t_abyssDepth = {
 {val = 10,  showfromdepth = 0,   price = 500,  unlock = "true"},
 {val = 30,  showfromdepth = 100, price = 500,  unlock = "true"},
 {val = 50,  showfromdepth = 200, price = 1000, unlock = "true"},
 {val = 70,  showfromdepth = 300, price = 1000, unlock = "true"},
 {val = 90,  showfromdepth = 400, price = 1500, unlock = "true"},
 {val = 110, showfromdepth = 500, price = 1500, unlock = "false"},
 {val = 190, showfromdepth = 600, price = 3000, unlock = "false"},
 {val = 290, showfromdepth = 700, price = 5000, unlock = "false"},
 {val = 390, showfromdepth = 800, price = 5000, unlock = "false"},
}
for i=1, #t_abyssDepth do
	t_abyssDepth[i].depth = true
	t_abyssDepth[i].text = "Depth +"..t_abyssDepth[i].val
	t_abyssDepth[i].info = "Descend "..t_abyssDepth[i].val.." Levels from where you start."
end

t_abyssShop = {"delete"} --Create Abyss Shop Table
function f_setAbyssShop(t)
	for i=1, #t do --Send all Items from "t" table to t_abyssShop
		table.insert(t_abyssShop, #t_abyssShop, t[i])
	end
end
--Add Items to the shop in the following order
f_setAbyssShop(t_abyssAttack)
f_setAbyssShop(t_abyssDefence)
f_setAbyssShop(t_abyssPower)
f_setAbyssShop(t_abyssLife)
f_setAbyssShop(t_abyssSpecialItems)
f_setAbyssShop(t_abyssDepth)
--When all shop items are ready:
table.remove(t_abyssShop, t_abyssShop.delete) --Remove first item ("delete") generate as placeholder to use f_setAbyssShop
for i=1, #t_abyssShop do --Set ID to all final items
	t_abyssShop[i]['id'] = textImgNew()
end
if data.debugLog then f_printTable(t_abyssShop, "save/debug/t_abyssShop.log") end

function f_abyssResetShop()
	for i=1, #t_abyssShop do --Reset sold value for shop items to buy in a new game
		t_abyssShop[i]['sold'] = false
	end
	if data.debugLog then f_printTable(t_abyssShop, "save/debug/t_abyssShop.log") end
end

--Menu Options Transparent background
abyssTBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(abyssTBG, 0, 25)
animSetAlpha(abyssTBG, 20, 100)
animUpdate(abyssTBG)

--Character Profile Window BG
abyssProfileBG = animNew(sprIkemen, [[
62,1, 0,0, -1
]])
animSetScale(abyssProfileBG, 1, 1)
animUpdate(abyssProfileBG)

--Character Profile Atributes Sprites
abyssProfileAtributes = animNew(sprIkemen, [[
62,2, 0,0, -1
]])
animSetScale(abyssProfileAtributes, 0.5, 0.5)
animUpdate(abyssProfileAtributes)

function f_abyssProfile(PauseMenu, VSscreen, NewPosX, NewPosY)
	local PauseMenu = PauseMenu or false
	local VSscreen = VSscreen or false
	local NewPosX = NewPosX or 0
	local NewPosY = NewPosY or 0
	local pLevel = math.floor((getAbyssAttack() + getAbyssPower() + getAbyssDefence() + getAbyssLife()) / 4) --Just an Average
	if not VSscreen then
		animPosDraw(abyssProfileBG, 165 + NewPosX, 10 + NewPosY)
	else
		--animPosDraw(abyssProfileVSBG, 165 + NewPosX, 20 + NewPosY)
	end
	animPosDraw(abyssProfileAtributes, 190 + NewPosX, 64 + NewPosY)
--Character Stuff
	if not VSscreen then
		if not PauseMenu then drawPortrait(abyssDat.nosave.player[1].cel, 223 + NewPosX, 15 + NewPosY, 0.32, 0.32) end
		for slot=1, 4 do
			animPosDraw(abyssSpecialItem, 169 + NewPosX, 82.5 + slot * (22.6) + NewPosY)
		end
		f_drawQuickText(txt_abyssCharLv, font11, 0, -1, "LV "..pLevel + 1, 310 + NewPosX, 25 + NewPosY, 1, 1)
		f_drawQuickText(txt_abyssCharName, font14, 0, 0, abyssDat.nosave.player[1].displayname, 241 + NewPosX, 58 + NewPosY, 1, 1)
	end
--Attributes
	local attrFont = font2
	local attrFontXPos = 208 + NewPosX
	local attrFontYPos = 75 + NewPosY
	local attrSymb = "+"
	local attrMax = "MAX"
	f_drawQuickText(txt_abyssAttack, attrFont, 0, 1, attrSymb..getAbyssAttack(), attrFontXPos, attrFontYPos)
	f_drawQuickText(txt_abyssPower, attrFont, 0, 1, attrSymb..getAbyssPower(), attrFontXPos, attrFontYPos + 18)
	f_drawQuickText(txt_abyssDefence, attrFont, 0, 1, attrSymb..getAbyssDefence(), attrFontXPos + 62, attrFontYPos)
	f_drawQuickText(txt_abyssLife, attrFont, 0, 1, attrSymb..getAbyssLife(), attrFontXPos + 62, attrFontYPos + 18)
--Special Items
	local spFont = font2
	local spFontXPos = 188 + NewPosX
	local spFontYPos = 118 + NewPosY
	f_drawQuickText(txt_abyssSP1, spFont, 0, 1, abyssDat.nosave.itemslot[1], spFontXPos, spFontYPos)
	f_drawQuickText(txt_abyssSP2, spFont, 0, 1, abyssDat.nosave.itemslot[2], spFontXPos, spFontYPos + 23)
	f_drawQuickText(txt_abyssSP3, spFont, 0, 1, abyssDat.nosave.itemslot[3], spFontXPos, spFontYPos + 45)
	f_drawQuickText(txt_abyssSP4, spFont, 0, 1, abyssDat.nosave.itemslot[4], spFontXPos, spFontYPos + 68)
end

function f_abyssProfileCPU(VSscreen, NewPosX, NewPosY)
	local VSscreen = VSscreen or false
	local NewPosX = NewPosX or 0
	local NewPosY = NewPosY or 0
	local pLevel = math.ceil((p2Dat[1].attack + p2Dat[1].power + p2Dat[1].defence + p2Dat[1].life) / 4) --Just an Average with rounding up
	if not VSscreen then
		animPosDraw(abyssProfileBG, 169, 34)
		for slot=1, 4 do
			animPosDraw(abyssSpecialItem, 172, 107 + slot * (22.6))
		end
	end
	animPosDraw(abyssProfileAtributes, 194 + NewPosX, 88 + NewPosY)
--Character Stuff
	if not VSscreen then
		--drawPortrait(p2Dat[1].cel, 223, 39, 0.32, 0.32)
		f_drawQuickText(txt_abyssCharLvCPU, font11, 0, -1, "LV "..pLevel + 1, 314, 49, 1, 1)
		f_drawQuickText(txt_abyssCharNameCPU, font14, 0, 0, p2Dat[1].displayname, 245, 82, 1, 1)
	end
--Attributes
	local attrFont = font2
	local attrFontXPos = 212 + NewPosX
	local attrFontYPos = 99 + NewPosY
	local attrSymb = "+"
	local attrMax = "MAX"
	f_drawQuickText(txt_abyssAttackCPU, attrFont, 0, 1, attrSymb..p2Dat[1].attack, attrFontXPos, attrFontYPos)
	f_drawQuickText(txt_abyssPowerCPU, attrFont, 0, 1, attrSymb..p2Dat[1].power, attrFontXPos, attrFontYPos + 18)
	f_drawQuickText(txt_abyssDefenceCPU, attrFont, 0, 1, attrSymb..p2Dat[1].defence, attrFontXPos + 62, attrFontYPos)
	f_drawQuickText(txt_abyssLifeCPU, attrFont, 0, 1, attrSymb..p2Dat[1].life, attrFontXPos + 62, attrFontYPos + 18)
--Special Items
	local spFont = font2
	local spFontXPos = 191 + NewPosX
	local spFontYPos = 142 + NewPosY
	if p2Dat[1].itemslot ~= nil then
		if p2Dat[1].itemslot[1] ~= nil then f_drawQuickText(txt_abyssSP1CPU, spFont, 0, 1, p2Dat[1].itemslot[1], spFontXPos, spFontYPos) end
		if p2Dat[1].itemslot[2] ~= nil then f_drawQuickText(txt_abyssSP2CPU, spFont, 0, 1, p2Dat[1].itemslot[2], spFontXPos, spFontYPos + 23) end
		if p2Dat[1].itemslot[3] ~= nil then f_drawQuickText(txt_abyssSP3CPU, spFont, 0, 1, p2Dat[1].itemslot[3], spFontXPos, spFontYPos + 45) end
		if p2Dat[1].itemslot[4] ~= nil then f_drawQuickText(txt_abyssSP4CPU, spFont, 0, 1, p2Dat[1].itemslot[4], spFontXPos, spFontYPos + 68) end
	end
end

--Menu Arrows
function f_resetAbyss2ArrowsPos()
animSetPos(menuArrowUp, 153, 15)
animSetPos(menuArrowDown, 153, 175.5)
end

--Input Hints Panel
function drawAbyssInputHints(shop, refund)
	local shop = shop or false
	local refund = refund or false
	local btnInfo = ""
	local keyInfo = ""
	if shop then
		btnInfo = ":Buy Item"
	else
		btnInfo = ":Confirm"
	end
	if refund then keyInfo = "q" end
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints(
		"u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,
		"s","120,"..inputHintYPos,"e","190,"..inputHintYPos,keyInfo,"244,"..inputHintYPos
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, btnInfo, 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Exit", 211, hintFontYPos)
	if refund then f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Refund", 265, hintFontYPos) end
end

--;===========================================================
--; ABYSS MAP MENU SCREENPACK DEFINITION
--;===========================================================
txt_abyssMapReward = createTextImg(font20, 0, -1, "", 314, 15)
txt_abyssMapDepth = createTextImg(font20, 1, 1, "", 2, 35)
txt_abyssMapDepthLv = createTextImg(font2, 0, -1, "", 0, 0)

--Map Background
abyssMapBG = animNew(sprIkemen, [[
60,0, 0,0, -1
]])
animSetScale(abyssMapBG, 0.301, 0.288)
animUpdate(abyssMapBG)

--Reward BG
abyssMapRewardBG = animNew(sprIkemen, [[
63,0, 0,0, -1
]])
animSetPos(abyssMapRewardBG, -80, 0)
animUpdate(abyssMapRewardBG)

--Depth Path BG
abyssMapDepthBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(abyssMapDepthBG, 0.42, 4)
animSetAlpha(abyssMapDepthBG, 255, 110)
animSetPos(abyssMapDepthBG, -18, 0)
animUpdate(abyssMapDepthBG)

--Inputs Info Window BG
abyssMapInputWindowBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(abyssMapInputWindowBG, 1.18, 0.34)
animSetAlpha(abyssMapInputWindowBG, 155, 22)
animUpdate(abyssMapInputWindowBG)

function drawAbyssMapInputHints(checkpoint)
	local checkpoint = checkpoint or false
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	local exitTxT = ""
	local exitPosX = "99999"
	if checkpoint then
		exitTxT = ":Stop Exploring"
		exitPosX = "220"
	end
	animPosDraw(abyssMapInputWindowBG, 142, 219)
	drawMenuInputHints("s","148,"..inputHintYPos,"e",exitPosX..","..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Continue", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, exitTxT, 243, hintFontYPos)
end

--;===========================================================
--; ABYSS BOSS REWARDS ITEM SCREENPACK DEFINITION
--;===========================================================
txt_abyssRewardMain = createTextImg(font11, 0, 0, "ITEM SELECT", 80, 18, 1.2, 1.2)
txt_abyssRewardInfo = createTextImg(font5, 0, 0, "", 159, 200)

--Boss Special Reward Items
t_abyssSpecialReward = {
 {showfromdepth = 100, text = "Maximum HP", info = "Restore all Life."},
 {showfromdepth = 0,   text = "Half-HP", info = "Restore Half-Life"},
 --{showfromdepth = 120, text = "???", info = "???"},
}
for i=1, #t_abyssSpecialReward do
	t_abyssSpecialReward[i].exclusiveitem = true
end

--All Stats Items
t_abyssAll = {
 {val = 1,  showfromdepth = 0},
 {val = 2,  showfromdepth = 100},
 {val = 3,  showfromdepth = 200},
 {val = 4,  showfromdepth = 300},
 {val = 5,  showfromdepth = 400},
 {val = 6,  showfromdepth = 500},
 {val = 7,  showfromdepth = 600},
 {val = 8,  showfromdepth = 700},
 {val = 9,  showfromdepth = 800},
 {val = 10, showfromdepth = 900},
}
for i=1, #t_abyssAll do
	t_abyssAll[i].allstats = true
	t_abyssAll[i].text = "All +"..t_abyssAll[i].val
	t_abyssAll[i].info = "Increases All Stats Level by "..t_abyssAll[i].val
end

--Increase Reward Items
t_abyssReward = {
 {val = 500,  showfromdepth = 0},
 {val = 1000, showfromdepth = 100},
 {val = 1500, showfromdepth = 200},
 {val = 2000, showfromdepth = 300},
 {val = 2500, showfromdepth = 400},
 {val = 3000, showfromdepth = 500},
 {val = 3500, showfromdepth = 600},
 {val = 4000, showfromdepth = 700},
 {val = 4500, showfromdepth = 800},
 {val = 5000, showfromdepth = 900},
}
for i=1, #t_abyssReward do --Set common values to all table items
	t_abyssReward[i].reward = true
	t_abyssReward[i].text = "Reward +"..t_abyssReward[i].val.." IKC"
	t_abyssReward[i].info = "Add "..t_abyssReward[i].val.." IKC to your Reward."
end

function f_addAbyssBossRewards(t_items) --Add items to t_abyssBossRewards, according to Depth Level and Abyss Difficulty
	local depthNo = getAbyssDepth()
	local abyssNo = nil --t_abyssSel[?]
	local tPos = nil
	if #t_abyssBossRewards == 0 then tPos = 1 else tPos = #t_abyssBossRewards end --Just to add 1st item to avoid errors
--Filter items that meet the condition
	local t_allowedItems = {} --Create a table to store the elements that meet the condition
	for i=1, #t_items do
		if depthNo > t_items[i].showfromdepth then --and abyssNo == t_items[i].showinabyss
			table.insert(t_allowedItems, t_items[i]) --Add item in t_allowedItems
		end
	end
--If there are eligible items, select a random one from t_allowedItems and insert it into t_abyssBossRewards
	if #t_allowedItems > 0 then
		table.insert(t_abyssBossRewards, tPos, t_allowedItems[math.random(1, #t_allowedItems)])
	end
end

function f_generateAbyssRewards()
	local t_randomItemSel = {t_abyssSpecialReward, t_abyssAll}
	local t_randomStatSel = {t_abyssAttack, t_abyssPower}
	local t_randomStatSel2 = {t_abyssDefence, t_abyssLife}
	t_abyssBossRewards = {} --Create Boss Rewards Item Table
	f_addAbyssBossRewards(t_abyssReward) --This will be the last item using "tPos" variable
	f_addAbyssBossRewards(t_randomStatSel[math.random(1, #t_randomStatSel)])
	f_addAbyssBossRewards(t_randomStatSel2[math.random(1, #t_randomStatSel2)])
	f_addAbyssBossRewards(t_randomItemSel[math.random(1, #t_randomItemSel)])
	f_addAbyssBossRewards(t_abyssSpecialItems)
	f_addAbyssBossRewards(t_abyssDepth)
--When all reward items are ready:
	for i=1, #t_abyssBossRewards do --Set ID to all items
		t_abyssBossRewards[i]['id'] = textImgNew()
	end
	if data.debugLog then f_printTable(t_abyssBossRewards, "save/debug/t_abyssBossRewards.log") end
end

--Title Info BG
abyssRewardTitleBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(abyssRewardTitleBG, 2.9, 0.41)
animSetAlpha(abyssRewardTitleBG, 155, 22)

--Transparent background
abyssRewardTBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(abyssRewardTBG, 0, 25)
animSetAlpha(abyssRewardTBG, 20, 40)
animUpdate(abyssRewardTBG)

function drawAbyssRewardInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","80,"..inputHintYPos,"d","100,"..inputHintYPos,"s","172,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 193, hintFontYPos)
end

--;===========================================================
--; MATCH EXTRA ASSETS SCREENPACK DEFINITION
--;===========================================================
txt_DemoFightCfg = createTextImg(font15, 0, -1, "DEMO MODE", 305, 10)
txt_AiLevelFightCfg = createTextImg(font5, 0, 0, "", 160, 239)
txt_MatchFightCfg = createTextImg(font5, 0, 0, "", 160, 40)

txt_ScoreP1FightCfg = createTextImg(font15, 0, -1, "", 141, 8)
txt_ScoreP2FightCfg = createTextImg(font15, 0, 1, "", 178, 8)

txt_TimerP1FightCfg = createTextImg(font15, 0, -1, "", 141, 8)
txt_TimerP2FightCfg = createTextImg(font15, 0, 1, "", 178, 8)

txt_SurvivalCountP1FightCfg = createTextImg(font15, 0, -1, "", 141, 8)
txt_SurvivalCountP2FightCfg = createTextImg(font15, 0, 1, "", 178, 8)

txt_WinCountP1FightCfg = createTextImg(font15, 0, -1, "", 141, 8)
txt_WinCountP2FightCfg = createTextImg(font15, 0, 1, "", 178, 8)

txt_TourneyWinCountP1FightCfg = createTextImg(font15, 0, -1, "", 141, 8)
txt_TourneyWinCountP2FightCfg = createTextImg(font15, 0, 1, "", 178, 8)
txt_TourneyStateFightCfg = createTextImg(font12, 0, 0, "", 160, 239)
txt_TourneyFTFightCfg = createTextImg(jgFnt, 5, 0, "", 159, 8, 0.7, 0.7)

txt_MatchFight = "STAGE "
txt_MatchFinalFight = "FINAL STAGE"
txt_SurvivalCountFight = " WINS"
txt_WinCountFight = "WINS "
txt_AiLevelFight = "CPU-"
txt_TourneyFTFight = "FT"

txt_TrophyInfoFight = createTextImg(font2, 0, 1, "", 0, 0, 0.75, 0.75)

--Demo Logo
demoLogo = animNew(sprIkemen, [[
1,0, 0,0, -1
]])
animAddPos(demoLogo, 159, 25)
animSetScale(demoLogo, 0.25, 0.25)
animUpdate(demoLogo)

--BGM Info BG
stgBGMInfoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(stgBGMInfoBG, -54, 50)
animSetScale(stgBGMInfoBG, 430, 20)
animUpdate(stgBGMInfoBG)

--Save Abyss Info BG
abyssSaveInfoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(abyssSaveInfoBG, 258, 215)
animSetScale(abyssSaveInfoBG, 65, 24)
animSetAlpha(abyssSaveInfoBG, 0, 50)
animUpdate(abyssSaveInfoBG)

--;===========================================================
--; CREDITS SCREEN SCREENPACK DEFINITION
--;===========================================================
txt_creditsBox = [[
I.K.E.M.E.N. PLUS ULTRA
DEVELOPER BUILD



MAIN PROGRAMMING

SUEHIRO/SUPERSUEHIRO
K4THOS
SHINLUCHO
NEAT UNSOU
GACEL/WINDBLADE
DAN
KIDCY
WINTERMOURN
SHIYO KAKUGE
KAMEKAZE
TWO4TEEZEE
THEFCLASS97
RODKNEE
ROS
YAMORI X
JADE MIDORI
ALCERIS
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
U2 AKIYAMA
WIZZYWHIPITWONDERFUL
XONTRON
YASUFUMI FUKUDA
ZIRCON



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
2DEE4EVER
PIXEL SLAYER
KADES
RORONIGGA ZORO
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
MEGA X
RUDY GABO
PIZZADARIUS25
LUCKYDUDE
ALEX TV G.T.M
UCHIHASLAYER8893
DJ DELORIE
SHAWN HARGREAVES
TOMISLAV UZELAC AND OVE KAAVEN
GUAN FOO WAH
PETER WANG AND BRENNAN UNDERWOOD
EARLE F. PHILHOWER III
DAVID CORNISH


AND YOU





PRESENTED BY

CABLE DORADO 2
CD2

]]