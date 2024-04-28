--;===========================================================
--; LOAD VISUAL NOVEL ASSETS
--;===========================================================
txt_nameCfg = createTextImg(font13, 0, 1, "", 2, 175, 0.7, 0.7) --Name Text Config
txt_boxCfg = createTextImg(font5, 0, 1, "", 0, 0) --Narrative Text Box Config

--Background 1
vnBG0 = animNew(vnSff, [[
0,0, 0,0, -1
]])
animAddPos(vnBG0, -54, 0)
animSetScale(vnBG0, 0.34, 0.34)
animUpdate(vnBG0)

--Background 3
vnBG2 = animNew(vnSff, [[
0,2, 0,0, -1
]])
animAddPos(vnBG2, -54, 0)
animSetScale(vnBG2, 0.34, 0.34)
animUpdate(vnBG2)

--Text background
vnTxtBG = animNew(vnSff, [[
100,0, 0,0, -1
]])
animAddPos(vnTxtBG, -8, 177.5)
animSetScale(vnTxtBG, 2.21, 1)
animUpdate(vnTxtBG)

--Next Text Arrow
vnNext = animNew(vnSff, [[
101,0, 0,0, 10
101,1, 0,0, 10
101,2, 0,0, 10
101,3, 0,0, 10
101,3, 0,0, 10
101,2, 0,0, 10
101,1, 0,0, 10
101,0, 0,0, 10
]])
animAddPos(vnNext, 308, 222)
animSetScale(vnNext, 0.5, 0.5)
animUpdate(vnNext)

--Kung Fu Man 1
vnKfm1 = animNew(vnSff, [[
1,0, 0,0, -1
]])
animAddPos(vnKfm1, 0, 0)
animSetScale(vnKfm1, 0.25, 0.25)
animUpdate(vnKfm1)

--Evil Kung Fu Man
vnEKfm1 = animNew(vnSff, [[
1,0, 0,0, -1, H, AS0D0
]])
animAddPos(vnEKfm1, 320, 0)
animSetScale(vnEKfm1, 0.25, 0.25)
animUpdate(vnEKfm1)

--Mako Mayama 1
vnMM1 = animNew(vnSff, [[
4,0, 0,0, -1, H
]])
animAddPos(vnMM1, 320, 0)
animSetScale(vnMM1, 0.75, 0.75)
animUpdate(vnMM1)

--Mako Mayama 2
vnMM2 = animNew(vnSff, [[
4,1, 0,0, -1
]])
animAddPos(vnMM2, 0, 0)
animSetScale(vnMM2, 1, 1)
animUpdate(vnMM2)