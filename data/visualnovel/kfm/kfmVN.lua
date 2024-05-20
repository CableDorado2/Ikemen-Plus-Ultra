--Draw Chapter 1 Visuals
if vn.vnChapter == 1 then
	--BG
	if vn.VNtxt > 0 and vn.VNtxt < 32 then animDraw(vnBG0)
	elseif (vn.VNtxt >= 32 and vn.VNtxt < 66) or (vn.VNtxt >= 70 and vn.VNtxt < 88) then animDraw(vnBG1)
	elseif (vn.VNtxt == 88) then animDraw(vnBG6)
	end
	if not vn.vnFadeIn then
		--KFM Sprites
		if (vn.VNtxt >= 2 and vn.VNtxt < 32) or (vn.VNtxt >= 33 and vn.VNtxt < 44) or (vn.VNtxt >= 48 and vn.VNtxt < 59) or (vn.VNtxt >= 70 and vn.VNtxt < 88) then animDraw(vnKfm1)
		elseif (vn.VNtxt >= 46 and vn.VNtxt < 48) then animDraw(vnKfm2)
		elseif (vn.VNtxt >= 59 and vn.VNtxt < 61) then animDraw(vnKfm3)
		elseif (vn.VNtxt == 88) then animDraw(vnKfm4)
		end
		--Mayama Sprites
		if (vn.VNtxt >= 4 and vn.VNtxt < 11) or (vn.VNtxt >= 18 and vn.VNtxt < 32) or (vn.VNtxt >= 78 and vn.VNtxt < 88) then animDraw(vnMM1)
		elseif vn.VNtxt == 41 then animDraw(vnMM1B)
		elseif (vn.VNtxt >= 11 and vn.VNtxt < 18) or (vn.VNtxt >= 73 and vn.VNtxt < 78) then animDraw(vnMM2)
		elseif (vn.VNtxt >= 34 and vn.VNtxt < 36) or (vn.VNtxt >= 46 and vn.VNtxt < 48) then animDraw(vnMM2B)
		end
		--KFG Photo
		if vn.VNtxt == 23 or vn.VNtxt == 24 then animDraw(vnPhoto) end
		--KFG Sprites
		if (vn.VNtxt >= 37 and vn.VNtxt < 39) then animDraw(vnKfg1)
		elseif (vn.VNtxt >= 39 and vn.VNtxt < 42) then animDraw(vnKfg2)
		elseif (vn.VNtxt >= 42 and vn.VNtxt < 44) then animDraw(vnKfg3)
		elseif (vn.VNtxt >= 46 and vn.VNtxt < 48) then animDraw(vnKfg4)
		elseif (vn.VNtxt >= 48 and vn.VNtxt < 54) then animDraw(vnKfg5)
		end
		--SD Sprites
		if (vn.VNtxt >= 50 and vn.VNtxt < 55) or (vn.VNtxt >= 56 and vn.VNtxt < 65) then animDraw(vnSD1)
		end
	end
--Draw Chapter 2 Visuals
elseif vn.vnChapter == 2 then
	animDraw(vnBG2)
	if not vn.vnFadeIn then
		if vn.VNtxt < 6 then animDraw(vnKfm1) end
		if vn.VNtxt >= 4 then animDraw(vnEKfm1) end
	end
--Draw Chapter 3A Visuals
elseif vn.vnChapter == 3 then
	if vn.VNtxt == 2 then animDraw(vnBG7)
	elseif vn.VNtxt >= 3 then animDraw(vnBG3)
	end
	if not vn.vnFadeIn then
		if vn.VNtxt == 2 then animDraw(vnKfm1) end
		if vn.VNtxt >= 4 then animDraw(vnKfm1) end
		if vn.VNtxt >= 5 then animDraw(vnSD1) end
	end
--Draw Chapter 3B Visuals
elseif vn.vnChapter == 4 then
	if vn.VNtxt >= 3 then
		animDraw(vnBG4)
		animDraw(vnRain)
		animUpdate(vnRain)
	end
	if not vn.vnFadeIn then
		if vn.VNtxt >= 5 and vn.VNtxt < 6 then animDraw(vnKfm3)
		elseif (vn.VNtxt >= 9 and vn.VNtxt < 17) then animDraw(vnKfm2)
		elseif vn.VNtxt >= 17 then animDraw(vnKfm1)
		end
		if (vn.VNtxt >= 12 and vn.VNtxt < 14) then animDraw(vnKfg6)
		elseif vn.VNtxt == 14 then animDraw(vnKfg7)
		elseif vn.VNtxt >= 15 and vn.VNtxt < 18 then animDraw(vnKfg8)
		elseif vn.VNtxt >= 18 and vn.VNtxt < 20 then animDraw(vnKfg9)
		elseif vn.VNtxt >= 20 then animDraw(vnKfg4B)
		end
		if (vn.VNtxt >= 3 and vn.VNtxt < 12) or vn.VNtxt == 21 then animDraw(vnSD1) end
	end
--Draw Chapter 4A Visuals
elseif vn.vnChapter == 5 then
	animDraw(vnBG3)
	if not vn.vnFadeIn then
		animDraw(vnKfm1)
		if vn.VNtxt >= 2 then animDraw(vnSD2) end
	end
--Draw Chapter 4B Visuals
elseif vn.vnChapter == 6 then
	animDraw(vnBG4)
	animDraw(vnRain)
	animUpdate(vnRain)
	if not vn.vnFadeIn then
		if vn.VNtxt >= 3 and vn.VNtxt < 12 then animDraw(vnKfm1) end
		if vn.VNtxt >= 8 and vn.VNtxt < 12 then animDraw(vnKfg6B)
		elseif vn.VNtxt == 12 then animDraw(vnKfg11)
		end
		if vn.VNtxt >= 2 and vn.VNtxt < 12 then animDraw(vnSD2) end
	end
--Draw Chapter 4C Visuals
elseif vn.vnChapter == 7 then
	animDraw(vnBG3)
	if not vn.vnFadeIn then
		animDraw(vnKfm1)
		animDraw(vnSD1)
	end
--Draw Chapter 4D Visuals
elseif vn.vnChapter == 8 then
	animDraw(vnBG5)
	animDraw(vnRain)
	animUpdate(vnRain)
	if not vn.vnFadeIn then
		animDraw(vnSD3)
		if (vn.VNtxt >= 3 and vn.VNtxt < 8) then animDraw(vnKfg10)
		elseif vn.VNtxt == 8 then animDraw(vnKfg7)
		end
	end
end