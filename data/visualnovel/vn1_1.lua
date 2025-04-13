--Draw Chapter 1 Visuals

--BG
if vn.VNtxt > 0 and vn.VNtxt < 32 then animDraw(vnBG0)
elseif (vn.VNtxt >= 32 and vn.VNtxt < 66) or (vn.VNtxt >= 70 and vn.VNtxt < 88) then animDraw(vnBG1)
elseif (vn.VNtxt == 88) then animDraw(vnBG6)
end

--Characters
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