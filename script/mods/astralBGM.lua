local includeLuaMatch = true --This module will be loaded during a match.

--Astral BGM dionednd's module, edited for IKEMEN PLUS ULTRA
local AstralHeatBGMPlayed = {}
local Authors = {
	["OHMSBY"] = true,
	["Ichida"] = true,
	["Vinnie"] = true,
	["Resentone"] = true,
	["TornilloOxidado"] = true,
	["HakiKing"] = true,
	["ZolidSone"] = true,
	["JOHMSBY"] = true,
	["dionednd"] = true,
	["Rouuuu"] = true,
	["OWO"] = true,
	["RagingRowen"] = true,
}

local t_playBGM = {
	"BBCF - Astral 2.0 Short.mp3",
	"GBVS - LiberationChargeAttack.ogg",
	"GBVS - Over Burst.mp3",
	"GBVSR - Stroke of Fate.mp3"
}

function f_astralBGM()
	if getGameMode() == "alliance" or getGameMode() == "abyss" then
		local pn = 1
		if player(pn) then
			local author = authorname()
			if var(20) == 1 and not AstralHeatBGMPlayed[pn] and Authors[author] and roundstate() == 2 then
				AstralHeatBGMPlayed[pn] = true
				playBGM("chars/BBTAG/_astralBGM/"..t_playBGM[math.random(1, #t_playBGM)])
			elseif var(20) ~= 1 then
				AstralHeatBGMPlayed[pn] = false
			end
		end
	end
end