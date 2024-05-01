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

--Background 2
vnBG1 = animNew(vnSff, [[
0,1, 0,0, -1
]])
animAddPos(vnBG1, -54, 0)
animSetScale(vnBG1, 0.34, 0.34)
animUpdate(vnBG1)

--Background 3
vnBG2 = animNew(vnSff, [[
0,2, 0,0, -1
]])
animAddPos(vnBG2, -54, 0)
animSetScale(vnBG2, 0.34, 0.34)
animUpdate(vnBG2)

--Background 4
vnBG3 = animNew(vnSff, [[
0,3, 0,0, -1
]])
animAddPos(vnBG3, -54, 0)
animSetScale(vnBG3, 0.34, 0.34)
animUpdate(vnBG3)

--Background 5
vnBG4 = animNew(vnSff, [[
0,4, 0,0, -1
]])
animAddPos(vnBG4, -54, 0)
animSetScale(vnBG4, 0.34, 0.34)
animUpdate(vnBG4)

--Background 6
vnBG5 = animNew(vnSff, [[
0,5, 0,0, -1
]])
animAddPos(vnBG5, -54, 0)
animSetScale(vnBG5, 0.34, 0.34)
animUpdate(vnBG5)

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

--Kung Fu Man 2
vnKfm2 = animNew(vnSff, [[
1,1, 0,0, -1
]])
animAddPos(vnKfm2, 0, 0)
animSetScale(vnKfm2, 0.35, 0.35)
animUpdate(vnKfm2)

--Kung Fu Man 3
vnKfm3 = animNew(vnSff, [[
1,2, 0,0, -1
]])
animAddPos(vnKfm3, -90, 0)
animSetScale(vnKfm3, 0.35, 0.35)
animUpdate(vnKfm3)

--Kung Fu Man 4
vnKfm4 = animNew(vnSff, [[
1,3, 0,0, -1
]])
animAddPos(vnKfm4, 0, 0)
animSetScale(vnKfm4, 0.25, 0.25)
animUpdate(vnKfm4)

--Kung Fu Man The End
vnKfmEnd = animNew(vnSff, [[
1,4, 0,0, -1
]])
animAddPos(vnKfmEnd, 0, 0)
animSetScale(vnKfmEnd, 0.25, 0.25)
animUpdate(vnKfmEnd)

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
animAddPos(vnMM1, 320, 10)
animSetScale(vnMM1, 0.70, 0.70)
animUpdate(vnMM1)

--Mako Mayama 2
vnMM2 = animNew(vnSff, [[
4,1, 0,0, -1, H
]])
animAddPos(vnMM2, 320, 40)
animSetScale(vnMM2, 0.7, 0.7)
animUpdate(vnMM2)

--Mako Mayama 2
vnMM2B = animNew(vnSff, [[
4,1, 0,0, -1
]])
animAddPos(vnMM2B, 0, 40)
animSetScale(vnMM2B, 0.7, 0.7)
animUpdate(vnMM2B)

--Suave Dude
vnSD1 = animNew(vnSff, [[
3,0, 0,0, -1
]])
animAddPos(vnSD1, 200, 0)
animSetScale(vnSD1, 0.15, 0.15)
animUpdate(vnSD1)

--Suave Dude 2
vnSD2 = animNew(vnSff, [[
3,1, 0,0, -1
]])
animAddPos(vnSD2, 200, 0)
animSetScale(vnSD2, 0.15, 0.15)
animUpdate(vnSD2)

--Suave Dude 3
vnSD3 = animNew(vnSff, [[
3,0, 0,0, -1, H
]])
animAddPos(vnSD3, 200, 0)
animSetScale(vnSD3, 0.15, 0.15)
animUpdate(vnSD3)

--Kung Fu Girl 1
vnKfg1 = animNew(vnSff, [[
2,0, 0,0, -1, H
]])
animAddPos(vnKfg1, 320, 0)
animSetScale(vnKfg1, 0.45, 0.45)
animUpdate(vnKfg1)

--Kung Fu Girl 2
vnKfg2 = animNew(vnSff, [[
2,10, 0,0, -1
]])
animAddPos(vnKfg2, 117, 0)
animSetScale(vnKfg2, 0.38, 0.38)
animUpdate(vnKfg2)

--Kung Fu Girl 3
vnKfg3 = animNew(vnSff, [[
2,23, 0,0, -1
]])
animAddPos(vnKfg3, 117, 0)
animSetScale(vnKfg3, 0.38, 0.38)
animUpdate(vnKfg3)