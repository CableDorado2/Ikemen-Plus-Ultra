--Draw Chapter 3 Visuals

--BG
if vn.VNtxt == 2 then animDraw(vnBG7)
elseif vn.VNtxt >= 3 then animDraw(vnBG3)
end

--Characters
if not vn.vnFadeIn then
	if vn.VNtxt == 2 then animDraw(vnKfm1) end
	if vn.VNtxt >= 4 then animDraw(vnKfm1) end
	if vn.VNtxt >= 5 then animDraw(vnSD1) end
end