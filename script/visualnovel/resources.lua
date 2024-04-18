--;===========================================================
--; LOAD VISUAL NOVEL SRIPTS
--;===========================================================
require("script.visualnovel.story1")


--;===========================================================
--; LOAD VISUAL NOVEL ASSETS
--;===========================================================
txt_nameCfg = createTextImg(font1, 0, 1, "", 2, 175) --Name Text Config
txt_boxCfg = createTextImg(font1, 0, 1, "", 0, 0) --Narrative Text Box Config
txt_vnName = "" --Name Text
txt_vn = "" --Narrative Text Box

--Background 1
vnBG0 = animNew(vnSff, [[
0,0, 0,0, -1
]])
animAddPos(vnBG0, 0, 0)
animUpdate(vnBG0)

--Text background
vnTxtBG = animNew(vnSff, [[
100,0, 0,0, -1
]])
animAddPos(vnTxtBG, -8, 177.5)
animSetScale(vnTxtBG, 2.21, 1)
animUpdate(vnTxtBG)

--Skip Button
vnSkip = animNew(vnSff, [[
100,1, 0,0, -1
]])
animAddPos(vnSkip, 300, 220)
animUpdate(vnSkip)

--Kung Fu Man 1
vnKfm1 = animNew(vnSff, [[
1,0, 0,0, -1
]])
animAddPos(vnKfm1, 0, 0)
animSetScale(vnKfm1, 0.25, 0.25)
animUpdate(vnKfm1)