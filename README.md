# I.K.E.M.E.N PLUS ULTRA (I.K.E.M.E.N SSZ)
*Ikemen Plus Ultra* is an updated version of the **I.K.E.M.E.N PLUS** version uploaded by ***acdgames***. It's an open source fighting game engine that supports **M.U.G.E.N** resources. This engine was made by ***Suehiro*** under **S-SIZE** language, improved by ***acdgames*** and currently reworked by ***CD2*** and ***Strong FS***.

- This engine it is used to create advanced MUGENS games, that run on any PC from 2008 onwards, without a graphics card (Works under DirectX Render).

- According to the words of one of the special contributors to this engine ***PlasmoidThunder***: "The benefits that S-SIZE (Ikemen Plus) has over Ikemen GO are":
  - "Better sound engine for the most part".
  - "Native system renderer".
  - "Winamp plugin support".
  - "Easier to tweak engine code".

- The current version is a public development release for testing purposes, may contain bugs and incomplete features that will be finished in the final release.

- Your help and cooperation are appreciated.

## Minimum System Requirements
- **System:** Windows XP SP3 - 32 Bits (Yeah it works in WinXP)
- **Proccessor:** Intel(R) Atom(TM) CPU N455 1.66GHz
- **Memory:** 1GB RAM
- **Graphics:** Intel(R) Graphics Media Accelerator 3150 - 256MB
- **OpenGL:** Is not need, works with DirectX 11

## Engine Preview
https://www.youtube.com/watch?v=j2VIMyAp624

[![Alt text](https://i.ytimg.com/vi/pPL9SF8ZjZQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=j2VIMyAp624)

## Download
Lastest Version Here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/releases

## Table of Contents

>[Default Controls](#default-controls)
>
>[TODO List](#todo-list)
>
>[Tutorials](#tutorials)
>
>[Resources](#resources)
>
>[Tools](#tools)
>
>[Engine Manual](#engine-manual)
>
>[Discord Support](#discord-support)
>
>[Ikemen Plus Ultra VS Ikemen Go](#ikemen-plus-ultra-vs-ikemen-go)
>
>[References](#references)
>
>[License](#license)
>
>[Projects Powered By Ikemen Plus Ultra](#projects-powered-by-ikemen-plus-ultra)

## Default Controls
| Action | Keyboard P1 | Keyboard P2 | Gamepad *(It will be supported in a near future)* |
| --- | --- | --- | --- |
| ↑ | Up Arrow | KP_5 |  |
| ↓ | Down Arrow | KP_2 |  |
| ← | Left Arrow | KP_1 |  |
| → | Right Arrow | KP_3 |  |
| A/***LK*** | A | U |  |
| B/***MK*** | S | I |  |
| C/***SK*** | D | O |  |
| X/***LP*** | Z | J |  |
| Y/***MP*** | X | L |  |
| Z/***SP*** | C | L |  |
| **Taunt**/Start | Enter/Return | KP_0 |  |
| **Pause**/Resume | SpaceBar |  |  |
| UI Confirm | Enter/Return |  |  |
| UI Back | Esc |  |  |

## TODO List
CD2: En Español porque así es como entiendo mis ideas (Si las puedes traducir y entender estupendo!):
- [ ] La pantalla Demo después del title screen, se debe poder saltar con cualquier tecla antes asignada para jugar (Agregar texto Demo Mode en esquina superior derecha)

- [ ] Hacer que las capturas de pantallas se emitan correctamente como los replays y no con 1 foto de retraso

- [ ] Implementar para la selección de stage, la posibilidad de asignarle la música original, una random o alguna de las que tienes guardadas en la carpeta sounds

- [ ] Corregir el backMenu que al volver al char select del arcade mode, no recuerda contra quien vas a luchar y salta este error:
![Alt text](https://i.postimg.cc/HnYTSL0f/back-Menu-Arcade-Error.png)

- [ ] Agregar snd e img como KO para cuando obtengas perfect, debe ser en fight.ssz

- [ ] Que el sprite del char en el single boss fight, aparezca de una vez como ocurre al seleccionar un char en el char select del modo versus

- [ ] Agregar la opción de que cuando juegues contra la CPU que tiene más de 1 jugador en su equipo, que puedas elegir contra quien luchar en el order select

- [ ] Reemplazar los diálogo de ventana cuando se vaya a asignar un valor como la IP u online port. Básicamente que los datos se puedan introducir en la misma pantalla

- [ ] En fight.ssz programar 2 nuevas funciones de onlinematch.maxdrawgames = 2 y onlinematch.wins = 1 que puedan ser configuradas en options.lua para ponerlas en fight.def de modo que esos sean los valores para las opciones del online que se carguen y cambien.

- [ ] Agregar la opción de incrementar desde las opciones los offsetRows (Puede ser un data.offsetrows y que esa variable almacena el número) y por cada nuevo que se agregue escribir en el select.def un randomselect.

- [ ] Implementar una opción de Rematch en la winner screen. Si =  luchar con los mismos personajes. No = Here comes a New Challenger

- [ ] Implementar la selección de paleta del personaje que escojas en el char select (Para esto el sprite que se muestra como preview debe ser leído directamente desde la carpeta del char como hace ikemen go)

- [ ] Crear Tournament Mode
![Alt text](https://i.imgur.com/9eU9lsC.png)

- [ ] Agregar nuevo modo de visualización de stages “chart” como en SF4 basado en el char select
![Alt text](https://i.postimg.cc/C52PtPTb/Stages-en-Casillas.png)

- [ ] Crear un Tower Mode
![Alt text](https://i.postimg.cc/SsFy0dqF/tower-mode.png)

- [ ] Pantalla de logros
![Alt text](https://i.postimg.cc/L8LLKCF2/Logros.jpg)

- [ ] Añadir el tag system como un 4to modo de juego (Sobre el tag mode integrado al ikemen plus original): https://mugenguild.com/forum/topics/ikemen-plus-181972.100.html

- [ ] Implementar menú de pausa

- [ ] Crear sistema de guardado para el modo arcade. Ejemplo: estas en el match 6 y deseas salir, al presionar esc o abrir el menú de pausa, debe haber una opción entre las últimas que diga: “Salir sin guardar” y otra “GUARDAR Y SALIR”, al presionar guardar y salir, el ikemen debe guardar el match 6 y que cuando vuelvas a elegir el modo arcade te pregunte si deseas comenzar una nueva partida (Empezaría desde match 1) o si quieres continuar donde lo dejaste, que ponga en paréntesis el porcentaje en el que te quedaste, ejemplo (match 6 = 60% considerando al match 10 como el 100%) y use el match 6 como el punto de partida. En otras palabras es como si en lugar de empezar con personajes de nivel 1 empiece con los de nivel 6, saltándose los 5 anteriores niveles

- [ ] Agregar ventana de ver o borrar en el menú de replays al seleccionarlos (Ver - Borrar) con desplazamiento lateral

- [ ] Implementar un sistema de lista de ranking al completar el modo arcade

- [ ] Que el Ikemen pueda leer los movelist de los chars y si lo logramos, crear en el menú de extras un menú para acceder a ellos

- [ ] Programar sistema de puntos basado en el ADD004 y de acuerdo a dicho sistema asignar un rango o nivel de experiencia en la pantalla principal

- [ ] Agregar al select.def las otras bondades del ikemen go

- [ ] Conseguir portear la interactividad en stages de ikemen go

- [ ] Crear perfiles de usuarios

- [ ] Crear Modo Aventura

- [ ] Para el online del host incluir una opción de esperar en el training, pero que ya se esté ejecutando la espera del que se vaya a unir. Como en KOF 13

- [ ] Integrar una librería de c++ que permita capturar videos en formato .avi como los emuladores y estos se guardarán para ser observados en local replays

- [ ] Que se pueda jugar de 3 y 4 jugadores en multiplayer local y online

- [ ] Modo espectador para el modo online

- [ ] Ordenar código y simplificar lo necesario

- [ ] Portear el Engine a Linux, MacOS y Android

## Tutorials
*Coming Soon!*

## Resources
Here you can find content to build your projects or just for play on Ikemen.
- Mugen Free For All: https://mugenfreeforall.com
- Mugen Fighters Guild: https://mugenguild.com/forum/
- Infinity Mugen Team: https://www.infinitymugenteam.com
- MUGEN ARCHIVE: https://mugenarchive.com/forums/downloads.php
- Gamebanana: https://gamebanana.com/games/5694
- Mugen Multiverse: https://mugenmultiverse.forumotion.com

## Tools
Here you can find some tools that help you in development of your projects (Some missed tools are included in the main ikemen plus ultra folder called "tools")
- Fighter Factory (A Powerfull Mugen editor): http://fighterfactory.virtualltek.com/
- Notepad++ (Script editor): https://notepad-plus-plus.org/
- Mp3Tag (A music tag editor): https://www.mp3tag.de/en/
- Radmin VPN (For Online Netplay): https://www.radmin-vpn.com/

## Engine Manual
S-SIZE is the programing core language used. It documentation, is still under development...
- To understand or modify the .lua scripts, you will need knowledge of the LUA programming language. There you have the official Lua Manual: https://www.lua.org/manual/5.2/
- For create characters and stages, there you have the official MUGEN Elecbyte Documentation here: http://www.elecbyte.com/mugendocs-11b1/mugen.html

## Discord Support
If you need help, you can find support from developers and contributors for this engine in the official Ikemen Discord Server: https://discord.gg/KV5EPnMuA7

## Ikemen Plus Ultra VS Ikemen Go
To understand this, once again the special contributor ***PlasmoidThunder*** says:

"**IKEMEN SSZ** (Currently Called: Plus Ultra) is for people who want to mess with the engine beyond modification of Lua files. Literally altering behaviour as they see fit. It's a quick option to test changes".

"**IKEMEN GO** is for people who want their game to follow what MUGEN does but with extra features/fixes. Modifying the engine code is beyond most people due to the 
specific build environment and necessity to compile changes to an executable each time".

## References
>- Original Repository Source Code:
>https://osdn.net/users/supersuehiro/pf/ikemen/wiki/FrontPage
>
>- Original Ikemen Plus Source Code:
>https://github.com/acdgames/Ikemen-Plus
>
>- Current Ikemen Engine (Ikemen Go) Source Code:
>https://github.com/Windblade-GR01/Ikemen-GO

## License
The code is under the MIT Licence.
Non-code assets are under CC-BY 3.0.
Check [License.txt](License.txt) for more details.

## Projects Powered By Ikemen Plus Ultra
>***MUGENGERS 4 - THE OROCHI'S ORIGIN:*** https://www.youtube.com/watch?v=TezLZpIdbac
>
>[![Alt text](https://img.youtube.com/vi/TezLZpIdbac/maxresdefault.jpg)](https://www.youtube.com/watch?v=TezLZpIdbac)

>***ULTIMATE SMASHBOX:*** In development...
>
>[![Alt text](https://i.ytimg.com/vi/C5VTzhcFa3g/maxresdefault.jpg)](https://www.youtube.com/channel/UCPEISiiXtH494o63xeBu3Xg)
