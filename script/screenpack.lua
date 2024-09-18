--;===========================================================
--; SCREENPACK ASSETS DEFINITION
--;===========================================================
--Sprite Data
sprFade = sffNew("data/screenpack/fade.sff") --load fade sprites
sprSys = sffNew("data/screenpack/system.sff") --load screenpack/menu MUGEN sprites
sprIkemen = sffNew("data/screenpack/ikemen.sff") --load screenpack/menu IKEMEN sprites
sprGlyphs = sffNew("data/screenpack/glyphs.sff") --load movelist sprites
sprBtn = sffNew("data/screenpack/buttons.sff") --load input hints sprites
sprCont = sffNew("data/screenpack/continue.sff") --load continue sprites
sprStory = sffNew("data/screenpack/story.sff") --load story sprites
sprTower = sffNew("data/screenpack/tower.sff") --load tower sprites
sprTourney = sffNew("data/screenpack/tournament.sff") --load tourney sprites
sprVN = sffNew("data/visualnovel/visualnovel.sff") --load visual novel sprites

--Sound Data (Sound effects do not interrupt music/bgm)
sndSys = sndNew("data/screenpack/system.snd")
sndAnncr = sndNew("data/screenpack/announcer.snd")
sndCont = sndNew("data/screenpack/continue.snd")

--Storyboard Data (Optional)
storyboardLogo = "data/screenpack/logo.def"
--storyboardIntro = "data/screenpack/intro.def"

--Video Data (Recommended for large cutscenes instead storyboards)
videoOpening = "data/videos/Opening.wmv"
videoHowToPlay = "data/videos/How To Play.wmv"

--Characters and Stage selection list
selectDef = "data/select.def"

--Lifebar Data (Fight definition filename)
fightDef = "data/screenpack/fight.def"

--License Path (Please always distribute license files for use this program)
licensesPath = "docs/Licenses"

--Missions Data (Mission definition filename)
missionDef = "data/missions/missions.def"

--Events Data (Event definition filename)
eventDef = "data/events/events.def"

--Gallery Data (Gallery definition filename)
galleryDef = "data/gallery/gallery.def"

--Fonts Data (At the moments only FNT Format is Supported)
fontDebug = "font/14x14.fnt"

padFnt = fontNew("font/f-pad.fnt")
survNumFnt = fontNew("font/survival_nums.fnt")
jgFnt = fontNew("font/JG.fnt")
opFnt = fontNew("font/Options.fnt")

font1 = fontNew("font/f-4x6.fnt")
font2 = fontNew("font/f-6x9.fnt")
font3 = fontNew("font/14x14.fnt")
font4 = fontNew("font/18x18.fnt")
font5 = fontNew("font/Qoh_small.fnt")
font6 = fontNew("font/QOH_BIG.fnt")
font7 = fontNew("font/f-6x8f.fnt")
font8 = fontNew("font/f-6x9f.fnt")
font9 = fontNew("font/font3.fnt")
font10 = fontNew("font/font4.fnt")
font11 = fontNew("font/font5.fnt")
font12 = fontNew("font/score1.fnt")
font13 = fontNew("font/kof99.fnt")
font14 = fontNew("font/MvcName.fnt")
font15 = fontNew("font/name1.fnt")
font16 = fontNew("font/num1.fnt")
font17 = fontNew("font/sf2_name.fnt")
font18 = fontNew("font/sf2_small.fnt")
font19 = fontNew("font/sf2_sys.fnt")
font20 = fontNew("font/sfz2a_system.fnt")
font21 = fontNew("font/ssf2x_10.fnt")
font22 = fontNew("font/ssf2x_s.fnt")
font23 = fontNew("font/ssf2x_sL.fnt")
font24 = fontNew("font/ssf2x_vL.fnt")

font30 = fontNew("font/F-.fnt")
font31 = fontNew("font/KombatZone.fnt")
font32 = fontNew("font/kombat-zone.fnt")
font33 = fontNew("font/mk.fnt")
font34 = fontNew("font/mk3-name1.fnt")
font35 = fontNew("font/mk3-name-wins.fnt")
font36 = fontNew("font/mk4-name1.fnt")
font37 = fontNew("font/mk4-name2.fnt")
font38 = fontNew("font/MKBASE.fnt")
font39 = fontNew("font/MKN.fnt")
font40 = fontNew("font/MKNAME2.fnt")
font41 = fontNew("font/MKNUMS.fnt")
font42 = fontNew("font/MKOMBO.fnt")
font43 = fontNew("font/MKRED.fnt")
font44 = fontNew("font/MKSMALL.fnt")
font45 = fontNew("font/MKTIMER.fnt")
font46 = fontNew("font/NameWins - difficulty.fnt")
font47 = fontNew("font/Timer_MK3_Silver.fnt")
font48 = fontNew("font/Timer_MK3_Yellow.fnt")

--Main Soundtrack Path
musicPath = "sound"

--Music Data (ONLY MP3 and OGG formats are Supported)
bgmNothing = " .mp3"
bgmIntro = "sound/System/Opening.mp3"
bgmIntroJP = "sound/System/Opening Lyrics.mp3"
bgmTitle = "sound/System/Title.mp3"
bgmSelectBoss = "sound/System/select/Select Boss.mp3"
bgmSelectOrder = "sound/System/Order Select.mp3"
bgmSelectOrderFinal = "sound/System/Order Select Final.mp3"
bgmVS = "sound/System/VS.mp3"
bgmVSFinal = "sound/System/VS Final.mp3"
bgmVSSpecial = "sound/system/VS Special.mp3"
bgmVictory = "sound/System/Results.mp3"
bgmResults = "sound/System/Results.mp3"
bgmService = "sound/System/Service.mp3"
bgmContinue = "sound/System/Continue.mp3"
bgmGameOver = "sound/System/Game Over.mp3"
bgmVault = "sound/System/The Vault.mp3"
bgmStory = "sound/System/Story.mp3"
bgmTower = "sound/System/Tower.mp3"
bgmTourney = "sound/System/Tourney.mp3"
bgmTourneyChampion = "sound/System/Champion.mp3"
bgmAdventure = "sound/System/Adventure.mp3"

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
if data.debugLog then f_printTable(t_glyphs, "save/debug/t_glyphs.txt") end

--;===========================================================
--; INPUT HINTS SCREENPACK DEFINITION
--;===========================================================
--Load Buttons Sprites
btn0 = animNew(sprBtn, [[0,0, 0,0, -1]])
btn1 = animNew(sprBtn, [[0,1, 0,0, -1]])
btn2 = animNew(sprBtn, [[0,2, 0,0, -1]])
btn3 = animNew(sprBtn, [[0,3, 0,0, -1]])
btn4 = animNew(sprBtn, [[0,4, 0,0, -1]])
btn5 = animNew(sprBtn, [[0,5, 0,0, -1]])
btn6 = animNew(sprBtn, [[0,6, 0,0, -1]])
btn7 = animNew(sprBtn, [[0,7, 0,0, -1]])
btn8 = animNew(sprBtn, [[0,8, 0,0, -1]])
btn9 = animNew(sprBtn, [[0,9, 0,0, -1]])
btnA = animNew(sprBtn, [[0,10, 0,0, -1]])
btnB = animNew(sprBtn, [[0,11, 0,0, -1]])
btnC = animNew(sprBtn, [[0,12, 0,0, -1]])
btnD = animNew(sprBtn, [[0,13, 0,0, -1]])
btnE = animNew(sprBtn, [[0,14, 0,0, -1]])
btnF = animNew(sprBtn, [[0,15, 0,0, -1]])
btnG = animNew(sprBtn, [[0,16, 0,0, -1]])
btnH = animNew(sprBtn, [[0,17, 0,0, -1]])
btnI = animNew(sprBtn, [[0,18, 0,0, -1]])
btnJ = animNew(sprBtn, [[0,19, 0,0, -1]])
btnK = animNew(sprBtn, [[0,20, 0,0, -1]])
btnL = animNew(sprBtn, [[0,21, 0,0, -1]])
btnM = animNew(sprBtn, [[0,22, 0,0, -1]])
btnN = animNew(sprBtn, [[0,23, 0,0, -1]])
btnO = animNew(sprBtn, [[0,24, 0,0, -1]])
btnP = animNew(sprBtn, [[0,25, 0,0, -1]])
btnQ = animNew(sprBtn, [[0,26, 0,0, -1]])
btnR = animNew(sprBtn, [[0,27, 0,0, -1]])
btnS = animNew(sprBtn, [[0,28, 0,0, -1]])
btnT = animNew(sprBtn, [[0,29, 0,0, -1]])
btnU = animNew(sprBtn, [[0,30, 0,0, -1]])
btnV = animNew(sprBtn, [[0,31, 0,0, -1]])
btnW = animNew(sprBtn, [[0,32, 0,0, -1]])
btnX = animNew(sprBtn, [[0,33, 0,0, -1]])
btnY = animNew(sprBtn, [[0,34, 0,0, -1]])
btnZ = animNew(sprBtn, [[0,35, 0,0, -1]])
btnPERIOD = animNew(sprBtn, [[0,36, 0,0, -1]])
btnCOMMA = animNew(sprBtn, [[0,37, 0,0, -1]])
--btnDOUBLEPERIOD = animNew(sprBtn, [[0,38, 0,0, -1]])
--btnPERIODANDCOMMA = animNew(sprBtn, [[0,39, 0,0, -1]])
btnMINUS = animNew(sprBtn, [[0,40, 0,0, -1]])
btnLEFTBRACKET = animNew(sprBtn, [[0,41, 0,0, -1]])
btnRIGHTBRACKET = animNew(sprBtn, [[0,42, 0,0, -1]])
btnSLASH = animNew(sprBtn, [[0,43, 0,0, -1]])
btnBACKSLASH = animNew(sprBtn, [[0,44, 0,0, -1]])
btnLSHIFT = animNew(sprBtn, [[0,45, 0,0, -1]])
btnRSHIFT = animNew(sprBtn, [[0,46, 0,0, -1]])
--btnLALT = animNew(sprBtn, [[0,47, 0,0, -1]])
--btnRALT = animNew(sprBtn, [[0,48, 0,0, -1]])
--btnLCTRL = animNew(sprBtn, [[0,49, 0,0, -1]])
--btnRCTRL = animNew(sprBtn, [[0,50, 0,0, -1]])
btnTAB = animNew(sprBtn, [[0,51, 0,0, -1]])
btnSPACE = animNew(sprBtn, [[0,52, 0,0, -1]])
btnRETURN = animNew(sprBtn, [[0,53, 0,0, -1]])
btnBACKSPACE = animNew(sprBtn, [[0,54, 0,0, -1]])
btnHOME = animNew(sprBtn, [[0,55, 0,0, -1]])
btnEND = animNew(sprBtn, [[0,56, 0,0, -1]])
btnPAGEUP = animNew(sprBtn, [[0,57, 0,0, -1]])
btnPAGEDOWN = animNew(sprBtn, [[0,58, 0,0, -1]])
btnUP = animNew(sprBtn, [[0,59, 0,0, -1]])
btnDOWN = animNew(sprBtn, [[0,60, 0,0, -1]])
btnLEFT = animNew(sprBtn, [[0,61, 0,0, -1]])
btnRIGHT = animNew(sprBtn, [[0,62, 0,0, -1]])
btnKP_0 = animNew(sprBtn, [[0,63, 0,0, -1]])
btnKP_1 = animNew(sprBtn, [[0,64, 0,0, -1]])
btnKP_2 = animNew(sprBtn, [[0,65, 0,0, -1]])
btnKP_3 = animNew(sprBtn, [[0,66, 0,0, -1]])
btnKP_4 = animNew(sprBtn, [[0,67, 0,0, -1]])
btnKP_5 = animNew(sprBtn, [[0,68, 0,0, -1]])
btnKP_6 = animNew(sprBtn, [[0,69, 0,0, -1]])
btnKP_7 = animNew(sprBtn, [[0,70, 0,0, -1]])
btnKP_8 = animNew(sprBtn, [[0,71, 0,0, -1]])
btnKP_9 = animNew(sprBtn, [[0,72, 0,0, -1]])
btnKP_PERIOD = animNew(sprBtn, [[0,73, 0,0, -1]])
btnKP_DIVIDE = animNew(sprBtn, [[0,74, 0,0, -1]])
btnKP_MULTIPLY = animNew(sprBtn, [[0,75, 0,0, -1]])
btnKP_MINUS = animNew(sprBtn, [[0,76, 0,0, -1]])
btnKP_PLUS = animNew(sprBtn, [[0,77, 0,0, -1]])
btnKP_ENTER = animNew(sprBtn, [[0,78, 0,0, -1]])
btnNIL = animNew(sprBtn, [[1,0, 0,0, -1]])

--;===========================================================
--; DRAW SPRITES REFERENCES
--;===========================================================

--animName = animNew(sprSys, [[ 
--grpNo, indexNo, x, y, time, facing, trans
--]])

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
--; DRAW TEXT REFERENCES
--;===========================================================

--[[
textName = createTextImg(fontName, bankNo, alignNo, textData, x, y, xcale, yscale)

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


]]

--;===========================================================
--; LOADING GAME SCREENPACK DEFINITION
--;===========================================================
--Loading Text
txt_loading = createTextImg(font1, 0, -1, "", 310, 230)

--;===========================================================
--; TITLE SCREEN SCREENPACK DEFINITION
--;===========================================================
txt_mainTitle = createTextImg(jgFnt, 5, 0, "-- PRESS START --", 159, 170) --Cool fonts: 3, 5, 6, 9, 10, 11, 12, 20, 21
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
titleBG6 = animNew(sprSys, [[
300,0, 0,233, -1
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
commonTBG = animNew(sprSys, [[
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
--cursorBox = animNew(sprSys, [[
--3,1, 0,0, -1
--]])
--animSetPos(cursorBox, 80, 20)
--animSetAlpha(cursorBox, 20, 100)
--animUpdate(cursorBox)

--Message Fade BG
fadeWindowBG = animNew(sprSys, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(fadeWindowBG, -54, 0)
animSetScale(fadeWindowBG, 427, 240)
animUpdate(fadeWindowBG)

--Common Menu Up Arrows
menuArrowUp = animNew(sprSys, [[
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
menuArrowDown = animNew(sprSys, [[
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
menuArrowLeft = animNew(sprSys, [[
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
menuArrowRight = animNew(sprSys, [[
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

function f_resetGalleryArrowsPos() --Used in Gallery Menu
animSetPos(menuArrowLeft, 0, 190)
animSetPos(menuArrowRight, 310, 190)
end

function f_resetArtworkArrowsPos() --Used in Artworks Menu
animSetPos(menuArrowLeft, 264, 5.5)
animSetPos(menuArrowRight, 312, 5.5)
end

function f_resetSoundTestArrowsPos() --Used in Sound Test Menu
animSetPos(menuArrowLeft, 69, 21)
animSetPos(menuArrowRight, 242, 21)
end

function f_resetTowerArrowsPos() --Used in Tower Select
animSetPos(menuArrowLeft, 0, 190)
animSetPos(menuArrowRight, 310, 190)
end

function f_titleText()
	if stats.vault == "Ultra" then textImgSetText(txt_subTitle, "PLUS ULTRA")
	elseif stats.vault == "Zen" then textImgSetText(txt_subTitle, "PLUS ZEN")
	elseif stats.vault == "SSZ" then textImgSetText(txt_subTitle, "SSZ")
	end
	textImgDraw(txt_subTitle)
end

function drawBottomMenuSP() --Below Menu Fonts
	animDraw(f_animVelocity(titleBG0, -2.15, 0))
end

function drawMiddleMenuSP() --After Cursor Box
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

function drawTopMenuSP() --Always In front
	
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

--;===========================================================
--; F1 INFOBOX MESSAGE SCREENPACK DEFINITION
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

--;===========================================================
--; INFO MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_infoTitle = createTextImg(font5, 0, 0, "INFORMATION", 157, 111)
txt_ok = createTextImg(jgFnt, 5, 0, "OK", 159, 151)
txt_info = createTextImg(jgFnt, 0, 0, "", 0, 0)

--Info Window BG
infoWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(infoWindowBG, 83.5, 97)
animUpdate(infoWindowBG)
animSetScale(infoWindowBG, 1, 1)

function drawInfoInputHints()
	local inputHintYPos = 212
	local hintFont = font2
	local hintFontYPos = 226
	drawInputHintsP1("w","70,"..inputHintYPos,"q","190,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 91, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 211, hintFontYPos)
end

--;===========================================================
--; MAIN MENU SCREENPACK DEFINITION
--;===========================================================
txt_gameFt = createTextImg(font5, 0, 1, "", 2, 240) --Text to identify the game mode in menus

if data.engineMode == "FG" then --Menu Items for Fighting Engine Mode
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
elseif data.engineMode == "VN" then --Menu Items for Visual Novel Engine Mode
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

--;===========================================================
--; ARCADE MENU SCREENPACK DEFINITION
--;===========================================================
t_arcadeMenu = {
	{id = textImgNew(), text = "CLASSIC MODE"},
	{id = textImgNew(), text = "TOWER MODE"},
}

--;===========================================================
--; VERSUS MENU SCREENPACK DEFINITION
--;===========================================================
t_vsMenu = {
	{id = textImgNew(), text = "QUICK MATCH"},
	{id = textImgNew(), text = "FREE BATTLE"},
}

--;===========================================================
--; CHALLENGES MENU SCREENPACK DEFINITION
--;===========================================================
t_challengeMenu = {
	{id = textImgNew(), text = "SURVIVAL"},
	{id = textImgNew(), text = "MISSIONS"},
	{id = textImgNew(), text = "BOSS FIGHT"},
	{id = textImgNew(), text = "BONUS GAMES"},
	{id = textImgNew(), text = "SCORE ATTACK"},
	{id = textImgNew(), text = "TIME ATTACK"},
	{id = textImgNew(), text = "TIME RUSH"},
	{id = textImgNew(), text = ""}, --VS X KUMITE --(X = data.kumite)
	{id = textImgNew(), text = "SUDDEN DEATH"},
}

function getKumiteData()
kumiteDataText = "VS "..data.kumite.." KUMITE"
return kumiteDataText
end

--;===========================================================
--; BOSS FIGHT MENU SCREENPACK DEFINITION
--;===========================================================
t_bossMenu = {
	{id = textImgNew(), text = "VS SINGLE BOSS"},
	{id = textImgNew(), text = "BOSS RUSH"},
}

--;===========================================================
--; BONUS GAMES MENU SCREENPACK DEFINITION
--;===========================================================
t_bonusMenu = {
	{id = textImgNew(), text = "SINGLE MODE"},
	{id = textImgNew(), text = "BONUS RUSH"},
}

--;===========================================================
--; EXTRAS MENU SCREENPACK DEFINITION
--;===========================================================
t_extrasMenu = {
	{id = textImgNew(), text = "ENDLESS"},
	{id = textImgNew(), text = "EVENTS"},
	{id = textImgNew(), text = "TOURNAMENT"},
	{id = textImgNew(), text = "VISUAL NOVEL"},
	{id = textImgNew(), text = "THE VAULT"},
	{id = textImgNew(), text = "RANDOMTEST"},
}

--;===========================================================
--; BONUS RUSH MENU SCREENPACK DEFINITION
--;===========================================================
t_bonusrushMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
}

--;===========================================================
--; COMMON SUB-MENUS SCREENPACK DEFINITION
--;===========================================================
t_commonSubMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

t_commonSubMenu2 = {
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

--;===========================================================
--; MISSIONS MENU SCREENPACK DEFINITION
--;===========================================================
txt_missionMenu = createTextImg(jgFnt, 0, -1, "MISSION SELECT:", 195, 125)
txt_missionProgress = createTextImg(jgFnt, 2, 1, "", 202, 125)
txt_missionIncomplete = "INCOMPLETE"

--Unknown Mission Preview
missionUnknown = animNew(sprSys, [[110,4, 0,0,]])

--Above Transparent background
missionBG1 = animNew(sprSys, [[
3,0, 0,0, -1
]])
animSetPos(missionBG1, 48, 19)
animSetAlpha(missionBG1, 20, 100)
animUpdate(missionBG1)

--Below Transparent background
missionBG2 = animNew(sprSys, [[
3,0, 0,0, -1
]])
animSetPos(missionBG2, 40, 130)
animSetAlpha(missionBG2, 20, 100)
animUpdate(missionBG2)

--Missions Input Hints Panel
function drawMissionInputHints()
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
--; EVENTS MENU SCREENPACK DEFINITION
--;===========================================================
txt_eventMenu = createTextImg(jgFnt, 0, -1, "EVENT SELECT:", 195, 10)
txt_eventProgress = createTextImg(jgFnt, 2, 1, "", 202, 10)
txt_lockedInfo = createTextImg(jgFnt, 0, 0, "EVENT NOT AVAILABLE, TRY LATER", 160, 130,0.6,0.6)

t_eventMenu2 = {
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "INCOMPLETE", available = true}, --Add Event Slot
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "INCOMPLETE", available = true},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "INCOMPLETE", available = true},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "", available = true},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "", available = true},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "", available = true},
}

--Above Transparent background
eventBG1 = animNew(sprSys, [[
3,0, 0,0, -1
]])
animSetPos(eventBG1, 0, 18)
animSetAlpha(eventBG1, 20, 100)
animUpdate(eventBG1)

--Below Transparent background
eventBG2 = animNew(sprSys, [[
3,0, 0,0, -1
]])
animSetPos(eventBG2, 3, 49)
animSetAlpha(eventBG2, 20, 100)
animUpdate(eventBG2)

--Right Menu Arrow
arrowsER = animNew(sprSys, [[
221,0, 0,0, 10
221,1, 0,0, 10
221,2, 0,0, 10
221,3, 0,0, 10
221,4, 0,0, 10
221,3, 0,0, 10
221,2, 0,0, 10
221,1, 0,0, 10
221,0, 0,0, 10
]])
animAddPos(arrowsER, 303, 123)
animUpdate(arrowsER)
animSetScale(arrowsER, 1.7, 1.7)

--Left Menu Arrow
arrowsEL = animNew(sprSys, [[
221,5, 0,0, 10
221,6, 0,0, 10
221,7, 0,0, 10
221,8, 0,0, 10
221,9, 0,0, 10
221,8, 0,0, 10
221,7, 0,0, 10
221,6, 0,0, 10
221,5, 0,0, 10
]])
animAddPos(arrowsEL, 0, 123)
animUpdate(arrowsEL)
animSetScale(arrowsEL, 1.7, 1.7)

txt_lockedinfoTitle = createTextImg(font5, 0, 0, "INFORMATION", 156.5, 111)
txt_lockedOk = createTextImg(jgFnt, 5, 0, "OK", 159, 151)

--Info Window BG
infoEventWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(infoEventWindowBG, 83.5, 97)
animUpdate(infoEventWindowBG)
animSetScale(infoEventWindowBG, 1, 1)

--Events Input Hints Panel
function drawEventInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("l","0,"..inputHintYPos,"r","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

function drawInfoEventInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("w","70,"..inputHintYPos,"q","190,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 91, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 211, hintFontYPos)
end

function f_eventTime()
	sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
	sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
	--sysTime3 = tonumber(os.date("%m"))
	--Clock
	if data.clock == "Standard" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 314, 8)
	elseif data.clock == "Full Standard" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 314, 8)
	elseif data.clock == "Military" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 314, 8)
	elseif data.clock == "Full Military" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 314, 8)
	end
	--Date
	if data.date == "Type A" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%m-%d-%y")), 8, 8)
	elseif data.date == "Type B" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%d-%m-%Y")), 8, 8)
	elseif data.date == "Type C" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%a %d.%b.%Y")), 8, 8)
	elseif data.date == "Type D" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%A")), 8, 8)
	elseif data.date == "Type E" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%B.%Y")), 8, 8)
	end
	textImgDraw(txt_titleClock) --Draw Clock
	textImgDraw(txt_titleDate) --Draw Date
end

--;===========================================================
--; VISUAL NOVEL MENU SCREENPACK DEFINITION
--;===========================================================
txt_vnSelect = createTextImg(jgFnt, 0, 0, "VISUAL NOVEL SELECT", 159, 13)

--;===========================================================
--; VISUAL NOVEL INTRO SCREENPACK DEFINITION
--;===========================================================
txt_VNarc = createTextImg(font20, 1, 0, "", 159, 20) --font6
txt_VNchapter = createTextImg(font20, 2, 0, "", 159, 110)
txt_VNchapterName = createTextImg(font20, 2, 0, "", 159, 130)
txt_VNchapterInfo = createTextImg(font7, 0, 0, "", 159, 150)
txt_VNchapterAuthor = createTextImg(font7, 0, 0, "", 159, 220)
txt_VNchapterDate = createTextImg(font9, 0, 0, "", 159, 231, 0.50, 0.50)

--;===========================================================
--; VISUAL NOVEL IN-GAME HUD SCREENPACK DEFINITION
--;===========================================================
txt_nameCfg = createTextImg(font13, 0, 1, "", 2, 175, 0.7, 0.7) --Name Text Config
txt_boxCfg = createTextImg(font5, 0, 1, "", 0, 0) --Narrative Text Box Config

--Text background
vnTxtBG = animNew(sprVN, [[
100,0, 0,0, -1
]])
animAddPos(vnTxtBG, -8, 177.5)
animSetScale(vnTxtBG, 2.21, 1)
animUpdate(vnTxtBG)

--Next Text Arrow (Right)
vnNextR = animNew(sprVN, [[
101,0, 0,0, 10
101,1, 0,0, 10
101,2, 0,0, 10
101,3, 0,0, 10
101,3, 0,0, 10
101,2, 0,0, 10
101,1, 0,0, 10
101,0, 0,0, 10
]])
animAddPos(vnNextR, 308, 222)
animSetScale(vnNextR, 0.5, 0.5)
animUpdate(vnNextR)

--Next Text Arrow (Down)
vnNext = animNew(sprVN, [[
102,0, 0,0, 10
102,1, 0,0, 10
102,2, 0,0, 10
102,3, 0,0, 10
102,3, 0,0, 10
102,2, 0,0, 10
102,1, 0,0, 10
102,0, 0,0, 10
]])
animAddPos(vnNext, 306, 224)
animSetScale(vnNext, 0.5, 0.5)
animUpdate(vnNext)

--;===========================================================
--; VISUAL NOVEL ENDING SCREENPACK DEFINITION
--;===========================================================
--Ending 1
vnEnd1 = animNew(sprVN, [[
200,1, 0,0, -1
]])
animAddPos(vnEnd1, -54, 0)
animSetScale(vnEnd1, 0.34, 0.34)
animUpdate(vnEnd1)

--Ending 2
vnEnd2 = animNew(sprVN, [[
200,2, 0,0, -1
]])
animAddPos(vnEnd2, -54, 0)
animSetScale(vnEnd2, 0.34, 0.34)
animUpdate(vnEnd2)

--Ending 3
vnEnd3 = animNew(sprVN, [[
200,3, 0,0, -1
]])
animAddPos(vnEnd3, -54, 0)
animSetScale(vnEnd3, 0.34, 0.34)
animUpdate(vnEnd3)

--;===========================================================
--; VISUAL NOVEL PAUSE MENU SCREENPACK DEFINITION
--;===========================================================
txt_vnPTitle = createTextImg(jgFnt, 0, 0, "STORY OPTIONS", 160, 13)
txt_vnPSaved = createTextImg(jgFnt, 5, 0, "PROGRESS SAVED!", 159, 235)

t_vnPauseMenu = {
	{varID = textImgNew(), text = "Text Speed", 			 varText = ""},
	{varID = textImgNew(), text = "Text BG Transparency", 	 varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"},
	{varID = textImgNew(), text = "Auto Skip Text", 		 varText = ""},
	{varID = textImgNew(), text = "Display Character Name",  varText = ""},
	{varID = textImgNew(), text = "Sound Settings", 		 varText = ""},
	--{varID = textImgNew(), text = "Control Guide", 		 	 varText = ""},
	{varID = textImgNew(), text = "Restore Settings", 		 varText = ""},
	{varID = textImgNew(), text = "Save Progress",			 varText = ""},
	{varID = textImgNew(), text = "Skip All Dialogues",		 varText = ""},
	{varID = textImgNew(), text = "Back to Main Menu",		 varText = ""},
	{varID = textImgNew(), text = "           Continue", 	 varText = ""},
}

--Pause background
vnPauseBG = animNew(sprVN, [[100,1, 0,0, -1]])

--Input Hints Panel
function drawVNInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"s","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

function drawVNInputHints2()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

function drawVNInputHints3()
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
--; VISUAL NOVEL AUDIO SETTINGS SCREENPACK DEFINITION
--;===========================================================
txt_audioCfg = createTextImg(jgFnt, 0, 0, "AUDIO SETTINGS", 159, 13)
t_panStr = {"None", "Narrow", "Medium", "Wide", "Full"}

t_audioCfg = {
	{varID = textImgNew(), text = "Master Volume",		varText = gl_vol.."%"},
	{varID = textImgNew(), text = "SFX Volume",			varText = se_vol.."%"},
	{varID = textImgNew(), text = "BGM Volume",			varText = bgm_vol.."%"},
	{varID = textImgNew(), text = "Audio Panning",   	varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{varID = textImgNew(), text = "Default Values",		varText = ""},
	{varID = textImgNew(), text = "          BACK",  	varText = ""},
}

--;===============================================================
--; VISUAL NOVEL EXIT/DEFAULT VALUES MESSAGE SCREENPACK DEFINITION
--;===============================================================
txt_questionVN = createTextImg(jgFnt, 1, 0, "", 160, 110,0.8,0.8)

t_questionMenuVN = {
	{id = textImgNew(), text = ""},
	{id = textImgNew(), text = ""},
}

--Default Window BG
questionWindowBGVN = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(questionWindowBGVN, 61, 97)
animUpdate(questionWindowBGVN)
animSetScale(questionWindowBGVN, 1.3, 1)

--;===========================================================
--; WATCH MENU SCREENPACK DEFINITION
--;===========================================================
t_watchMenu = {
	{id = textImgNew(), text = "REPLAYS"},
	{id = textImgNew(), text = "STAGE VIEWER"},
	{id = textImgNew(), text = "SOUND TEST"},
	{id = textImgNew(), text = "GALLERY"},
	{id = textImgNew(), text = "PROFILE"}, --(RANKING, RECORDS, ACHIEVEMENTS, PLAYER DATA)
	{id = textImgNew(), text = "LICENSES"},
	{id = textImgNew(), text = "CREDITS"},
}

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
	t_replayOption[i].id = createTextImg(jgFnt, 0, 0, t_replayOption[i].text, -80+i*120, 172)
end

--Replay Title Transparent background
replayMenuBG = animNew(sprSys, [[
3,0, 0,0, -1
]])
animSetPos(replayMenuBG, 0, 5)
animSetAlpha(replayMenuBG, 20, 100)
animUpdate(replayMenuBG)

--Replay Option background
replayMenuBG2 = animNew(sprSys, [[
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
--; STATISTICS MENU SCREENPACK DEFINITION
--;===========================================================
txt_statsMenu = createTextImg(jgFnt, 0, -1, "", 202, 13)
txt_statsProgress = createTextImg(jgFnt, 2, 1, "", 208, 13)

t_statsMenu = {
	{varID = textImgNew(), text = "Play Time",	  				varText = ""},
	{varID = textImgNew(), text = "Matchs Played",  			varText = ""},
	{varID = textImgNew(), text = "Wins",	     				varText = ""},
	{varID = textImgNew(), text = "Losses",	     				varText = ""},
	{varID = textImgNew(), text = "Favorite Character",  		varText = ""},
	{varID = textImgNew(), text = "Favorite Stage",				varText = ""},
	{varID = textImgNew(), text = "Preferred Game Mode", 		varText = ""},
	{varID = textImgNew(), text = "Training Time",  			varText = ""},
	{varID = textImgNew(), text = "Collected Coins",    		varText = ""},
	{varID = textImgNew(), text = "Stories Completed",     		varText = ""},
	{varID = textImgNew(), text = "Missions Completed",     	varText = ""},
	{varID = textImgNew(), text = "Events Completed",     		varText = ""},
	{varID = textImgNew(), text = "Leaderboards",		    	varText = "WIP"},
	{varID = textImgNew(), text = "                   BACK",    varText = ""},
}

--;===========================================================
--; GALLERY MENU SCREENPACK DEFINITION
--;===========================================================
txt_galleryTitle = createTextImg(jgFnt, 0, 0, "GALLERY", 159, 13)
txt_galleryInfo = createTextImg(font7, 0, 0, "", 159, 202)

--Gallery Cursor
galleryCursorPosX = -74.3
galleryCursorPosY = 4.3
galleryCursorSpacingX = 78.09
galleryCursorSpacingY = 44.1

--Gallery Items
galleryCellPosX = -17.5
galleryCellPosY = 35
galleryCellSpacingX = 39
galleryCellSpacingY = 22

--Menu Cursor
galleryCursor = animNew(sprIkemen, [[
20,0, 0,0, -1
]])
animSetScale(galleryCursor, 0.49, 0.5)

--Info BG
galleryInfoBG = animNew(sprSys, [[
230,3, 0,0, -1
]])
animSetScale(galleryInfoBG, 2.9, 0.40)
animSetAlpha(galleryInfoBG, 155, 22)

function drawGalleryInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	drawInputHintsP1("y","20,5","z","270,5","u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","118,"..inputHintYPos,"e","184,"..inputHintYPos,"q","244,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 139, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 205, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 265, hintFontYPos)
end

--;===========================================================
--; ARTWORK DISPLAY SCREENPACK DEFINITION
--;===========================================================
--Input Hints BG
gInputsBG = animNew(sprSys, [[
230,3, 0,0, -1
]])
animSetScale(gInputsBG, 2.9, 0.75)
animSetAlpha(gInputsBG, 155, 22)

--Artwork Input Hints Panel
function drawArtInputHints()
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
--; SOUND TEST MENU SCREENPACK DEFINITION
--;===========================================================
txt_song = createTextImg(jgFnt, 0, 0, "", 159, 13)

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
--; CONFIRM SONG MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_confirmSong = createTextImg(jgFnt, 0, 0, "USE THIS SONG?", 160, 108, 0.63, 0.63)

--Confirm Window BG
confirmSongWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(confirmSongWindowBG, 83.5, 97)
animUpdate(confirmSongWindowBG)
animSetScale(confirmSongWindowBG, 1, 1)

t_confirmSongMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

--;===========================================================
--; LICENSES MENU SCREENPACK DEFINITION
--;===========================================================
txt_licenseTitle = createTextImg(jgFnt, 0, 0, "", 159, 13)
txt_license = createTextImg(font7, 0, 1, "", 0, 0)

--Title BG
licenseTitleBG = animNew(sprSys, [[
230,3, 0,0, -1
]])
animSetScale(licenseTitleBG, 2.9, 0.30)
animSetAlpha(licenseTitleBG, 155, 22)

--Input Hints BG
lInputsBG = animNew(sprSys, [[
230,3, 0,0, -1
]])
animSetScale(lInputsBG, 2.9, 0.37)
animSetAlpha(lInputsBG, 155, 22)

--Input Hints Panel
function drawLicenseInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	animPosDraw(lInputsBG, -56, 217) --Draw Input Hints BG
	drawInputHintsP1("l","0,"..inputHintYPos,"r","20,"..inputHintYPos,"u","90,"..inputHintYPos,"d","110,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Scroll", 132, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
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

--IP Window BG
textWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(textWindowBG, 83.5, 97)
animUpdate(textWindowBG)
animSetScale(textWindowBG, 1, 1)

--Connecting Window BG
joinWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(joinWindowBG, 83.5, 54)
animUpdate(joinWindowBG)
animSetScale(joinWindowBG, 1, 2)

--Connecting Icon
wirelessBG = animNew(sprSys, [[
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
	t_directJoinMenu[i].id = createTextImg(jgFnt, 0, 0, t_directJoinMenu[i].text, 12+i*95, 151)
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
	t_editOption[i].id = createTextImg(jgFnt, 0, 0, t_editOption[i].text, 12+i*95, 151)
end

--CRUD Window BG
crudHostWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
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

--;===========================================================
--; ONLINE LOBBY MENU SCREENPACK DEFINITION
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
	--{id = textImgNew(), text = "SCORE ATTACK"},
	--{id = textImgNew(), text = "TIME ATTACK"},
	{id = textImgNew(), text = "TIME RUSH"},
	{id = textImgNew(), text = ""}, --VS X KUMITE
	{id = textImgNew(), text = "SUDDEN DEATH"},
	{id = textImgNew(), text = "ONLINE SETTINGS"},
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
vaultBG0 = animNew(sprSys, [[
2000,1, 0,0,
]])
animSetPos(vaultBG0, 160, 119)
animUpdate(vaultBG0)
animSetScale(vaultBG0, 0.30, 0.305)

--Text Window BG
vaultWindowBG = animNew(sprSys, [[
3,0, 0,0, -1
]])
animSetPos(vaultWindowBG, 20, 100)
animSetAlpha(vaultWindowBG, 20, 100)
animUpdate(vaultWindowBG)

--;===========================================================
--; SIDE SELECT SCREENPACK DEFINITION
--;===========================================================
txt_sideTitle = createTextImg(font14, 0, 0, "SIDE SELECT", 157, 8, 0.9, 0.9)
txt_sideWarning = createTextImg(font6, 0, 0, "THE SIDE SELECTED IS NOT ALLOWED FOR THIS GAME MODE", 157, 70, 0.75, 0.75)

--Gamepad Icon
gamepadIcon = animNew(sprSys, [[20,0, 0,0,]])

--Lifebars Image
lifebarsImg = animNew(sprSys, [[21,0, 0,0,]])

--Left Arrows
sideSelArrowLeft = animNew(sprSys, [[
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
sideSelArrowRight = animNew(sprSys, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])

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
challengerText = animNew(sprSys, [[
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
intermissionBG0 = animNew(sprSys, [[
101,0, 0,0, -1
]])
animAddPos(intermissionBG0, 160, 0)
animSetTile(intermissionBG0, 1, 1)
animSetColorKey(intermissionBG0, -1)

--Intermission Scrolling background 2
intermissionBG1 = animNew(sprTower, [[
0,0, 0,0, -1
]])
animAddPos(intermissionBG1, 160, 0)
animSetTile(intermissionBG1, 1, 1)
animSetColorKey(intermissionBG1, -1)
animSetAlpha(intermissionBG1, 150, 0)

--Intermission Scrolling background 2
intermissionBG2 = animNew(sprSys, [[
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
--; CONFIRM MENU SCREENPACK DEFINITION
--;===========================================================
txt_confirmQuestion = createTextImg(jgFnt, 1, 0, "ARE YOU SURE?", 160, 110)

--Confirm Window BG
confirmWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(confirmWindowBG, 83.5, 97)
animUpdate(confirmWindowBG)
animSetScale(confirmWindowBG, 1, 1)

t_confirmMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

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
--; CLOSE/RESTART MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_question = createTextImg(jgFnt, 1, 0, "ARE YOU SURE?", 160, 110)

--Exit Window BG
exitWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(exitWindowBG, 83.5, 97)
animUpdate(exitWindowBG)
animSetScale(exitWindowBG, 1, 1)

t_closeMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

--;===========================================================
--; BLACK SCREEN MESSAGE SCREENPACK DEFINITION
--;===========================================================
txt_msgMenu = createTextImg(jgFnt, 0, 1, "", 0, 0) --Text that appears in black screens important message

--;===========================================================
--; ATTRACT MENU SCREENPACK DEFINITION
--;===========================================================
txt_attractTimer = createTextImg(font1, 0, 0, "", 302, 215)
txt_coinTitle = createTextImg(jgFnt, 0, 0, "-- INSERT COIN --", 159, 170)
function f_attractCredits()
	txt_credits = createTextImg(font1, 0, -1, "Credits: "..stats.attractCoins, 181.5, 212)
	textImgDraw(txt_credits)
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

--;===========================================================
--; CHARACTER SELECT SCREENPACK DEFINITION
--;===========================================================
txt_mainSelect = createTextImg(jgFnt, 0, 0, "", 159, 13) --Text that appears in character select with the name of the game mode
txt_charTime = createTextImg(jgFnt, 0, 0, "", 160, 70)
txt_backquestion = createTextImg(jgFnt, 1, 0, "BACK TO MAIN MENU?", 160.5, 110,0.9,0.9)
txt_p1Wins = createTextImg(font6, 0, 1, "", 2, 13)
txt_p2Wins = createTextImg(font6, 0, -1, "", 318, 13)
txt_palHint = createTextImg(font1, 0, 0, "", 157, 239)
txt_palHintC = "PRESS A,B,C,X,Y OR Z BUTTON TO SELECT A COLOR PALETTE FOR THE CHARACTERS"
txt_palHintM = "PRESS MENU BUTTON TO SELECT A COLOR PALETTE FOR THE CHARACTERS"

--Back Window BG
backWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(backWindowBG, 83.5, 97)
animUpdate(backWindowBG)
animSetScale(backWindowBG, 1, 1)

t_backMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

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

--Hardcore Scrolling background
selectHardBG0 = animNew(sprSys, [[
101,0, 0,0, -1
]])
animAddPos(selectHardBG0, 160, 0)
animSetTile(selectHardBG0, 1, 1)
animSetColorKey(selectHardBG0, -1)

--Tower Scrolling background
selectTowerBG0 = animNew(sprTower, [[
0,0, 0,0, -1
]])
animAddPos(selectTowerBG0, 160, 0)
animSetTile(selectTowerBG0, 1, 1)
animSetColorKey(selectTowerBG0, -1)
animSetAlpha(selectTowerBG0, 150, 0)

--Dark Box (Player1 side)
selectBG1a = animNew(sprSys, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1a, 160, 0)
animSetTile(selectBG1a, 1, 0)
animSetWindow(selectBG1a, 5, 0, 151, 239) --The first values ​​are the location of the sprite on the screen and the last values ​​are the extension of the sprite

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

--Up Arrows 1 for Muti Roster 1 (Left Side) [Advanced Type]
arrowsUMR = animNew(sprSys, [[
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
animAddPos(arrowsUMR, 5, 140)
animUpdate(arrowsUMR)
animSetScale(arrowsUMR, 0.95, 0.95)

--Down Arrows 1 for Muti Roster 1 (Left Side) [Advanced Type]
arrowsDMR = animNew(sprSys, [[
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
animAddPos(arrowsDMR, 5, 213)
animUpdate(arrowsDMR)
animSetScale(arrowsDMR, 0.95, 0.95)

--Up Arrows 1 for Muti Roster 2 (Right Side) [Advanced Type]
arrowsUMR2 = animNew(sprSys, [[
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
animAddPos(arrowsUMR2, 307, 140)
animUpdate(arrowsUMR2)
animSetScale(arrowsUMR2, 0.95, 0.95)

--Down Arrows 2 for Muti Roster 2 (Right Side) [Advanced Type]
arrowsDMR2 = animNew(sprSys, [[
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
animAddPos(arrowsDMR2, 307, 203)
animUpdate(arrowsDMR2)
animSetScale(arrowsDMR2, 0.95, 0.95)

--Up Arrows for Single Roster (Simple Type)
arrowsUSR = animNew(sprSys, [[
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
animAddPos(arrowsUSR, 156, 140)
animUpdate(arrowsUSR)
animSetScale(arrowsUSR, 0.95, 0.95)

--Down Arrows for Single Roster (Simple Type)
arrowsDSR = animNew(sprSys, [[
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
animAddPos(arrowsDSR, 156, 203)
animUpdate(arrowsDSR)
animSetScale(arrowsDSR, 0.95, 0.95)

--Cell Lock
cellLock = animNew(sprSys, [[
108,0, 0,0,
]])
animSetScale(cellLock, 0.07, 0.07)
animUpdate(cellLock)

--Cell Locked Fade Window
cellLockWindowBG = animNew(sprSys, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetScale(cellLockWindowBG, 91.5, 51)
animUpdate(cellLockWindowBG)

--Input Hints Panel
function drawSelectInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

function drawStageInputHints()
	local inputHintYPos = 21
	local hintFont = font2
	local hintFontYPos = 35
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

--;===========================================================
--; PLAYER 1 TEAM SELECT SCREENPACK DEFINITION
--;===========================================================
p1SelTmTxt = createTextImg(jgFnt, 5, 1, "TEAM MODE", 20, 30)
IASelTmTxt = createTextImg(jgFnt, 5, 1, "CPU MODE", 20, 30)

t_p1selTeam = {
	{id = '', text = "SINGLE"},
	{id = '', text = "SIMUL"},
	{id = '', text = "TURNS"},
}
for i=1, #t_p1selTeam do
	t_p1selTeam[i].id = createTextImg(jgFnt, 0, 1, t_p1selTeam[i].text, 20, 35+i*15)
end

--P1 Team cursor
p1TmCursor = animNew(sprSys, [[
180,0, 0,0, -1
]])

--P1 Team icon
p1TmIcon = animNew(sprSys, [[
181,0, 0,0, -1
]])

--P1 Empty Team (icon 1)
p1EmptyIcon = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon, 81, 66)
animUpdate(p1EmptyIcon)

--P1 Empty Team (icon 2)
p1EmptyIcon2 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon2, 87, 66)
animUpdate(p1EmptyIcon2)

--P1 Empty Team (icon 3)
p1EmptyIcon3 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon3, 93, 66)
animUpdate(p1EmptyIcon3)

--P1 Empty Team (icon 4)
p1EmptyIcon4 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon4, 99, 66)
animUpdate(p1EmptyIcon4)

--P1 Empty Turns (icon 1)
p1EmptyIcon5 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon5, 81, 81)
animUpdate(p1EmptyIcon5)

--P1 Empty Turns (icon 2)
p1EmptyIcon6 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon6, 87, 81)
animUpdate(p1EmptyIcon6)

--P1 Empty Turns (icon 3)
p1EmptyIcon7 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon7, 93, 81)
animUpdate(p1EmptyIcon7)

--P1 Empty Turns (icon 4)
p1EmptyIcon8 = animNew(sprSys, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon8, 99, 81)
animUpdate(p1EmptyIcon8)

--;===========================================================
--; PLAYER 2 TEAM SELECT SCREENPACK
--;===========================================================
p2SelTmTxt = createTextImg(jgFnt, 5, -1, "TEAM MODE", 300, 30)
IASelTmTxt2 = createTextImg(jgFnt, 5, -1, "CPU MODE", 300, 30)

t_p2selTeam = {
	{id = '', text = t_p1selTeam[1].text}, --Get text from player 1 team table
	{id = '', text = t_p1selTeam[2].text},
	{id = '', text = t_p1selTeam[3].text},
}
for i=1, #t_p2selTeam do
	t_p2selTeam[i].id = createTextImg(jgFnt, 0, -1, t_p2selTeam[i].text, 300, 35+i*15)
end

--P2 Team cursor
p2TmCursor = animNew(sprSys, [[
190,0, 0,0, -1
]])

--P2 Team icon
p2TmIcon = animNew(sprSys, [[
191,0, 0,0, -1
]])

--P2 Empty Team (icon 1)
p2EmptyIcon = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon, 239, 66)
animUpdate(p2EmptyIcon)

--P2 Empty Team (icon 2)
p2EmptyIcon2 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon2, 233, 66)
animUpdate(p2EmptyIcon2)

--P2 Empty Team (icon 3)
p2EmptyIcon3 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon3, 227, 66)
animUpdate(p2EmptyIcon3)

--P2 Empty Team (icon 4)
p2EmptyIcon4 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon4, 221, 66)
animUpdate(p2EmptyIcon4)

--P2 Empty Turns (icon 1)
p2EmptyIcon5 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon5, 239, 81)
animUpdate(p2EmptyIcon5)

--P2 Empty Turns (icon 2)
p2EmptyIcon6 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon6, 233, 81)
animUpdate(p2EmptyIcon6)

--P2 Empty Turns (icon 3)
p2EmptyIcon7 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon7, 227, 81)
animUpdate(p2EmptyIcon7)

--P2 Empty Turns (icon 4)
p2EmptyIcon8 = animNew(sprSys, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon8, 221, 81)
animUpdate(p2EmptyIcon8)

--;===========================================================
--; PLAYER 1 CHARACTER SELECTING SCREENPACK DEFINITION
--;===========================================================
txt_p1Name = createTextImg(jgFnt, 4, 1, "", 0, 0, 0.8, 0.8)
txt_p1Author = createTextImg(jgFnt, 0, 1, "", 0, 20, 0.65, 0.65)
txt_authorText = "AUTHOR: "

--P1 Random Portrait
p1randomPortrait = animNew(sprSys, [[151,1, 0,0,]])

--P1 Random Sprite
p1randomSprite = animNew(sprSys, [[151,2, 0,0,]])

--P1 Big Portrait Lock
p1portraitLock = animNew(sprSys, [[108,0, 0,0,]])

--P1 Big Portrait Locked Fade Window
p1portraitLockWindowBG = animNew(sprSys, [[3,0, 0,0, -1, 0]])

function f_p1charAnnouncer()
	if f_getName(p1Cell) == "Kung Fu Man" then
		sndPlay(sndAnncr, 1, 0)
	elseif f_getName(p1Cell) == "Kung Fu Girl" then
		sndPlay(sndAnncr, 1, 1)
	elseif f_getName(p1Cell) == "Suave Dude" then
		sndPlay(sndAnncr, 1, 2)
	elseif f_getName(p1Cell) == "Mako Mayama" then
		sndPlay(sndAnncr, 1, 3)
	elseif f_getName(p1Cell) == "Reika Murasame" then
		sndPlay(sndAnncr, 1, 4)
	elseif f_getName(p1Cell) == "Evil Kung Fu Man" then
		sndPlay(sndAnncr, 1, 5)
	elseif f_getName(p1Cell) == "Shin Gouki" then
		sndPlay(sndAnncr, 1, 6)
	--elseif f_getName(p1Cell) == "Your Character Name" then
		--sndPlay(sndAnncr, 1, 1)
	end
end

--;===========================================================
--; PLAYER 2 CHARACTER SELECTING SCREENPACK DEFINITION
--;===========================================================
txt_p2Name = createTextImg(jgFnt, 1, -1, "", 0, 0, 0.8, 0.8)
txt_p2Author = createTextImg(jgFnt, 0, -1, "", 320, 20, 0.65, 0.65)

--P2 Random Portrait
p2randomPortrait = animNew(sprSys, [[151,1, -120,0,]])

--P2 Random Sprite
p2randomSprite = animNew(sprSys, [[151,2, 0,0,]])

--P2 Big Portrait Lock
p2portraitLock = animNew(sprSys, [[108,0, -320,0,]])

--P2 Big Portrait Locked Fade Window
p2portraitLockWindowBG = animNew(sprSys, [[3,0, -1, 0,]])

function f_p2charAnnouncer()
	if f_getName(p2Cell) == "Kung Fu Man" then
		sndPlay(sndAnncr, 2, 0)
	elseif f_getName(p2Cell) == "Kung Fu Girl" then
		sndPlay(sndAnncr, 2, 1)
	elseif f_getName(p2Cell) == "Suave Dude" then
		sndPlay(sndAnncr, 2, 2)
	elseif f_getName(p2Cell) == "Mako Mayama" then
		sndPlay(sndAnncr, 2, 3)
	elseif f_getName(p2Cell) == "Reika Murasame" then
		sndPlay(sndAnncr, 2, 4)
	elseif f_getName(p2Cell) == "Evil Kung Fu Man" then
		sndPlay(sndAnncr, 2, 5)
	elseif f_getName(p2Cell) == "Shin Gouki" then
		sndPlay(sndAnncr, 2, 6)
	--elseif f_getName(p2Cell) == "Your Character Name" then
		--sndPlay(sndAnncr, 2, 1)
	end
end

--;===========================================================
--; PALETTE SELECT SCREENPACK DEFINITION
--;===========================================================
txt_palText = "PALETTE:"
txt_p1Pal = createTextImg(jgFnt, 5, 1, txt_palText, 5, 237)
txt_p2Pal = createTextImg(jgFnt, 5, -1, txt_palText, 266, 237)
txt_p1PalNo = createTextImg(font14, 0, 0, "", 95, 237) --draw palette limit numbers text
txt_p2PalNo = createTextImg(font14, 0, -1, "", 310, 237)

--Palette Select Left Arrow
palSelArrowLeft = animNew(sprSys, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
palSelArrowLScaleX = 0.45 --Scale X
palSelArrowLScaleY = 0.45 --Scale Y

palSelArrowLP1posX = 67 --Player 1 X-Axis
palSelArrowLP1posY = 228.5 --Player 1 Y-Axis

palSelArrowLP2posX = 264 --Player 2 X-Axis
palSelArrowLP2posY = 228.5 --Player 2 Y-Axis

--Palette Select Right Arrow
palSelArrowRight = animNew(sprSys, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
palSelArrowRScaleX = 0.45 --Scale X
palSelArrowRScaleY = 0.45 --Scale Y

palSelArrowRP1posX = 115 --Player 1 X-Axis
palSelArrowRP1posY = 228.5 --Player 1 Y-Axis

palSelArrowRP2posX = 312 --Player 2 X-Axis
palSelArrowRP2posY = 228.5 --Player 2 Y-Axis

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
selStage = animNew(sprSys, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStage, 83.5, 166)
animUpdate(selStage)

--Modern Stage Select
selStageM = animNew(sprSys, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStageM, 0.4, 63)
animUpdate(selStageM)
animSetScale(selStageM, 2.10, 2.10)

--Classic Stage 0 (Random Icon)
stage0 = animNew(sprSys, [[
110,3, 0,0,
]])
animAddPos(stage0, 115, 172)
animUpdate(stage0)
animSetScale(stage0, 0.98, 0.98)

--Modern Stage 0 (Random Icon)
stage0M = animNew(sprSys, [[
110,3, 0,0,
]])
animSetPos(stage0M, 66, 76)
animUpdate(stage0M)
animSetScale(stage0M, 2.09, 2.09)

--Classic Lock
stageLock = animNew(sprSys, [[
108,0, 0,0,
]])
animAddPos(stageLock, 144, 178)
animSetScale(stageLock, 0.10, 0.10)
animUpdate(stageLock)

--Modern Lock
stageMLock = animNew(sprSys, [[
108,0, 0,0,
]])
animAddPos(stageMLock, 130.5, 90)
animSetScale(stageMLock, 0.20, 0.20)
animUpdate(stageMLock)

--Classic Locked Fade Window
stageLockWindowBG = animNew(sprSys, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(stageLockWindowBG, 114, 172)
animSetScale(stageLockWindowBG, 91.5, 51)
animUpdate(stageLockWindowBG)

--Modern Locked Fade Window
stageMLockWindowBG = animNew(sprSys, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(stageMLockWindowBG, 64, 74)
animSetScale(stageMLockWindowBG, 192, 108)
animUpdate(stageMLockWindowBG)

--;===========================================================
--; ORDER SELECT AND VERSUS SCREEN COMMON SCREENPACK DEFINITION
--;===========================================================
txt_hints = createTextImg(font5, 0, 0, "", 160, 239)

function f_resetVersusLogo()
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
end

--Background Footer
footerBG = animNew(sprSys, [[
300,0, 0,128, -1
]])
animSetScale(footerBG, 1.2, 1.8)
animAddPos(footerBG, 160, 0)
animSetTile(footerBG, 1, 0)
animUpdate(footerBG)

--;===========================================================
--; ORDER SELECT SCREENPACK DEFINITION
--;===========================================================
txt_orderSelect = createTextImg(font14, 0, 0, "ORDER SELECT", 160, 10)
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
p1OrderCursor = animNew(sprSys, [[
195,0, 0,0, -1
]])
animSetScale(p1OrderCursor, 0.10, 0.10)
animUpdate(p1OrderCursor)

--P2 Order cursor
p2OrderCursor = animNew(sprSys, [[
195,1, 0,0, -1
]])
animSetScale(p2OrderCursor, 0.10, 0.10)
animUpdate(p2OrderCursor)

function drawOrderInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","80,"..inputHintYPos,"r","100,"..inputHintYPos,"w","179,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Edit Order", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 199.5, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

t_orderHints = {
	{text = "PRESS LEFT OR RIGHT TO EDIT THE CHARACTERS ORDER"},
	{text = "PRESS UP OR DOWN TO CHOOSE A CHARACTER"},
	{text = "RESS ENTER TO CONFIRM THE ORDER SELECTED"},
	{text = "ADD YOUR HINTS HERE"},
	{text = "ADD YOUR HINTS HERE"},
}

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
	{text = "KEEP START IN CHAR SELECT AND PRESS C or Z BUTTON"},
	{text = "WHEN CHARS GETTING BUG PRESS F4 TO RELOAD THE MATCH"},
	{text = "PRESS THE IMPR PANT KEY TO TAKE A SCREENSHOT"},
	--{text = "PRESS (RIGHT OR LEFT)+ Y + A TO CHANGE BETWEEN THE CHARACTERS IN TAG MODE"},
	--{text = "WHILE YOU FIGHT, PRESS Y + A TO ACTIVATE THE PARTNER ASSIST IN TAG MODE"},
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

function f_matchInfo() --Not draws! only prepare the info for use in versus screen
--Match Info Vars
	gameNo = gameNo+1
	bossNo = bossNo+1
	bonusNo = bonusNo+1
--Set Match Info Texts
	if data.gameMode == "arcade" and matchNo == data.rivalMatch then textImgSetText(txt_matchNo, "RIVAL MATCH") --Set rival match text
	elseif data.gameMode == "arcade" and matchNo ~= lastMatch then textImgSetText(txt_matchNo, "STAGE: "..matchNo) --Set Arcade Match Text
	elseif data.gameMode == "tower" and matchNo == 1 then textImgSetText(txt_matchNo, "LOW LEVEL") --Set Tower 1st Match Text
	elseif data.gameMode == "tower" and matchNo ~= lastMatch then textImgSetText(txt_matchNo, "FLOOR: "..matchNo-1) --Set Tower Match Text
	end
	if data.gameMode == "survival" or data.gameMode == "allroster" then textImgSetText(txt_gameNo, "REMAINING MATCHES: "..(lastMatch - gameNo)) --Set All Roster Match Text
	elseif data.gameMode == "vskumite" then textImgSetText(txt_gameNo, gameNo.."/"..data.kumite) --Set VS X Kumite Match Text
	elseif data.gameMode == "bossrush" then textImgSetText(txt_bossNo, "REMAINING BOSSES: "..(lastMatch - bossNo)) --Set Boss Rush Match Text
	elseif data.gameMode == "bonusrush" then textImgSetText(txt_bonusNo, "BONUS: "..bonusNo) --Set Bonus Rush Match Text
	elseif data.gameMode == "intermission" then textImgSetText(txt_gameNo, "EXTRA STAGE") --Set Intermission Match Text
	else textImgSetText(txt_gameNo, "MATCH: "..gameNo) --Set Versus Match Text
	end
--Set Final Matchs Text
	if data.gameMode == "arcade" and matchNo == lastMatch then textImgSetText(txt_matchNo, "FINAL STAGE") --Set Arcade Final Match Text
	elseif data.gameMode == "tower" and matchNo == lastMatch then textImgSetText(txt_matchNo, "LAST FLOOR") --Set Tower Final Match Text
	end
	if (data.gameMode == "survival" or data.gameMode == "allroster") and (lastMatch - gameNo == 0) then textImgSetText(txt_gameNo, "FINAL MATCH") --Set All Roster Final Match Text
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
				local currentMatch = previousMatches/2
				if tourneyFightNo+currentMatch == 1 then textImgSetText(txt_matchNo, tourneyState.." - 1ST MATCH")
				elseif tourneyFightNo+currentMatch == 2 then textImgSetText(txt_matchNo, tourneyState.." - 2ND MATCH")
				elseif tourneyFightNo+currentMatch == 3 then textImgSetText(txt_matchNo, tourneyState.." - 3RD MATCH")
				elseif tourneyFightNo+currentMatch >= 4 then textImgSetText(txt_matchNo, tourneyState.." - "..tourneyFightNo+currentMatch.."TH MATCH")
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
txt_rematch = createTextImg(font6, 0, 0, "P1 BATTLE OPTION", 86, 87)
txt_rematch2 = createTextImg(font6, 0, 0, "P2 BATTLE OPTION", 237, 87)
txt_rematchTime = createTextImg(jgFnt, 0, 0, "", 160, 55)

t_battleOption = {
	{id = textImgNew(), text = "REMATCH"},
	{id = textImgNew(), text = "CHARACTER SELECT"},
	{id = textImgNew(), text = "STAGE SELECT"},
	{id = textImgNew(), text = "MAIN MENU"},
}

t_battleOption2 = {
	{id = textImgNew(), text = t_battleOption[1].text}, --Get rematch text from above table
	{id = textImgNew(), text = t_battleOption[2].text},
	{id = textImgNew(), text = t_battleOption[3].text},
	{id = textImgNew(), text = t_battleOption[4].text},
}

--Rematch Window BG
rematchWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(rematchWindowBG, 0.4, 82)
animUpdate(rematchWindowBG)
animSetScale(rematchWindowBG, 1.005, 1.1)

--Rematch Window BG CPU
rematchCPUWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(rematchCPUWindowBG, 83.5, 82)
animUpdate(rematchCPUWindowBG)
animSetScale(rematchCPUWindowBG, 1.005, 1.1)

--Rematch Window BG Player 2
rematch2WindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(rematch2WindowBG, 168.4, 82)
animUpdate(rematch2WindowBG)
animSetScale(rematch2WindowBG, 1.005, 1.1)

--Rematch Input Hints Panel
function drawRematchInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"w","130,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 151, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

--;===========================================================
--; END RANKED MATCH SCREENPACK DEFINITION
--;===========================================================
txt_rankInfo = createTextImg(font5, 0, 0, "INFORMATION", 157, 111)
txt_rankESC = createTextImg(jgFnt, 5, 0, "PRESS ESC TO EXIT", 159, 151)
txt_rankText = createTextImg(jgFnt, 0, 0, "", 0, 0,0.56,0.56)
txt_rankMsg = "ONLINE MATCH RANKED HAS FINISHED"

--Ranked Info Window BG
rankWindowBG = animNew(sprSys, [[
230,1, 0,0, -1
]])
animSetPos(rankWindowBG, 83.5, 97)
animUpdate(rankWindowBG)
animSetScale(rankWindowBG, 1, 1)

--;===========================================================
--; SERVICE SCREENPACK
--;===========================================================
txt_service = createTextImg(jgFnt, 0, 0, "SELECT A SERVICE", 159, 13)
txt_serviceTime = createTextImg(jgFnt, 0, 0, "", 160, 122)

t_service = {
	{id = '', text = "DIFFICULTY LEVEL DOWN"},
	{id = '', text = "POWER WILL START AT MAX"},
	{id = '', text = "ENEMY LIFE AT 1/3"},
	{id = '', text = "CHANGE TEAM MODE"},
	{id = '', text = "DOUBLE DEFENCE"},
	{id = '', text = "NO SERVICE"},
}

t_lockedService = {
	{id = '', text = "This service is Unavailable in Co-Op Mode."},
}
for i=1, #t_lockedService do
	t_lockedService[i].id = createTextImg(font2, 0, 0, t_lockedService[i].text, 161, 210+i*15)
end

t_noService = {
	{id = '', text = "You have Disabled Change Characters by Quick Continue."},
}
for i=1, #t_noService do
	t_noService[i].id = createTextImg(font2, 0, 0, t_noService[i].text, 159.5, 210+i*15)
end

t_devService = {
	{id = '', text = "This service will be available coming soon."},
}
for i=1, #t_devService do
	t_devService[i].id = createTextImg(font2, 0, 0, t_devService[i].text, 161, 210+i*15)
end

--Service Input Hints Panel
function drawServiceInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"w","130,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 151, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

--;===========================================================
--; RESULTS SCREENPACK
--;===========================================================
txt_resultTitle = createTextImg(font14, 0, 0, "", 159, 20)
txt_resultNo = createTextImg(survNumFnt, 0, 1, "", 2, 150)
txt_resultWins = createTextImg(survNumFnt, 0, -1, "", 320, 110)
txt_resultLoses = createTextImg(survNumFnt, 0, -1, "", 320, 200)
txt_resultTime = createTextImg(jgFnt, 0, 1, "TIME: 9'99''999", 32, 220) --WIP
txt_resultScore = createTextImg(jgFnt, 0, 1, "SCORE: 999.999.999", 32, 234) --WIP
txt_resultRank = createTextImg(jgFnt, 0, 1, "RANK", 262, 205)
txt_resultName = createTextImg(font6, 0, 0, "", 0, 0)
txt_resultTeam = createTextImg(font6, 0, 0, "", 0, 0)

--Result BG
resultBG = animNew(sprSys, [[280,0, 0,0, -1]])
animAddPos(resultBG, 0, 0)
animUpdate(resultBG)

--Rank F
rankF = animNew(sprSys, [[
210,0, 0,0,
]])
animAddPos(rankF, 236, 205)
animUpdate(rankF)
animSetScale(rankF, 0.5, 0.5)

--Rank D-
rankDM = animNew(sprSys, [[
210,1, 0,0,
]])
animAddPos(rankDM, 236, 205)
animUpdate(rankDM)
animSetScale(rankDM, 0.5, 0.5)

--Rank D
rankD = animNew(sprSys, [[
210,2, 0,0,
]])
animAddPos(rankD, 236, 205)
animUpdate(rankD)
animSetScale(rankD, 0.5, 0.5)

--Rank D+
rankDP = animNew(sprSys, [[
210,3, 0,0,
]])
animAddPos(rankDP, 236, 205)
animUpdate(rankDP)
animSetScale(rankDP, 0.5, 0.5)

--Rank C
rankC = animNew(sprSys, [[
210,4, 0,0,
]])
animAddPos(rankC, 236, 205)
animUpdate(rankC)
animSetScale(rankC, 0.5, 0.5)

--Rank C+
rankCP = animNew(sprSys, [[
210,5, 0,0,
]])
animAddPos(rankCP, 236, 205)
animUpdate(rankCP)
animSetScale(rankCP, 0.5, 0.5)

--Rank B
rankB = animNew(sprSys, [[
210,6, 0,0,
]])
animAddPos(rankB, 236, 205)
animUpdate(rankB)
animSetScale(rankB, 0.5, 0.5)

--Rank B+
rankBP = animNew(sprSys, [[
210,7, 0,0,
]])
animAddPos(rankBP, 236, 205)
animUpdate(rankBP)
animSetScale(rankBP, 0.5, 0.5)

--Rank A
rankA = animNew(sprSys, [[
210,8, 0,0,
]])
animAddPos(rankA, 236, 205)
animUpdate(rankA)
animSetScale(rankA, 0.5, 0.5)

--Rank A+
rankAP = animNew(sprSys, [[
210,9, 0,0,
]])
animAddPos(rankAP, 236, 205)
animUpdate(rankAP)
animSetScale(rankAP, 0.5, 0.5)

--Rank S
rankS = animNew(sprSys, [[
210,10, 0,0,
]])
animAddPos(rankS, 236, 205)
animUpdate(rankS)
animSetScale(rankS, 0.5, 0.5)

--Rank S+
rankSP = animNew(sprSys, [[
210,11, 0,0,
]])
animAddPos(rankSP, 236, 205)
animUpdate(rankSP)
animSetScale(rankSP, 0.5, 0.5)

--Rank XS
rankXS = animNew(sprSys, [[
210,12, 0,0,
]])
animAddPos(rankXS, 232, 205)
animUpdate(rankXS)
animSetScale(rankXS, 0.5, 0.5)

--Rank GDLK
rankGDLK = animNew(sprSys, [[
210,13, 0,0,
]])
animAddPos(rankGDLK, 240, 205)
animUpdate(rankGDLK)
animSetScale(rankGDLK, 0.5, 0.5)

--;===========================================================
--; CONTINUE SCREENPACK DEFINITION
--;===========================================================
--Coins left text
txt_coins = createTextImg(jgFnt, 0, 1, "", 15, 30)
txt_cont = createTextImg(jgFnt, 0, 1, "", 158, 30)

--Background
contBG0 = animNew(sprCont, [[
1000,0, -32,8, -1
]])
animUpdate(contBG0)

--Black Background Cover Top
contBG1 = animNew(sprCont, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG1, -1)
animSetTile(contBG1, 1, 0)
animSetWindow(contBG1, 0, 0, 320, 40)
animSetAlpha(contBG1, 0, 0)
animUpdate(contBG1)

--Black Background Cover Bottom
contBG2 = animNew(sprCont, [[
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
	local hintFontYPos = 234
	drawInputHintsP1("a","0,200","b","20,200","c","40,200","x","0,"..inputHintYPos,"y","20,"..inputHintYPos,"z","40,"..inputHintYPos,"w","150,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Countdown", 61, 224)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Continue", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

--;===========================================================
--; GAME OVER SCREENPACK DEFINITION
--;===========================================================
function f_contTimerReset()
	contTimer = animNew(sprCont, [[
	2,0, 0,0, 1 --1
	2,1, 0,0, 1 --2
	2,2, 0,0, 1 --3
	2,3, 0,0, 3 --6
	2,4, 0,0, 3 --9
	2,5, 0,0, 1 --10
	2,6, 0,0, 3 --13
	2,7, 0,0, 2 --15
	2,8, 0,0, 2 --17
	2,9, 0,0, 2 --19
	2,10, 0,0, 1 --20
	2,11, 0,0, 5 --25
	2,12, 0,0, 5 --30
	2,13, 0,0, 1 --31
	2,14, 0,0, 1 --32
	2,15, 0,0, 3 --35
	2,16, 0,0, 3 --38
	2,17, 0,0, 1 --39
	2,18, 0,0, 5 --44
	2,19, 0,0, 1 --45
	2,20, 0,0, 4 --49
	2,21, 0,0, 1 --50
	2,22, 0,0, 1 --51
	2,23, 0,0, 1 --52
	2,24, 0,0, 2 --54
	2,25, 0,0, 1 --55
	2,26, 0,0, 5 --60
	2,27, 0,0, 5 --65
	2,28, 0,0, 1 --66
	2,29, 0,0, 3 --69
	2,30, 0,0, 2 --71
	3,0, 0,0, 6 --77
	3,1, 0,0, 54 --131
	3,2, 0,0, 4 --135
	3,3, 0,0, 4 --139
	3,4, 0,0, 4 --143
	3,5, 0,0, 4 --147
	3,6, 0,0, 44 --191
	3,7, 0,0, 9 --200
	3,8, 0,0, 4 --204
	3,9, 0,0, 3 --207
	3,10, 0,0, 2 --209
	3,11, 0,0, 2 --211
	3,12, 0,0, 1 --212
	3,13, 0,0, 2 --214
	3,14, 0,0, 1 --215
	3,15, 0,0, 1 --216
	3,16, 0,0, 2 --218
	3,17, 0,0, 1 --219
	3,18, 0,0, 1 --220
	3,19, 0,0, 1 --221
	4,0, 0,0, 1 --222
	4,1, 0,0, 2 --224
	4,2, 0,0, 2 --226
	4,3, 0,0, 2 --228
	4,4, 0,0, 2 --230
	4,5, 0,0, 2 --232
	4,6, 0,0, 2 --234
	4,7, 0,0, 1 --235
	4,8, 0,0, 2 --237
	4,9, 0,0, 3 --240
	4,10, 0,0, 4 --244
	4,11, 0,0, 9 --253
	4,12, 0,0, 5 --258
	4,13, 0,0, 4 --262
	4,14, 0,0, 4 --266
	4,15, 0,0, 4 --270
	4,16, 0,0, 4 --274
	4,17, 0,0, 44 --318
	4,18, 0,0, 9 --327
	4,19, 0,0, 4 --331
	4,20, 0,0, 3 --334
	4,21, 0,0, 2 --336
	4,22, 0,0, 2 --338
	4,23, 0,0, 1 --339
	4,24, 0,0, 2 --341
	4,25, 0,0, 1 --342
	4,26, 0,0, 1 --343
	4,27, 0,0, 2 --345
	4,28, 0,0, 1 --346
	4,29, 0,0, 1 --347
	4,30, 0,0, 1 --348
	5,0, 0,0, 1 --349
	5,1, 0,0, 2 --351
	5,2, 0,0, 2 --353
	5,3, 0,0, 2 --355
	5,4, 0,0, 2 --357
	5,5, 0,0, 2 --359
	5,6, 0,0, 2 --361
	5,7, 0,0, 1 --362
	5,8, 0,0, 2 --364
	5,9, 0,0, 3 --367
	5,10, 0,0, 4 --371
	5,11, 0,0, 9 --380
	5,12, 0,0, 5 --385
	5,13, 0,0, 4 --389
	5,14, 0,0, 4 --393
	5,15, 0,0, 4 --397
	5,16, 0,0, 4 --401
	5,17, 0,0, 44 --445
	5,18, 0,0, 9 --454
	5,19, 0,0, 4 --458
	5,20, 0,0, 3 --461
	5,21, 0,0, 2 --463
	5,22, 0,0, 2 --465
	5,23, 0,0, 1 --466
	5,24, 0,0, 2 --468
	5,25, 0,0, 1 --469
	5,26, 0,0, 1 --470
	5,27, 0,0, 2 --472
	5,28, 0,0, 1 --473
	5,29, 0,0, 1 --474
	5,30, 0,0, 1 --475
	6,0, 0,0, 1 --476
	6,1, 0,0, 2 --478
	6,2, 0,0, 2 --480
	6,3, 0,0, 2 --482
	6,4, 0,0, 2 --484
	6,5, 0,0, 2 --486
	6,6, 0,0, 2 --488
	6,7, 0,0, 1 --489
	6,8, 0,0, 2 --491
	6,9, 0,0, 3 --494
	6,10, 0,0, 4 --498
	6,11, 0,0, 9 --507
	6,12, 0,0, 5 --512
	6,13, 0,0, 4 --516
	6,14, 0,0, 4 --520
	6,15, 0,0, 4 --524
	6,16, 0,0, 4 --528
	6,17, 0,0, 44 --572
	6,18, 0,0, 9 --581
	6,19, 0,0, 4 --585
	6,20, 0,0, 3 --588
	6,21, 0,0, 2 --590
	6,22, 0,0, 2 --592
	6,23, 0,0, 1 --593
	6,24, 0,0, 2 --595
	6,25, 0,0, 1 --596
	6,26, 0,0, 1 --597
	6,27, 0,0, 2 --599
	6,28, 0,0, 1 --600
	6,29, 0,0, 1 --601
	6,30, 0,0, 1 --602
	7,0, 0,0, 1 --603
	7,1, 0,0, 2 --605
	7,2, 0,0, 2 --607
	7,3, 0,0, 2 --609
	7,4, 0,0, 2 --611
	7,5, 0,0, 2 --613
	7,6, 0,0, 2 --615
	7,7, 0,0, 1 --616
	7,8, 0,0, 2 --618
	7,9, 0,0, 3 --621
	7,10, 0,0, 4 --625
	7,11, 0,0, 9 --634
	7,12, 0,0, 5 --639
	7,13, 0,0, 4 --643
	7,14, 0,0, 4 --647
	7,15, 0,0, 4 --651
	7,16, 0,0, 4 --655
	7,17, 0,0, 44 --699
	7,18, 0,0, 9 --708
	7,19, 0,0, 4 --712
	7,20, 0,0, 3 --715
	7,21, 0,0, 2 --717
	7,22, 0,0, 2 --719
	7,23, 0,0, 1 --720
	7,24, 0,0, 2 --722
	7,25, 0,0, 1 --723
	7,26, 0,0, 1 --724
	7,27, 0,0, 2 --726
	7,28, 0,0, 1 --727
	7,29, 0,0, 1 --728
	7,30, 0,0, 1 --729
	8,0, 0,0, 1 --730
	8,1, 0,0, 2 --732
	8,2, 0,0, 2 --734
	8,3, 0,0, 2 --736
	8,4, 0,0, 2 --738
	8,5, 0,0, 2 --740
	8,6, 0,0, 2 --742
	8,7, 0,0, 1 --743
	8,8, 0,0, 2 --745
	8,9, 0,0, 3 --748
	8,10, 0,0, 4 --752
	8,11, 0,0, 9 --761
	8,12, 0,0, 5 --766
	8,13, 0,0, 4 --770
	8,14, 0,0, 4 --774
	8,15, 0,0, 4 --778
	8,16, 0,0, 4 --782
	8,17, 0,0, 44 --826
	8,18, 0,0, 9 --835
	8,19, 0,0, 4 --839
	8,20, 0,0, 3 --842
	8,21, 0,0, 2 --844
	8,22, 0,0, 2 --846
	8,23, 0,0, 1 --847
	8,24, 0,0, 2 --849
	8,25, 0,0, 1 --850
	8,26, 0,0, 1 --851
	8,27, 0,0, 2 --853
	8,28, 0,0, 1 --854
	8,29, 0,0, 1 --855
	8,30, 0,0, 1 --856
	9,0, 0,0, 1 --857
	9,1, 0,0, 2 --859
	9,2, 0,0, 2 --861
	9,3, 0,0, 2 --863
	9,4, 0,0, 2 --865
	9,5, 0,0, 2 --867
	9,6, 0,0, 2 --869
	9,7, 0,0, 1 --870
	9,8, 0,0, 2 --872
	9,9, 0,0, 3 --875
	9,10, 0,0, 4 --879
	9,11, 0,0, 9 --888
	9,12, 0,0, 5 --893
	9,13, 0,0, 4 --897
	9,14, 0,0, 4 --901
	9,15, 0,0, 4 --905
	9,16, 0,0, 4 --909
	9,17, 0,0, 44 --953
	9,18, 0,0, 9 --962
	9,19, 0,0, 4 --966
	9,20, 0,0, 3 --969
	9,21, 0,0, 2 --971
	9,22, 0,0, 2 --973
	9,23, 0,0, 1 --974
	9,24, 0,0, 2 --976
	9,25, 0,0, 1 --977
	9,26, 0,0, 1 --978
	9,27, 0,0, 2 --980
	9,28, 0,0, 1 --981
	9,29, 0,0, 1 --982
	9,30, 0,0, 1 --983
	10,0, 0,0, 1 --984
	10,1, 0,0, 2 --986
	10,2, 0,0, 2 --988
	10,3, 0,0, 2 --990
	10,4, 0,0, 2 --992
	10,5, 0,0, 2 --994
	10,6, 0,0, 2 --996
	10,7, 0,0, 1 --997
	10,8, 0,0, 2 --999
	10,9, 0,0, 3 --1002
	10,10, 0,0, 4 --1006
	10,11, 0,0, 9 --1015
	10,12, 0,0, 5 --1020
	10,13, 0,0, 4 --1024
	10,14, 0,0, 4 --1028
	10,15, 0,0, 4 --1032
	10,16, 0,0, 4 --1036
	10,17, 0,0, 44 --1080
	10,18, 0,0, 9 --1089
	10,19, 0,0, 4 --1093
	10,20, 0,0, 3 --1096
	10,21, 0,0, 2 --1098
	10,22, 0,0, 2 --1100
	10,23, 0,0, 1 --1101
	10,24, 0,0, 2 --1103
	10,25, 0,0, 1 --1104
	10,26, 0,0, 1 --1105
	10,27, 0,0, 2 --1107
	10,28, 0,0, 1 --1108
	10,29, 0,0, 1 --1109
	10,30, 0,0, 1 --1110
	11,0, 0,0, 1 --1111
	11,1, 0,0, 2 --1113
	11,2, 0,0, 2 --1115
	11,3, 0,0, 2 --1117
	11,4, 0,0, 2 --1119
	11,5, 0,0, 2 --1121
	11,6, 0,0, 2 --1123
	11,7, 0,0, 1 --1124
	11,8, 0,0, 2 --1126
	11,9, 0,0, 3 --1129
	11,10, 0,0, 4 --1133
	11,11, 0,0, 9 --1142
	11,12, 0,0, 5 --1147
	11,13, 0,0, 4 --1151
	11,14, 0,0, 4 --1155
	11,15, 0,0, 4 --1159
	11,16, 0,0, 4 --1163
	11,17, 0,0, 44 --1207
	11,18, 0,0, 9 --1216
	11,19, 0,0, 4 --1220
	11,20, 0,0, 3 --1223
	11,21, 0,0, 2 --1225
	11,22, 0,0, 2 --1227
	11,23, 0,0, 1 --1228
	11,24, 0,0, 2 --1230
	11,25, 0,0, 1 --1231
	11,26, 0,0, 1 --1232
	11,27, 0,0, 2 --1234
	11,28, 0,0, 1 --1235
	11,29, 0,0, 1 --1236
	11,30, 0,0, 1 --1237
	12,0, 0,0, 1 --1238
	12,1, 0,0, 2 --1240
	12,2, 0,0, 2 --1242
	12,3, 0,0, 2 --1244
	12,4, 0,0, 2 --1246
	12,5, 0,0, 2 --1248
	12,6, 0,0, 2 --1250
	12,7, 0,0, 1 --1251
	12,8, 0,0, 2 --1253
	12,9, 0,0, 3 --1256
	12,10, 0,0, 4 --1260
	12,11, 0,0, 9 --1269
	12,12, 0,0, 5 --1274
	12,13, 0,0, 4 --1278
	12,14, 0,0, 4 --1282
	12,15, 0,0, 4 --1286
	12,16, 0,0, 4 --1290
	12,17, 0,0, 75 --1365
	12,18, 0,0, 1 --1366
	]])
	--black background for 1 frame
	animAddPos(contTimer, -53, 0)
end

function f_gameOverReset()
	gameOver = animNew(sprCont, [[
	100,0, 0,0, 1 --1
	100,1, 0,0, 1 --2
	100,2, 0,0, 1 --3
	100,3, 0,0, 1 --4
	100,4, 0,0, 1 --5
	100,5, 0,0, 1 --6
	100,6, 0,0, 1 --7
	100,7, 0,0, 1 --8
	100,8, 0,0, 1 --9
	100,9, 0,0, 1 --10
	100,10, 0,0, 1 --11
	100,11, 0,0, 1 --12
	100,12, 0,0, 1 --13
	100,13, 0,0, 1 --14
	100,14, 0,0, 1 --15
	100,15, 0,0, 1 --16
	100,16, 0,0, 1 --17
	100,17, 0,0, 1 --18
	100,18, 0,0, 1 --19
	100,19, 0,0, 1 --20
	100,20, 0,0, 1 --21
	100,21, 0,0, 1 --22
	100,22, 0,0, 1 --23
	100,23, 0,0, 1 --24
	100,24, 0,0, 1 --25
	100,25, 0,0, 1 --26
	100,26, 0,0, 1 --27
	100,27, 0,0, 1 --28
	100,28, 0,0, 1 --29
	100,29, 0,0, 1 --30
	100,30, 0,0, 1 --31
	100,31, 0,0, 1 --32
	101,0, 0,0, 1 --33
	101,1, 0,0, 1 --34
	101,2, 0,0, 1 --35
	101,3, 0,0, 1 --36
	101,4, 0,0, 1 --37
	101,5, 0,0, 1 --38
	101,6, 0,0, 1 --39
	101,7, 0,0, 1 --40
	101,8, 0,0, 1 --41
	101,9, 0,0, 1 --42
	101,10, 0,0, 1 --43
	101,11, 0,0, 1 --44
	101,12, 0,0, 1 --45
	101,13, 0,0, 1 --46
	101,14, 0,0, 1 --47
	101,15, 0,0, 1 --48
	101,16, 0,0, 1 --49
	101,17, 0,0, 1 --50
	101,18, 0,0, 1 --51
	101,19, 0,0, 1 --52
	101,20, 0,0, 1 --53
	101,21, 0,0, 1 --54
	101,22, 0,0, 1 --55
	101,23, 0,0, 1 --56
	101,24, 0,0, 1 --57
	101,25, 0,0, 1 --58
	101,26, 0,0, 1 --59
	101,27, 0,0, 1 --60
	101,28, 0,0, 1 --61
	101,29, 0,0, 1 --62
	101,30, 0,0, 1 --63
	101,31, 0,0, 1 --64
	101,32, 0,0, 1 --65
	101,33, 0,0, 1 --66
	101,34, 0,0, 1 --67
	101,35, 0,0, 1 --68
	101,36, 0,0, 1 --69
	101,37, 0,0, 1 --70
	101,38, 0,0, 1 --71
	101,39, 0,0, 1 --72
	101,40, 0,0, 1 --73
	101,41, 0,0, 1 --74
	101,42, 0,0, 1 --75
	101,43, 0,0, 1 --76
	101,44, 0,0, 1 --77
	101,45, 0,0, 1 --78
	101,46, 0,0, 1 --79
	101,47, 0,0, 1 --80
	101,48, 0,0, 1 --81
	101,49, 0,0, 1 --82
	101,50, 0,0, 1 --83
	101,51, 0,0, 1 --84
	101,52, 0,0, 1 --85
	101,53, 0,0, 1 --86
	101,54, 0,0, 1 --87
	101,55, 0,0, 1 --88
	101,56, 0,0, 1 --89
	101,57, 0,0, 1 --90
	101,58, 0,0, 1 --91
	101,59, 0,0, 1 --92
	101,60, 0,0, 1 --93
	101,61, 0,0, 1 --94
	101,62, 0,0, 1 --95
	101,63, 0,0, 1 --96
	101,64, 0,0, 1 --97
	101,65, 0,0, 1 --98
	101,66, 0,0, 1 --99
	101,67, 0,0, 1 --100
	101,68, 0,0, 1 --101
	101,69, 0,0, 1 --102
	101,70, 0,0, 1 --103
	101,71, 0,0, 1 --104
	101,72, 0,0, 1 --105
	101,73, 0,0, 1 --106
	101,74, 0,0, 1 --107
	101,75, 0,0, 119 --226
	101,75, 0,0, -1
	]])
	--black background for 24 frames
	animAddPos(gameOver, -53, 0)
end

--;=================================================================================================
--; TOWER DESTINY SCREENPACK DEFINITION
--;=================================================================================================
txt_towerSelect = createTextImg(font35, 0, 0, "CHOOSE YOUR DESTINY", 159, 13, 0.5, 0.5)
txt_destinyTime = createTextImg(jgFnt, 0, 0, "", 160, 28)

--Destiny Select BG
destinyBG = animNew(sprTower, [[
1,0, 0,0, -1
]])
animAddPos(destinyBG, -55, 0)
animUpdate(destinyBG)
animSetScale(destinyBG, 1.1, 1)

--Destiny Cursor
destinyCursor = animNew(sprTower, [[
2,0, 0,0, 3
2,1, 0,0, 3
2,2, 0,0, 3
2,3, 0,0, 3
2,4, 0,0, 3
2,5, 0,0, 3
2,6, 0,0, 3
2,7, 0,0, 3
2,8, 0,0, 3
2,9, 0,0, 3
2,10, 0,0, 3
2,11, 0,0, 3
2,12, 0,0, 3
2,13, 0,0, 3
2,14, 0,0, 3
2,15, 0,0, 3
2,16, 0,0, 3
2,17, 0,0, 3
2,18, 0,0, 3
2,19, 0,0, 3
2,20, 0,0, 3
2,21, 0,0, 3
2,22, 0,0, 3
2,23, 0,0, 3
]])
animSetScale(destinyCursor, 0.135, 0.135)
animSetAlpha(destinyCursor, 188, 0)
animUpdate(destinyCursor)

--Tower Slot
towerSlot = animNew(sprTower, [[3,0, 0,0,]])
animSetScale(towerSlot, 0.5, 0.5)
animUpdate(towerSlot)

--Tower Stage Preview (Random Icon)
towerStgPreview = animNew(sprSys, [[
110,3, 0,0,
]])
animUpdate(towerStgPreview)
animSetScale(towerStgPreview, 0.79, 0.50)

--Tower Input Hints Panel
function drawTowerInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("l","0,"..inputHintYPos,"r","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

--;=================================================================================================
--; TOWER BATTLE PLAN SCREENPACK DEFINITION
--;=================================================================================================
--Final Destiny BG
destinyFinalBG = animNew(sprTower, [[
1,1, 0,0, -1
]])
animAddPos(destinyFinalBG, 0, 0)
animUpdate(destinyFinalBG)
animSetScale(destinyFinalBG, 1.1, 1)

--Tower Slot
battleSlot = animNew(sprTower, [[3,1, 0,0,]])
animSetScale(battleSlot, 1.3, 1.3)
animUpdate(battleSlot)

--VS Preview
vsPreview = animNew(sprTower, [[4,1, 0,0,]])
animAddPos(vsPreview, 138, 113)
animUpdate(vsPreview)
animSetScale(vsPreview, 0.75, 0.75)

--Stage Preview (Random Icon)
battleStgPreview = animNew(sprSys, [[
110,3, 0,0,
]])
animUpdate(battleStgPreview)
animSetScale(battleStgPreview, 1.53, 1.34)

--;===========================================================
--; TOURNAMENT SETTINGS SCREENPACK DEFINITION
--;===========================================================
txt_tourneyCfg = createTextImg(jgFnt, 0, 0, "TOURNAMENT RULES", 159, 13)

t_tourneyCfg = {
	{varID = textImgNew(), text = "Max Participants",	     	varText = data.tourneySize},
	--{varID = textImgNew(), text = "Format",				       	varText = data.tourneyType},
	--{varID = textImgNew(), text = "Team Mode",		       		varText = data.tourneyTeam},
	{varID = textImgNew(), text = "Character Select",		 	varText = data.tourneyCharSel},
	{varID = textImgNew(), text = "Stage Select",			 	varText = data.tourneyStgSel},
	{varID = textImgNew(), text = "Time Limit",         		varText = data.tourneyRoundTime},
	{varID = textImgNew(), text = "Rounds to Win",      		varText = data.tourneyRoundsNum},
	{varID = textImgNew(), text = "Matchs to Win",              varText = data.tourneyMatchsNum},
	--{varID = textImgNew(), text = "3rd Place Match",    		varText = data.tourney3rdPlace},
	{varID = textImgNew(), text = "    CREATE TOURNAMENT",  			varText = ""},
}

--Input Hints Panel
function drawTourneyInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

--4 Players Grid
tourney4 = animNew(sprTourney, [[
1,4, 0,0, -1
]])

--8 Players Grid
tourney8 = animNew(sprTourney, [[
1,8, 0,0, -1
]])

--16 Players Grid
tourney16 = animNew(sprTourney, [[
1,16, 0,0, -1
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
	if data.debugLog then f_printTable(t_tourneyMenu, "save/debug/t_tourneyMenu.txt") end
end

--P1 active cursor
tourneyP1Cursor = animNew(sprTourney, [[
2,1, 0,0, -1
]])

--P2 active cursor
tourneyP2Cursor = animNew(sprTourney, [[
2,3, 0,0, -1
]])

--Player 1 Control
tourneyP1 = animNew(sprTourney, [[
4,1, 0,0, -1
]])

--Player 2 Control
tourneyP2 = animNew(sprTourney, [[
4,2, 0,0, -1
]])

--CPU Level 1
tourneyAI1 = animNew(sprTourney, [[
3,1, 0,0, -1
]])

--CPU Level 2
tourneyAI2 = animNew(sprTourney, [[
3,2, 0,0, -1
]])

--CPU Level 3
tourneyAI3 = animNew(sprTourney, [[
3,3, 0,0, -1
]])

--CPU Level 4
tourneyAI4 = animNew(sprTourney, [[
3,4, 0,0, -1
]])

--CPU Level 5
tourneyAI5 = animNew(sprTourney, [[
3,5, 0,0, -1
]])

--CPU Level 6
tourneyAI6 = animNew(sprTourney, [[
3,6, 0,0, -1
]])

--CPU Level 7
tourneyAI7 = animNew(sprTourney, [[
3,7, 0,0, -1
]])

--CPU Level 8
tourneyAI8 = animNew(sprTourney, [[
3,8, 0,0, -1
]])

--Random Icon
tourneyRandomIcon = animNew(sprTourney, [[
2,0, 0,0, -1
]])

--Input Hints BG
tourneyInputsBG = animNew(sprSys, [[
230,3, 0,0, -1
]])
animSetScale(tourneyInputsBG, 2.9, 0.75)
animSetAlpha(tourneyInputsBG, 155, 22)

--Tournament Not Started Input Hints Panel
function drawTourneyInputHints2()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	animPosDraw(tourneyInputsBG, -56, 195) --Draw Input Hints BG
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"e","120,"..inputHintYPos,"y","185,"..inputHintYPos,"q","245,"..inputHintYPos,"a","0,197","s","120,197","w","245,197")
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Set Control", 22, 210)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start Tourney", 142, 210)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Edit Slot", 266, 210)
	--
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Hide", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

--Tournament Started Input Hints Panel
function drawTourneyInputHints3()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	animPosDraw(tourneyInputsBG, -56, 215) --Draw Input Hints BG
	drawInputHintsP1("w","0,"..inputHintYPos,"e","120,"..inputHintYPos,"y","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Start Next Match", 21, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Exit", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Hide", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

--;===========================================================
--; TOURNAMENT CHAMPION SCREENPACK DEFINITION
--;===========================================================
txt_tourneyChampionTitle = createTextImg(font21, 0, 0, "CONGRATULATIONS!", 159, 18) 
txt_tourneyPlace1 = createTextImg(font13, 0, 0, "", 163, 157, 0.65, 0.65)
txt_tourneyPlace2 = createTextImg(font13, 0, 0, "", 62, 182, 0.65, 0.65)
txt_tourneyPlace3 = createTextImg(font13, 0, 0, "", 261, 201, 0.65, 0.65)

--Awards Assets (Single Elimination) Unused
tourneyAwards1 = animNew(sprTourney, [[
5,1, 0,0, -1
]])
animAddPos(tourneyAwards1, 0, 100)
animUpdate(tourneyAwards1)

--Awards Assets (Double Elimination)
tourneyAwards2 = animNew(sprTourney, [[
5,2, 0,0, -1
]])
animAddPos(tourneyAwards2, 0, 0)
animUpdate(tourneyAwards2)

--;===========================================================
--; CREDITS SCREEN SCREENPACK DEFINITION
--;===========================================================
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
2DEE4EVER
LEVEN2IS2LIJDEN
BRUCELEE-WT7HK
ERU GURARA
HERMES
MORIA MORTIMORTE
PIZZADARIUS25
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