--;===========================================================
--; SCREENPACK ASSETS DEFINITION
--;===========================================================
--SFF (Sprites)
fadeSff = sffNew("data/screenpack/fade.sff") --load fade sprites
sysSff = sffNew("data/screenpack/system.sff") --load screenpack/menu sprites
glyphsSff = sffNew("data/screenpack/glyphs.sff") --load movelist sprites
btnSff = sffNew("data/screenpack/buttons.sff") --load input hints sprites
contSff = sffNew("data/screenpack/continue.sff") --load continue sprites
missionSff = sffNew("data/screenpack/missions.sff") --load missions menu sprites
eventSff = sffNew("data/screenpack/events.sff") --load events menu sprites
gallerySff = sffNew("data/screenpack/gallery.sff") --load gallery sprites
storySff = sffNew("data/screenpack/story.sff") --load story sprites
vnSff = sffNew("data/screenpack/visualnovel.sff") --load visual novel sprites
towerSff = sffNew("data/screenpack/tower.sff") --load tower sprites
--[[
tourneySff = sffNew("data/screenpack/tourney.sff") --load tourney sprites
adventureSff = sffNew("data/screenpack/adventure.sff") --load adventure sprites
]]

--Fonts (At the moments only FNT Format is Supported)
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

--SND (Sound effects do not interrupt music/bgm)
sysSnd = sndNew("data/screenpack/system.snd")
announcerSnd = sndNew("data/screenpack/announcer.snd")
contSnd = sndNew("data/screenpack/continue.snd")

--;=================================================================
--; SOUNDTRACK DEFINITION (ONLY MP3 and OGG formats are Supported)
--;=================================================================
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
bgmAdventure = "sound/System/Adventure.mp3"

--;===========================================================
--; MOVIE DEFINITION
--;===========================================================
videoHowToPlay = "movie/How To Play.wmv"
videoOpening = "movie/Opening.wmv"

--;===========================================================
--; MOVELIST SCREENPACK
--;===========================================================
--glyphs spr data
t_glyphs = {
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
--; INPUT HINTS MENU PANEL
--;===========================================================
--Load Buttons Sprites
btn0 = animNew(btnSff, [[0,0, 0,0, -1]])
btn1 = animNew(btnSff, [[0,1, 0,0, -1]])
btn2 = animNew(btnSff, [[0,2, 0,0, -1]])
btn3 = animNew(btnSff, [[0,3, 0,0, -1]])
btn4 = animNew(btnSff, [[0,4, 0,0, -1]])
btn5 = animNew(btnSff, [[0,5, 0,0, -1]])
btn6 = animNew(btnSff, [[0,6, 0,0, -1]])
btn7 = animNew(btnSff, [[0,7, 0,0, -1]])
btn8 = animNew(btnSff, [[0,8, 0,0, -1]])
btn9 = animNew(btnSff, [[0,9, 0,0, -1]])
btnA = animNew(btnSff, [[0,10, 0,0, -1]])
btnB = animNew(btnSff, [[0,11, 0,0, -1]])
btnC = animNew(btnSff, [[0,12, 0,0, -1]])
btnD = animNew(btnSff, [[0,13, 0,0, -1]])
btnE = animNew(btnSff, [[0,14, 0,0, -1]])
btnF = animNew(btnSff, [[0,15, 0,0, -1]])
btnG = animNew(btnSff, [[0,16, 0,0, -1]])
btnH = animNew(btnSff, [[0,17, 0,0, -1]])
btnI = animNew(btnSff, [[0,18, 0,0, -1]])
btnJ = animNew(btnSff, [[0,19, 0,0, -1]])
btnK = animNew(btnSff, [[0,20, 0,0, -1]])
btnL = animNew(btnSff, [[0,21, 0,0, -1]])
btnM = animNew(btnSff, [[0,22, 0,0, -1]])
btnN = animNew(btnSff, [[0,23, 0,0, -1]])
btnO = animNew(btnSff, [[0,24, 0,0, -1]])
btnP = animNew(btnSff, [[0,25, 0,0, -1]])
btnQ = animNew(btnSff, [[0,26, 0,0, -1]])
btnR = animNew(btnSff, [[0,27, 0,0, -1]])
btnS = animNew(btnSff, [[0,28, 0,0, -1]])
btnT = animNew(btnSff, [[0,29, 0,0, -1]])
btnU = animNew(btnSff, [[0,30, 0,0, -1]])
btnV = animNew(btnSff, [[0,31, 0,0, -1]])
btnW = animNew(btnSff, [[0,32, 0,0, -1]])
btnX = animNew(btnSff, [[0,33, 0,0, -1]])
btnY = animNew(btnSff, [[0,34, 0,0, -1]])
btnZ = animNew(btnSff, [[0,35, 0,0, -1]])
btnPERIOD = animNew(btnSff, [[0,36, 0,0, -1]])
btnCOMMA = animNew(btnSff, [[0,37, 0,0, -1]])
--btnDOUBLEPERIOD = animNew(btnSff, [[0,38, 0,0, -1]])
--btnPERIODANDCOMMA = animNew(btnSff, [[0,39, 0,0, -1]])
btnMINUS = animNew(btnSff, [[0,40, 0,0, -1]])
btnLEFTBRACKET = animNew(btnSff, [[0,41, 0,0, -1]])
btnRIGHTBRACKET = animNew(btnSff, [[0,42, 0,0, -1]])
btnSLASH = animNew(btnSff, [[0,43, 0,0, -1]])
btnBACKSLASH = animNew(btnSff, [[0,44, 0,0, -1]])
btnLSHIFT = animNew(btnSff, [[0,45, 0,0, -1]])
btnRSHIFT = animNew(btnSff, [[0,46, 0,0, -1]])
--btnLALT = animNew(btnSff, [[0,47, 0,0, -1]])
--btnRALT = animNew(btnSff, [[0,48, 0,0, -1]])
--btnLCTRL = animNew(btnSff, [[0,49, 0,0, -1]])
--btnRCTRL = animNew(btnSff, [[0,50, 0,0, -1]])
btnTAB = animNew(btnSff, [[0,51, 0,0, -1]])
btnSPACE = animNew(btnSff, [[0,52, 0,0, -1]])
btnRETURN = animNew(btnSff, [[0,53, 0,0, -1]])
btnBACKSPACE = animNew(btnSff, [[0,54, 0,0, -1]])
btnHOME = animNew(btnSff, [[0,55, 0,0, -1]])
btnEND = animNew(btnSff, [[0,56, 0,0, -1]])
btnPAGEUP = animNew(btnSff, [[0,57, 0,0, -1]])
btnPAGEDOWN = animNew(btnSff, [[0,58, 0,0, -1]])
btnUP = animNew(btnSff, [[0,59, 0,0, -1]])
btnDOWN = animNew(btnSff, [[0,60, 0,0, -1]])
btnLEFT = animNew(btnSff, [[0,61, 0,0, -1]])
btnRIGHT = animNew(btnSff, [[0,62, 0,0, -1]])
btnKP_0 = animNew(btnSff, [[0,63, 0,0, -1]])
btnKP_1 = animNew(btnSff, [[0,64, 0,0, -1]])
btnKP_2 = animNew(btnSff, [[0,65, 0,0, -1]])
btnKP_3 = animNew(btnSff, [[0,66, 0,0, -1]])
btnKP_4 = animNew(btnSff, [[0,67, 0,0, -1]])
btnKP_5 = animNew(btnSff, [[0,68, 0,0, -1]])
btnKP_6 = animNew(btnSff, [[0,69, 0,0, -1]])
btnKP_7 = animNew(btnSff, [[0,70, 0,0, -1]])
btnKP_8 = animNew(btnSff, [[0,71, 0,0, -1]])
btnKP_9 = animNew(btnSff, [[0,72, 0,0, -1]])
btnKP_PERIOD = animNew(btnSff, [[0,73, 0,0, -1]])
btnKP_DIVIDE = animNew(btnSff, [[0,74, 0,0, -1]])
btnKP_MULTIPLY = animNew(btnSff, [[0,75, 0,0, -1]])
btnKP_MINUS = animNew(btnSff, [[0,76, 0,0, -1]])
btnKP_PLUS = animNew(btnSff, [[0,77, 0,0, -1]])
btnKP_ENTER = animNew(btnSff, [[0,78, 0,0, -1]])
btnNIL = animNew(btnSff, [[1,0, 0,0, -1]])

--Associate Button Key to Button Sprite
t_btnHint = {
	{keyTxt = "_0",				keySpr = btn0},
	{keyTxt = "_1", 			keySpr = btn1},
	{keyTxt = "_2", 			keySpr = btn2},
	{keyTxt = "_3", 			keySpr = btn3},
	{keyTxt = "_4", 			keySpr = btn4},
	{keyTxt = "_5", 			keySpr = btn5},
	{keyTxt = "_6", 			keySpr = btn6},
	{keyTxt = "_7", 			keySpr = btn7},
	{keyTxt = "_8", 			keySpr = btn8},
	{keyTxt = "_9", 			keySpr = btn9},
	{keyTxt = "a", 				keySpr = btnA},
	{keyTxt = "b", 				keySpr = btnB},
	{keyTxt = "c", 				keySpr = btnC},
	{keyTxt = "d", 				keySpr = btnD},
	{keyTxt = "e", 				keySpr = btnE},
	{keyTxt = "f", 				keySpr = btnF},
	{keyTxt = "g", 				keySpr = btnG},
	{keyTxt = "h", 				keySpr = btnH},
	{keyTxt = "i", 				keySpr = btnI},
	{keyTxt = "j", 				keySpr = btnJ},
	{keyTxt = "k", 				keySpr = btnK},
	{keyTxt = "l",				keySpr = btnL},
	{keyTxt = "m", 				keySpr = btnM},
	{keyTxt = "n", 				keySpr = btnN},
	{keyTxt = "o", 				keySpr = btnO},
	{keyTxt = "p", 				keySpr = btnP},
	{keyTxt = "q", 				keySpr = btnQ},
	{keyTxt = "r", 				keySpr = btnR},
	{keyTxt = "s", 				keySpr = btnS},
	{keyTxt = "t", 				keySpr = btnT},
	{keyTxt = "u", 				keySpr = btnU},
	{keyTxt = "v", 				keySpr = btnV},
	{keyTxt = "w", 				keySpr = btnW},
	{keyTxt = "x", 				keySpr = btnX},
	{keyTxt = "y", 				keySpr = btnY},
	{keyTxt = "z", 				keySpr = btnZ},
	{keyTxt = "PERIOD", 		keySpr = btnPERIOD},
	{keyTxt = "COMMA", 			keySpr = btnCOMMA},
	{keyTxt = "MINUS", 			keySpr = btnMINUS},
	{keyTxt = "LEFTBRACKET", 	keySpr = btnLEFTBRACKET},
	{keyTxt = "RIGHTBRACKET", 	keySpr = btnRIGHTBRACKET},
	{keyTxt = "BACKSLASH", 		keySpr = btnBACKSLASH},
	{keyTxt = "LSHIFT", 		keySpr = btnLSHIFT},
	{keyTxt = "RSHIFT", 		keySpr = btnRSHIFT},
	{keyTxt = "TAB", 			keySpr = btnTAB},
	{keyTxt = "SPACE", 			keySpr = btnSPACE},
	{keyTxt = "RETURN", 		keySpr = btnRETURN},
	{keyTxt = "BACKSPACE", 		keySpr = btnBACKSPACE},
	{keyTxt = "HOME", 			keySpr = btnHOME},
	{keyTxt = "END", 			keySpr = btnEND},
	{keyTxt = "PAGEUP", 		keySpr = btnPAGEUP},
	{keyTxt = "PAGEDOWN", 		keySpr = btnPAGEDOWN},
	{keyTxt = "UP", 			keySpr = btnUP},
	{keyTxt = "DOWN", 			keySpr = btnDOWN},
	{keyTxt = "LEFT", 			keySpr = btnLEFT},
	{keyTxt = "RIGHT", 			keySpr = btnRIGHT},
	{keyTxt = "KP_0", 			keySpr = btnKP_0},
	{keyTxt = "KP_1", 			keySpr = btnKP_1},
	{keyTxt = "KP_2", 			keySpr = btnKP_2},
	{keyTxt = "KP_3",			keySpr = btnKP_3},
	{keyTxt = "KP_4", 			keySpr = btnKP_4},
	{keyTxt = "KP_5", 			keySpr = btnKP_5},
	{keyTxt = "KP_6", 			keySpr = btnKP_6},
	{keyTxt = "KP_7", 			keySpr = btnKP_7},
	{keyTxt = "KP_8", 			keySpr = btnKP_8},
	{keyTxt = "KP_9", 			keySpr = btnKP_9},
	{keyTxt = "KP_PERIOD", 		keySpr = btnKP_PERIOD},
	{keyTxt = "KP_DIVIDE", 		keySpr = btnKP_DIVIDE},
	{keyTxt = "KP_MULTIPLY", 	keySpr = btnKP_MULTIPLY},
	{keyTxt = "KP_MINUS", 		keySpr = btnKP_MINUS},
	{keyTxt = "KP_PLUS", 		keySpr = btnKP_PLUS},
	{keyTxt = "KP_ENTER", 		keySpr = btnKP_ENTER},
	{keyTxt = "NIL", 			keySpr = btnNIL},
}

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
--; TITLE SCREEN SCREENPACK
--;===========================================================
txt_mainTitle = createTextImg(jgFnt, 5, 0, "-- PRESS START --", 159, 170)
--txt_version = createTextImg(font1, 0, -1, "v1.?.0", 319, 240)
txt_version = createTextImg(font1, 0, -1, "Dev. Build", 319, 240)
txt_f1 = createTextImg(font1, 0, 0, "Press F1 for Info", 159, 240)
txt_titleFt = createTextImg(font5, 0, 0, "", 156, 240)

--;===========================================================
--; MAIN MENU SCREENPACK
--;===========================================================
--Loading Text
txt_loading = createTextImg(font1, 0, -1, "", 310, 230)

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
--; ARCADE MENU SCREENPACK
--;===========================================================
t_arcadeMenu = {
	{id = textImgNew(), text = "CLASSIC MODE"},
	{id = textImgNew(), text = "TOWER MODE"},
}

--;===========================================================
--; CLASSIC ARCADE MENU SCREENPACK
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

--;===========================================================
--; TOWER ARCADE MENU SCREENPACK
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

--;===========================================================
--; VERSUS MENU SCREENPACK
--;===========================================================
t_vsMenu = {
	{id = textImgNew(), text = "QUICK MATCH"},
	{id = textImgNew(), text = "FREE BATTLE"},
}

--;===========================================================
--; QUICK/RANDOM MATCH MENU SCREENPACK
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

--;===========================================================
--; FREE BATTLE MENU SCREENPACK
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

--;===========================================================
--; CHALLENGES MENU SCREENPACK
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

--;===========================================================
--; SURVIVAL MENU SCREENPACK
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

--;===========================================================
--; BOSS FIGHT MENU SCREENPACK
--;===========================================================
t_bossMenu = {
	{id = textImgNew(), text = "VS SINGLE BOSS"},
	{id = textImgNew(), text = "BOSS RUSH"},
}

--;===========================================================
--; BOSS RUSH MENU SCREENPACK
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

--;===========================================================
--; BONUS GAMES MENU SCREENPACK
--;===========================================================
t_bonusMenu = {
	{id = textImgNew(), text = "SINGLE MODE"},
	{id = textImgNew(), text = "BONUS RUSH"},
}

--;===========================================================
--; BONUS RUSH MENU SCREENPACK
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
--; TIME ATTACK MENU SCREENPACK (WIP)
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

--;===========================================================
--; SCORE ATTACK MENU SCREENPACK (WIP)
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

--;===========================================================
--; SUDDEN DEATH MENU SCREENPACK
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

--;===========================================================
--; EXTRAS MENU SCREENPACK
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

--;===========================================================
--; ENDLESS MENU SCREENPACK
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

--;===========================================================
--; TOURNAMENT MENU SCREENPACK (WIP)
--;===========================================================
t_tourneyMenu = {
	{id = textImgNew(), text = "ROUND OF 16"},
	{id = textImgNew(), text = "ROUND OF 8"},
	{id = textImgNew(), text = "ROUND OF 4"},
}

--;===========================================================
--; WATCH MENU SCREENPACK
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

--;===========================================================
--; REPLAY MENU SCREENPACK
--;===========================================================
t_replayMenu = {
	{id = textImgNew(), text = "ONLINE REPLAYS"},
	{id = textImgNew(), text = "LOCAL REPLAYS"},
}

--;===========================================================
--; ONLINE REPLAYS MENU SCREENPACK
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
--; GALLERY MENU SCREENPACK
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
--; SOUND TEST MENU SCREENPACK
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
--; CONFIRM SONG MESSAGE SCREENPACK
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

--;===========================================================
--; CUTSCENES MENU SCREENPACK
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
--; STORYBOARDS MENU SCREENPACK
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
--; ONLINE MENU SCREENPACK
--;===========================================================
t_mainNetplay = {
	{id = textImgNew(), text = "HOST [CREATE ROOM]"},
	{id = textImgNew(), text = "CLIENT [JOIN A ROOM]"},
}

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
--; LOBBY MENU SCREENPACK
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
--; SIDE SELECT SCREENPACK
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

--;===========================================================
--; HERE COMES A NEW CHALLENGER SCREENPACK
--;===========================================================
--Challenger Transparent BG
challengerWindow = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(challengerWindow, 160, 0)
animSetTile(challengerWindow, 1, 1)
animSetWindow(challengerWindow, -54, 67, 428, 100)

--Challenger Text
challengerText = animNew(sysSff, [[
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
--; F1 INFOBOX MESSAGE SCREENPACK
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
--; INFO MESSAGE SCREENPACK
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

--;===========================================================
--; CONFIRM MENU SCREENPACK
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

--;===========================================================
--; CLOSE/RESTART MESSAGE SCREENPACK
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