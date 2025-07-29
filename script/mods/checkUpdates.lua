local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
--Insert new item to t_mainMenu table loaded by screenpack.lua
table.insert(t_mainMenu,#t_mainMenu,{text = "CHECK UPDATES", gotomenu = "f_checkUpdates()", id = textImgNew()})
--;===========================================================
--; CHECK UPDATES
--;===========================================================
function f_checkUpdates()
	webOpen("https://github.com/CableDorado2/Ikemen-Plus-Ultra")
end