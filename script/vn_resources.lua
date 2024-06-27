--;===========================================================
--; VISUAL NOVEL SCREENPACK
--;===========================================================
--Scrolling background
novelBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(novelBG0, 160, 0)
animSetTile(novelBG0, 1, 1)
animSetColorKey(novelBG0, -1)

--Transparent background
novelBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(novelBG1, 20, 20)
animSetAlpha(novelBG1, 20, 100)
animUpdate(novelBG1)

--Up Arrow
novelUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(novelUpArrow, 228, 11)
animUpdate(novelUpArrow)
animSetScale(novelUpArrow, 0.5, 0.5)

--Down Arrow
novelDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(novelDownArrow, 228, 201.5)
animUpdate(novelDownArrow)
animSetScale(novelDownArrow, 0.5, 0.5)

--;===========================================================
--; LOAD VISUAL NOVEL ASSETS
--;===========================================================
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

--Background 7
vnBG6 = animNew(vnSff, [[
0,6, 0,0, -1
]])
animAddPos(vnBG6, -54, 0)
animSetScale(vnBG6, 0.34, 0.34)
animUpdate(vnBG6)

--Background 8
vnBG7 = animNew(vnSff, [[
0,7, 0,0, -1
]])
animAddPos(vnBG7, -54, 0)
animSetScale(vnBG7, 0.34, 0.34)
animUpdate(vnBG7)

--KFG Photo
vnPhoto = animNew(vnSff, [[
2,31, 0,0, -1
]])
animAddPos(vnPhoto, 110, 5)
animSetScale(vnPhoto, 0.16, 0.16)
animUpdate(vnPhoto)

--Rain
vnRain = animNew(vnSff, [[
110,0, 0,0, 1, ,A
110,1, 0,0, 1, ,A
110,2, 0,0, 1, ,A
110,3, 0,0, 1, ,A
110,4, 0,0, 1, ,A
110,5, 0,0, 1, ,A
110,6, 0,0, 1, ,A
110,7, 0,0, 1, ,A
110,8, 0,0, 1, ,A
110,9, 0,0, 1, ,A
110,10, 0,0, 1, ,A
110,11, 0,0, 1, ,A
110,12, 0,0, 1, ,A
110,13, 0,0, 1, ,A
110,14, 0,0, 1, ,A
110,15, 0,0, 1, ,A
110,16, 0,0, 1, ,A
110,17, 0,0, 1, ,A
]])
animAddPos(vnRain, -50, 0)
animUpdate(vnRain)

--Text background
vnTxtBG = animNew(vnSff, [[
100,0, 0,0, -1
]])
animAddPos(vnTxtBG, -8, 177.5)
animSetScale(vnTxtBG, 2.21, 1)
animUpdate(vnTxtBG)

--Next Text Arrow (Right)
vnNextR = animNew(vnSff, [[
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
vnNext = animNew(vnSff, [[
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
animAddPos(vnKfm4, 40, 0)
animSetScale(vnKfm4, 0.30, 0.30)
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

--Mako Mayama 1 Right
vnMM1 = animNew(vnSff, [[
4,0, 0,0, -1, H
]])
animAddPos(vnMM1, 320, 10)
animSetScale(vnMM1, 0.70, 0.70)
animUpdate(vnMM1)

--Mako Mayama 1 Left
vnMM1B = animNew(vnSff, [[
4,0, 0,0, -1
]])
animAddPos(vnMM1B, 50, 10)
animSetScale(vnMM1B, 0.70, 0.70)
animUpdate(vnMM1B)

--Mako Mayama 2 Right
vnMM2 = animNew(vnSff, [[
4,1, 0,0, -1, H
]])
animAddPos(vnMM2, 320, 36)
animSetScale(vnMM2, 0.7, 0.7)
animUpdate(vnMM2)

--Mako Mayama 2 Left
vnMM2B = animNew(vnSff, [[
4,1, 0,0, -1
]])
animAddPos(vnMM2B, 70, 36)
animSetScale(vnMM2B, 0.7, 0.7)
animUpdate(vnMM2B)

--Suave Dude Right
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

--Suave Dude Left
vnSD3 = animNew(vnSff, [[
3,0, 0,0, -1, H
]])
animAddPos(vnSD3, 100, 0)
animSetScale(vnSD3, 0.15, 0.15)
animUpdate(vnSD3)

--Kung Fu Girl 1
vnKfg1 = animNew(vnSff, [[
2,0, 0,0, -1, H
]])
animAddPos(vnKfg1, 325, 0)
animSetScale(vnKfg1, 0.45, 0.45)
animUpdate(vnKfg1)

--Kung Fu Girl 2
vnKfg2 = animNew(vnSff, [[
2,10, 0,0, -1
]])
animAddPos(vnKfg2, 177, 0)
animSetScale(vnKfg2, 0.38, 0.38)
animUpdate(vnKfg2)

--Kung Fu Girl 3
vnKfg3 = animNew(vnSff, [[
2,23, 0,0, -1
]])
animAddPos(vnKfg3, 177, 0)
animSetScale(vnKfg3, 0.38, 0.38)
animUpdate(vnKfg3)

--Kung Fu Girl 4 Left
vnKfg4 = animNew(vnSff, [[
2,1, 0,0, -1
]])
animAddPos(vnKfg4, 180, 0)
animSetScale(vnKfg4, 0.45, 0.45)
animUpdate(vnKfg4)

--Kung Fu Girl 4 Right
vnKfg4B = animNew(vnSff, [[
2,1, 0,0, -1, H
]])
animAddPos(vnKfg4B, 320, 0)
animSetScale(vnKfg4B, 0.45, 0.45)
animUpdate(vnKfg4B)

--Kung Fu Girl 5
vnKfg5 = animNew(vnSff, [[
2,3, 0,0, -1
]])
animAddPos(vnKfg5, 117, 0)
animSetScale(vnKfg5, 0.38, 0.38)
animUpdate(vnKfg5)

--Kung Fu Girl 6
vnKfg6 = animNew(vnSff, [[
2,21, 0,0, -1
]])
animAddPos(vnKfg6, 177, 0)
animSetScale(vnKfg6, 0.38, 0.38)
animUpdate(vnKfg6)

--Kung Fu Girl 6
vnKfg6B = animNew(vnSff, [[
2,21, 0,0, -1
]])
animAddPos(vnKfg6B, 110, 0)
animSetScale(vnKfg6B, 0.38, 0.38)
animUpdate(vnKfg6B)

--Kung Fu Girl 7
vnKfg7 = animNew(vnSff, [[
2,5, 0,0, -1
]])
animAddPos(vnKfg7, 177, 0)
animSetScale(vnKfg7, 0.38, 0.38)
animUpdate(vnKfg7)

--Kung Fu Girl 8
vnKfg8 = animNew(vnSff, [[
2,6, 0,0, -1
]])
animAddPos(vnKfg8, 177, 0)
animSetScale(vnKfg8, 0.38, 0.38)
animUpdate(vnKfg8)

--Kung Fu Girl 9
vnKfg9 = animNew(vnSff, [[
2,28, 0,0, -1
]])
animAddPos(vnKfg9, 177, 0)
animSetScale(vnKfg9, 0.38, 0.38)
animUpdate(vnKfg9)

--Kung Fu Girl 10
vnKfg10 = animNew(vnSff, [[
2,22, 0,0, -1
]])
animAddPos(vnKfg10, 177, 0)
animSetScale(vnKfg10, 0.38, 0.38)
animUpdate(vnKfg10)

--Kung Fu Girl 11
vnKfg11 = animNew(vnSff, [[
2,15, 0,0, -1
]])
animAddPos(vnKfg11, 110, 0)
animSetScale(vnKfg11, 0.38, 0.38)
animUpdate(vnKfg11)

--Ending 1
vnEnd1 = animNew(vnSff, [[
200,1, 0,0, -1
]])
animAddPos(vnEnd1, -54, 0)
animSetScale(vnEnd1, 0.34, 0.34)
animUpdate(vnEnd1)

--Ending 2
vnEnd2 = animNew(vnSff, [[
200,2, 0,0, -1
]])
animAddPos(vnEnd2, -54, 0)
animSetScale(vnEnd2, 0.34, 0.34)
animUpdate(vnEnd2)

--Ending 3
vnEnd3 = animNew(vnSff, [[
200,3, 0,0, -1
]])
animAddPos(vnEnd3, -54, 0)
animSetScale(vnEnd3, 0.34, 0.34)
animUpdate(vnEnd3)