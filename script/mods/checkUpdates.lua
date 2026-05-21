local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
--Insert new item to t_mainMenu table loaded by screenpack.lua
table.insert(t_mainMenu, #t_mainMenu, {
id = textImgNew(),
text = "CHECK UPDATES",
info = [[
Stay up to date with Engine
Updates!
]],
gotomenu = "f_checkUpdates()"
})
--;===========================================================
--; CHECK UPDATES ITEM
--;===========================================================
function f_checkUpdates()
	webOpen("https://github.com/CableDorado2/Ikemen-Plus-Ultra")
end