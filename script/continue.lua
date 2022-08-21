
module(..., package.seeall)

--;===========================================================
--; CONTINUE SCREEN
--;===========================================================
bgmContinue = 'sound/CONTINUE.mp3'
bgmGameOver = 'sound/GAME OVER.mp3'
contSff = sffNew('data/continue.sff')
contSnd = sndNew('data/continue.snd')

--Background
contBG0 = animNew(contSff, [[
1000,0, -32,8, -1
]])
animUpdate(contBG0)

--Black Background Cover Top
contBG1 = animNew(contSff, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG1, -1)
animSetTile(contBG1, 1, 0)
animSetWindow(contBG1, 0, 0, 320, 40)
animSetAlpha(contBG1, 0, 0)
animUpdate(contBG1)

--Black Background Cover Bottom
contBG2 = animNew(contSff, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG2, -1)
animSetTile(contBG2, 1, 0)
animSetWindow(contBG2, 0, 200, 320, 40)
animSetAlpha(contBG2, 0, 0)
animUpdate(contBG2)

--Coins left text
txt_coins = createTextImg(jgFnt, 0, 1, '', 20, 30)
txt_cont = createTextImg(jgFnt, 0, 1, '', 20, 30)

function f_continue()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	playBGM(bgmContinue)
	f_contTimerReset()
	f_gameOverReset()
	data.continue = 0
	local tablePos = ''
	local anim = false
	local animLength = 0
	local i = 0
	tablePos = t_selChars[data.t_p1selected[1].cel+1]
	if tablePos.sffData ~= nil and tablePos.dizzy ~= nil then
		anim = f_animFromTable(tablePos['dizzy'], tablePos.sffData, 70, 180, tablePos.xscale, tablePos.yscale, 0, 1)
	end
	textImgSetText(txt_coins, 'COINS: ' .. data.coinsLeft)
	textImgSetText(txt_cont, 'TIMES CONTINUED: ' .. data.continueCount)	
	cmdInput()
	while true do
		animDraw(contBG0)
		i = i + 1
		if esc() then
			cmdInput()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			playBGM(bgmTitle)
			break
		elseif data.continue == 0 then --waiting for player's decision
			if anim then
				animDraw(anim)
				animUpdate(anim)
				animDraw(contBG1)
				animDraw(contBG2)
			end
			if commandGetState(p1Cmd, 'holds') then
				if tablePos.sffData ~= nil and tablePos.win ~= nil then
					anim, animLength = f_animFromTable(tablePos['win'], tablePos.sffData, 70, 180, tablePos.xscale, tablePos.yscale, 0, 1)
				else
					animLength = 0
				end
				data.coinsLeft = data.coinsLeft - 1
				data.continueCount = data.continueCount + 1
				textImgSetText(txt_coins, 'COINS: ' .. data.coinsLeft)
				textImgSetText(txt_cont, 'TIMES CONTINUED: ' .. data.continueCount)				
				fadeContinue = f_fadeAnim(30, 'fadeout', 'black', fadeSff)
				data.continue = 1
			elseif i > 1366 then --Continue = NO
				data.continue = 2
				f_gameOver()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				break
			end
			animDraw(contTimer)
			if btnPalNo(p1Cmd) > 0 and i >= 71 then
				local cnt = 0
				if i < 135 then
					cnt = 135
				elseif i <= 262 then
					cnt = 262
				elseif i < 389 then
					cnt = 389
				elseif i < 516 then
					cnt = 516
				elseif i < 643 then
					cnt = 643
				elseif i < 770 then
					cnt = 770
				elseif i < 897 then
					cnt = 897
				elseif i < 1024 then
					cnt = 1024
				elseif i < 1151 then
					cnt = 1151
				elseif i < 1278 then
					cnt = 1278
				end
				while i < cnt do
					i = i + 1
					animUpdate(contTimer)
				end
			else
				animUpdate(contTimer)
			end
			if i == 135 then
				sndPlay(contSnd, 0, 9)
			elseif i == 262 then
				sndPlay(contSnd, 0, 8)
			elseif i == 389 then
				sndPlay(contSnd, 0, 7)
			elseif i == 516 then
				sndPlay(contSnd, 0, 6)
			elseif i == 643 then
				sndPlay(contSnd, 0, 5)
			elseif i == 770 then
				sndPlay(contSnd, 0, 4)
			elseif i == 897 then
				sndPlay(contSnd, 0, 3)
			elseif i == 1024 then
				sndPlay(contSnd, 0, 2)
			elseif i == 1151 then
				sndPlay(contSnd, 0, 1)
			elseif i == 1278 then
				sndPlay(contSnd, 0, 0)
			end
		elseif data.continue == 1 then --Continue = YES
			if animLength+30 > 0 then
				animLength = animLength - 1
				if anim then
					animDraw(anim)
					if animLength > 0 then
						animUpdate(anim)
					end
				end
				animDraw(contBG1)
				animDraw(contBG2)
				if animLength < 0 then
					animDraw(fadeContinue)
					animUpdate(fadeContinue)
				end
			else
				data.fadeSelect = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				cmdInput()
				script.select.f_selectChallenger()
				playBGM(bgmSelect)
				break
			end
		end
		if i >= 71 then --show when counter starts counting down
			textImgDraw(txt_coins)
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GAME OVER
--;===========================================================
function f_gameOver()
	playBGM(bgmGameOver)
	sndPlay(contSnd, 1, 0)
	f_gameOverReset()
	local tablePos = ''
	local anim = false
	local animLength = 0
	local i = 0
	tablePos = t_selChars[data.t_p1selected[1].cel+1]
	if tablePos.sffData ~= nil then
		if tablePos.cheese ~= nil then
			anim, animLength = f_animFromTable(tablePos['cheese'], tablePos.sffData, 70, 180, tablePos.xscale, tablePos.yscale, 0, 1)
		elseif tablePos.lieDown ~= nil then
			anim, animLength = f_animFromTable(tablePos['lieDown'], tablePos.sffData, 70, 180, tablePos.xscale, tablePos.yscale, 0, 1)
		end
	end
	cmdInput()
	while true do
		animDraw(contBG0)
		i = i + 1
		if esc() then
			cmdInput()
			playBGM(bgmTitle)
			break
		else
			if anim then
				animDraw(anim)
				animLength = animLength - 1
				if animLength > 0 then
					animUpdate(anim)
				end
				animDraw(contBG1)
				animDraw(contBG2)
			end
			if i <= 226+60 then
				animDraw(gameOver)
				animUpdate(gameOver)
				if i == 190 then --music is shorter than animation and we don't want looping here
					playBGM('')
				elseif i == 226 then --create fading animation
					fadeGameOver = f_fadeAnim(60, 'fadeout', 'black', fadeSff)
				elseif i > 226 then --start fading the screen
					animDraw(fadeGameOver)
					animUpdate(fadeGameOver)
				end
			else
				cmdInput()
				break
			end
		end
		cmdInput()
		refresh()
	end
end

function f_contTimerReset()
	contTimer = animNew(contSff, [[
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
	animAddPos(contTimer, -60, 8)
end

function f_gameOverReset()
	gameOver = animNew(contSff, [[
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
animAddPos(gameOver, -32, 8)
end
