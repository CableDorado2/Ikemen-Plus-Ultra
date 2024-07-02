module(..., package.seeall)
--;===========================================================
--; ATTRACT MODE
--;===========================================================
txt_coinTitle = createTextImg(jgFnt, 0, 0, "-- INSERT COIN --", 159, 170)
function f_attractCredits()
	txt_credits = createTextImg(font1, 0, -1, "Credits: "..data.attractCoins, 181.5, 212)
	textImgDraw(txt_credits)
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