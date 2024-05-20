--Draw Chapter 4 Visuals

--BG
animDraw(vnBG3)

--Characters
if not vn.vnFadeIn then
	animDraw(vnKfm1)
	if vn.VNtxt >= 2 then animDraw(vnSD2) end
end