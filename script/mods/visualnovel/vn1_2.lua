--Draw Chapter 2 Visuals

--BG
animDraw(vnBG2)

--Characters
if not vn.vnFadeIn then
	if vn.VNtxt < 6 then animDraw(vnKfm1) end
	if vn.VNtxt >= 4 then animDraw(vnEKfm1) end
end