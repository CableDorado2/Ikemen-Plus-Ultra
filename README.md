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
CD2: En Español porque así es como entiendo mis ideas (Si las puedes traducir, entender y ofrecer ayuda estupendo!):
- [ ] La pantalla Demo después del title screen, se debe poder saltar con cualquier tecla antes asignada para jugar (Agregar texto Demo Mode en esquina superior derecha)

- [ ] Hacer que las capturas de pantallas se emitan correctamente como los replays y no con 1 foto de retraso

- [ ] Agregar carga de videos

- [ ] Añadir el tag system como un 4to modo de juego (Sobre el tag mode integrado al ikemen plus original): https://mugenguild.com/forum/topics/ikemen-plus-181972.100.html

- [ ] Implementar menú de pausa

- [ ] Agregar ventana de ver o borrar en el menú de replays al seleccionarlos (Ver - Borrar) con desplazamiento lateral.

- [ ] Ranking al completar o perder en el modo arcade.

- [ ] Más parametros para el Select.def

- [ ] AttachedChars en Stages: https://youtu.be/90D57uQIGiY?t=8

- [ ] Traducir los textos de menus a Español y Japonés para habilitar la carga de scripts de acuerdo al idioma en las opciones de Screnpack

- [ ]  Agregar soporte para Fntv2

- [ ] Mejorar el Rendimiento del engine actualizando el SDL2.dll

- [ ]  Arreglar para options.lua que un username escrito con espacios, se pueda editar a uno sin espacios. Ejemplo: Si registro "Strong FS", cuando quiera editarlo y registrar "CD2", me debe dejar guardar este último (Actualmente no lo guarda y se mantiene en el ssz "Strong FS").

- [ ] Agregar un icono para el menú que te indique y detecte si estás usando Mando o Teclado

- [ ] Agregar opciones de video que permitan personalizar la ventana del ikemen, cambiar entre modo ventana, fullscreen y pantalla completa sin bordes. Así como activar o desactivar los bordes del modo ventanas

- [ ] Implementar el Modo Time Trials

- [ ] Agregar el modo de juego Co-Op (1P & 2P) Vs CPU en versus, quick match y training

- [ ] Implementar para la selección de stage, la posibilidad de asignarle la música original, una random o alguna de las que tienes guardadas en la carpeta sounds

- [ ] Corregir el backMenu que al volver al char select del arcade mode, no recuerda contra quien vas a luchar y salta este error:
![Alt text](https://i.postimg.cc/HnYTSL0f/back-Menu-Arcade-Error.png)

- [ ] Agregar un snd y sprite para cuando obtengas perfect, first attack, etc. Como funciona el KO (fight.ssz)

- [ ] El sprite/Portrait del char en Single Boss Fight, debe aparecer inmediatamente como ocurre al seleccionar un char.

- [ ] Al jugar contra la CPU, si tiene a más de 1 miembro en su equipo, el p1cmd puede tener control para elegir contra qué miembro luchar primero en order select screen (Así como funciona escoger el adversario en 1P VS CPU).

- [ ] Asignar los offsetRows desde las opciones de Screenpack (Puede ser un data.offsetrows y que esa variable almacene el número). Por cada nuevo offsetRows que se agregue, Ikemen debe escribir automaticamente en el select.def un randomselect.

- [ ] Opción de Rematch en Winner Screen (YES = Luchar con los mismos personajes --- NO = Here comes a New Challenger/Volver a Char Select).

- [ ] Tower Mode: https://youtu.be/GAoGLx411Sk?t=3

- [ ] Tournament Mode: https://youtu.be/pjYavslQ0tE?t=3

- [ ] Cargar sprite de chars, para el char select directamente desde su archivo sff; eliminando por completo el uso de herramientas externas como sprmake2.exe.

- [ ] Selección de paletas en char select.

- [ ] Visualización de stages tipo “chart” (lógica basada en el char select).
![Alt text](https://i.postimg.cc/C52PtPTb/Stages-en-Casillas.png)

- [ ] Mejorar el Training Mode con más parametros para el Dummy.

- [ ] Sistema de guardado para el modo historia. Ejemplo: estas en el stage 6 y deseas salir, al presionar esc o abrir el menú de pausa, debe haber una opción entre las últimas que diga: “Salir sin guardar” y otra “GUARDAR Y SALIR”, al presionar guardar y salir, Ikemen debe guardar el progreso hasta la stage 6 y cuando vuelvas a elegir el modo historia pregunte si deseas comenzar una nueva partida (Empezaría desde stage 1) o si quieres continuar donde lo dejaste y use el stage 6 como el punto de partida. En otras palabras es como si en lugar de empezar con personajes de order 1 empiece con los de order 6, saltándose los 5 anteriores niveles.

- [ ] Leer archivos movelist.dat dentro de los chars.

- [ ] Sistema de puntos basado en el ADD004.

- [ ] Notificación al desbloquear logros durante el match + Pantalla de Logros.
![Alt text](https://i.postimg.cc/L8LLKCF2/Logros.jpg)

- [ ] Perfiles de usuarios.

- [ ] Adventure Mode.

- [ ] Integrar una librería que permita capturar videos en formato .avi como los emuladores y estos se guardarán para ser observados en "local replays".

- [ ] Jugar hasta un máximo de 4 jugadores en multiplayer local y online.

- [ ] En sala de espera para Host del online, incluir una opción de acceder al training y esperar mientras juegas.

- [ ] Modo espectador para el online.

- [ ] Añadir Rollback Netcode.

- [ ] Ordenar código y simplificar lo necesario.

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
