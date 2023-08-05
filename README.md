# I.K.E.M.E.N PLUS ULTRA (I.K.E.M.E.N SSZ)
*Ikemen Plus Ultra* is an updated version of the **(CLASSIC/OLD) I.K.E.M.E.N PLUS** version uploaded by ***acdgames***. This engine was made by ***Suehiro*** under **S-SIZE** language, improved by ***acdgames*** and currently reworked by ***CD2*** and ***Strong FS***. (If you are looking for the latest Ikemen Engine, is called Ikemen GO).

- Consider this version of Ikemen engine an **alternative** in case Ikemen GO doesn't work for you.

- This engine can be used to **create advanced MUGENS** or **Fighting Games**, which can be run on any PC from 2008 onwards, without a graphics card (Runs under DirectX Render).

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
- **OpenGL:** Is not need, runs with DirectX 11

## Download
Lastest Version Here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/releases
[![Alt text](https://i.postimg.cc/XvX7yhw5/1561.jpg)](https://github.com/CableDorado2/Ikemen-Plus-Ultra/releases)

## Table of Contents

>[Ikemen Plus Ultra VS Ikemen Go](#ikemen-plus-ultra-vs-ikemen-go)
>
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
>[References](#references)
>
>[License](#license)
>
>[Projects Powered By Ikemen Plus Ultra](#projects-powered-by-ikemen-plus-ultra)

## Ikemen Plus Ultra VS Ikemen Go

"**IKEMEN SSZ** (Currently Called "Plus Ultra") is for people who want to mess with the engine beyond modification of Lua files. Literally altering behaviour as they see fit. It's a quick option to test changes and uses his own S-SIZE (SSZ programing language) which is similar to the C language. **Ikemen Plus Ultra it's a facelift to the Classic/Old Ikemen Engine.**

"**IKEMEN GO** is for people who want their game to follow what MUGEN does but with extra features/fixes. Modifying the engine code is beyond most people due to the 
specific build environment and necessity to compile changes to an executable each time". **Ikemen Go it's the latest version of Ikemen Engine.**

## Default Controls
| Action | Keyboard P1 | Keyboard P2 | Gamepad *(Supported from v1.2 onwards)* |
| --- | --- | --- | --- |
| ↑ | Up Arrow | KP_5 | -3 |
| ↓ | Down Arrow | KP_2 | -4 |
| ← | Left Arrow | KP_1 | -1 |
| → | Right Arrow | KP_3 | -2 |
| A/***LK*** | A | U | 0 |
| B/***MK*** | S | I | 1 |
| C/***HK*** | D | O | 4 |
| X/***LP*** | Z | J | 2 |
| Y/***MP*** | X | L | 3 |
| Z/***HP*** | C | L | 5 |
| **Taunt**/Start | Enter/Return | KP_0 | 9 |
| **Pause**/Resume | SpaceBar |  |  |
| UI Confirm | Enter/Return |  |  |
| UI Back | Esc |  |  |

## TODO List
CD2: Plans for future updates, they are in Spanish, because this is how I understand my ideas (If you can translate them, understand and offer help, will be great for progressing with this engine!):

**v1.3**
------------

- [ ] La pantalla Demo después del title screen, se debe poder saltar con cualquier tecla antes asignada para jugar (Agregar texto "Demo Mode" en la esquina superior derecha).

- [ ] Al jugar como single contra la CPU, si tiene a más de 1 miembro en su equipo, el p1cmd debe tener control para elegir contra qué miembro luchar primero en order select screen.

- [ ] El jefe final o algún char que tenga un parametro aparezca en modo single tal como funcionan los bonus games, dado que la cpu en modo simul mostrará 2, 3 o 4 jefes finales y es mejor controlar eso bajo un parametro.

- [ ] Mejorar lógica del desplazamiento para menú de Misiones y Eventos (Al agregar más del límite de pantalla, entonces automáticamente sube como el menú sound test).

- [ ] El sprite/Portrait del char en Single Boss Fight, debe aparecer inmediatamente en character select como ocurre en Co-Op Mode.

- [ ] Corregir en función "backMenu" que al volver al char select durante el Arcade Mode, no recuerda contra quién vas a luchar y salta este error:
[![Alt text](https://i.postimg.cc/HnYTSL0f/back-Menu-Arcade-Error.png)]()

- [ ] Definir stages desde el main menu con parametro: data.stage = {t_stageDef['stagename']} tal como funciona el: data.p1Char = {t_charAdd['charname']}

- [ ] Mejorar lógica del menú de estadísticas.

- [ ] Opción de Rematch en Winner Screen (YES = Luchar con los mismos personajes --- NO = Here comes a New Challenger/Volver a Char Select).

- [ ] Agregar un snd y sprite al obtener perfect, first attack, etc. (fight.ssz).

- [ ] Capturar pantalla en cualquier momento con tecla "Impr Pant" y guardar la screenshot en directorio: "saved/screenshots/NombreDeVentana000.png".

- [ ] Opciones de video que permitan personalizar la ventana del Ikemen (Cambiar entre modo ventana, fullscreen y pantalla completa sin bordes). Así como activar o desactivar los bordes del modo ventanas.

- [ ] Cargar archivos de video.

- [ ] Agregar soporte para reconocer a un 2do Gamepad.

**v1.4**
------------

- [ ] Más parametros para el Select.def.

- [ ] Tag system como un 4to Team Mode. (Info sobre el tag integrado al ikemen plus original):https://mugenguild.com/forum/topics/ikemen-plus-181972.100.html

- [ ] Pause Menu/Screen.

- [ ] Tower Mode: https://youtu.be/GAoGLx411Sk?t=3

- [ ] Story Mode Concept.

- [ ] Sistema de guardado para el modo historia. Ejemplo: estas en el stage 6 y deseas salir, al presionar esc o abrir el menú de pausa, debe haber una opción entre las últimas que diga: “Salir sin guardar” y otra “GUARDAR Y SALIR”, al presionar guardar y salir, Ikemen debe guardar el progreso hasta la stage 6 y cuando vuelvas a elegir el modo historia pregunte si deseas comenzar una nueva partida (Empezaría desde stage 1) o si quieres continuar donde lo dejaste y use el stage 6 como el punto de partida. En otras palabras es como si en lugar de empezar con personajes de order 1 empiece con los de order 6, saltándose los 5 anteriores niveles.

**v1.5**
------------

- [ ] Sistema de puntos basado en el Add004.

- [ ] Ranking al completar o perder en Modo Arcade.

[![Alt text](https://angryjellyfish.files.wordpress.com/2019/11/yvqrnyn.png?w=584)]()

- [ ] Leer archivos movelist.dat dentro de los chars.

- [ ] Mejorar el Training Mode con más parametros para el Dummy.

- [ ] Tournament Mode: https://youtu.be/pjYavslQ0tE?t=3
[![Alt text](https://i.postimg.cc/c4MHqfxv/1560.jpg)](https://youtu.be/pjYavslQ0tE?t=3)

**v1.6**
------------

- [ ] 3er tipo de visualización de stages estilo “chart” (lógica basada en el char select).
[![Alt text](https://i.postimg.cc/C52PtPTb/Stages-en-Casillas.png)](https://youtu.be/FHwlSkCkQ50)

- [ ] Notificación al desbloquear logros durante el match + Pantalla de Logros.
[![Alt text](https://i.postimg.cc/L8LLKCF2/Logros.jpg)]()

- [ ] Legion Mode: https://youtu.be/k1VH6Bv0sas?t=24
[![Alt text](https://m.media-amazon.com/images/I/61bjcbXa+SL.jpg)](https://youtu.be/k1VH6Bv0sas?t=24)

**v1.7**
------------

- [ ] AttachedChars en Stages: https://youtu.be/90D57uQIGiY?t=8

- [ ] Adventure Mode, combinando elementos del Abyss Mode: https://youtu.be/5UI_nFAORnE?t=281
[![Alt text](https://i.postimg.cc/SRqT8xK0/Adventure-Mode-Concept.png)](https://youtu.be/y82f2VexwHc?t=11596)

**v1.8**
------------

- [ ] Soporte para Fntv2.

- [ ] Mejorar Rendimiento del engine, actualizando el SDL2.dll.

- [ ] Soporte para imágenes RGB/32bits y shaders

- [ ] Integrar una librería que permita capturar videos en formato .avi como los emuladores y estos se guardarán para ser observados en "local replays".

**v1.9**
------------

- [ ] Jugar hasta un máximo de 4 jugadores en multiplayer local y online.

- [ ] Hacer realidad las funciones del menú Netplay Settings.

- [ ] En sala de espera para Host del online, incluir una opción de acceder al training y esperar mientras juegas.

- [ ] El tiempo para los eventos, debe sincronizarse con un servidor de internet, de lo contrario bloquear los eventos.

- [ ] Perfiles de usuarios.

---------------------
v2.0 (Final Release)
---------------------

- [ ] Añadir Rollback Netcode.

- [ ] Ordenar código y simplificar lo necesario.

- [ ] Traducir los textos de menús a Español y Japonés, para habilitar la carga de scripts de acuerdo al idioma en las opciones de Screenpack.

- [ ] Portear el Engine a Linux, MacOS y Android.

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
S-SIZE is the programing core language used. It documentation is here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/wiki
- To understand or modify the .lua scripts, you will need knowledge of the LUA programming language. There you have the official Lua Manual: https://www.lua.org/manual/5.2/
- For create characters and stages, there you have the official MUGEN Elecbyte Documentation here: http://www.elecbyte.com/mugendocs-11b1/mugen.html

## Discord Support
If you need help, you can find support from developers and contributors for this engine in the official Ikemen Discord Server (**They normally answer questions about Ikemen GO**, so if you are going to ask about something for Ikemen Plus Ultra, consult in particular with the user **PlasmoidThunder#1542** which is one of the main contributors for this version): https://discord.gg/KV5EPnMuA7

## References
>- Original Repository Source Code:
>https://osdn.net/users/supersuehiro/pf/ikemen/wiki/FrontPage
>
>- Original Ikemen Plus Source Code:
>https://github.com/acdgames/Ikemen-Plus
>
>- Lastest Ikemen Engine (Ikemen Go) Source Code:
>https://github.com/Windblade-GR01/Ikemen-GO

## License
The code is under the MIT Licence.
Non-code assets are under CC-BY 3.0.
Check [License.txt](License.txt) for more details.

## Projects Powered By Ikemen Plus Ultra
>***MUGENGERS 4 - THE OROCHI'S ORIGIN:*** https://www.youtube.com/watch?v=TezLZpIdbac
>
>[![Alt text](https://img.youtube.com/vi/TezLZpIdbac/maxresdefault.jpg)](https://www.youtube.com/watch?v=TezLZpIdbac)

>***ULTIMATE SMASHBOX:*** https://www.youtube.com/channel/UCPEISiiXtH494o63xeBu3Xg
>
>[![Alt text](https://i.postimg.cc/13sh5ZxB/USX-Wallpaper.png)](https://sites.google.com/view/ultimatesmashbox/home)

>***TOUHOU: GENSOKYO RELOADED:*** https://twitter.com/official_thgr
>
>[![Alt text](https://i.postimg.cc/Vvk1hxm0/tgr.png)](https://1drv.ms/f/s!ApLvCUDLkbLnkXnS3xZ5rXRS4UN1)
