module(..., package.seeall)
--;---------------------------------
--;             WIP
--;---------------------------------
--The target of this pause script Remake is make pause menu code more "understandable"

function f_resetearPausa()
pauseMenuActive = false
teclaLista = false
bufferTecla = 0 --Resetea el contador del buffer
togglePauseMenu(0) --Esto desactiva la pausa porque lo que la activa es togglePauseMenu(1) en debug.lua
end
f_resetearPausa() --Carga la función al leer el script

function f_pauseMain(p, st, esc)
--Imagina que aquí hay un while true do
	pn = p
	escape = esc
	start = st
	if not pauseMenuActive then
		sndPlay(sndSys, 100, 1) --SFX Pausa Activada
		pauseMenuActive = true
	end
--La siguiente estructura es para prevenir que cuando pauses se desactive al mismo tiempo al usar la misma tecla con que despausarás el juego
	if bufferTecla > 10 then
		teclaLista = true
	else
		bufferTecla = bufferTecla + 1
	end
--;----------------------------------------------------------------------------------------------------------------------
	if teclaLista and (start or escape) and pauseMenuActive then
		sndPlay(sndSys, 100, 2) --SFX Pausa Desactivada y no lo usamos en resetear porque sonaría al cargar el match
		f_resetearPausa()
	end
	cmdInput()
--Imagina que aquí hay un refresh()
end