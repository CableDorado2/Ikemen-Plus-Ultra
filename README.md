<p align="center">
    <img src="https://github.com/user-attachments/assets/b1c02c56-6f49-4831-94c1-d27d773ce328"/>
</p>

---
*I.K.E.M.E.N. Plus Ultra* is an updated version of the **OLD** [**Ikemen Plus**](https://github.com/acdgames/Ikemen-Plus) (an Open Source Fighting Game Engine that supports resources from the M.U.G.E.N Engine). This engine was made by [***Suehiro***](https://osdn.net/users/supersuehiro/) under [**S-SIZE Project**](https://osdn.net/projects/ssz/), improved by [***K4thos***](https://www.youtube.com/@k4thos313) and currently in development by [***CD2***](https://www.youtube.com/@CableDorado2) with some features developed by [***Strong FS***](https://www.youtube.com/@StrongFS) and [***PlasmoidThunder***](https://www.youtube.com/@PlasmoidThunder).

> [!NOTE]
> - If you are looking for the official latest/current Ikemen Engine version, is called [**Ikemen GO**](https://github.com/ikemen-engine/Ikemen-GO).
>
> - Consider this Ikemen Plus Ultra branch as an **Alternative** in case that Ikemen GO doesn't work for you.
>
> - The current version is a public development release for testing purposes, may contain bugs and incomplete features, this means that comprehension, help and cooperation are appreciated.
>
> - This engine can be used to **Create Advanced MUGENS** or **Fighting Games**, which can be run on Low resources PC, without a graphics card (Because can use DirectX Render).
>
> Games Made with this Engine:
> - ***MUGENGERS: THE OROCHI'S ORIGIN***
> - ***ULTIMATE SMASHBOX***
> - ***???***

## Table of Contents

> - [Minimum System Requirements](#minimum-system-requirements)
>
> - [Roadmap](#roadmap)
>
> - [Tutorials](#tutorials)
>
> - [Resources](#resources)
>
> - [Tools](#tools)
>
> - [Engine Manual](#engine-manual)
>
> - [FAQ](#FAQ)
>
> - [About All IKEMEN Versions](#about-all-ikemen-versions)
>
> - [References](#references)
>
> - [License](#license)

## Minimum System Requirements
- **Operating System:**
    - Windows XP (Service Pack 3) 32 Bits
    - Linux: [Wine](https://wiki.winehq.org/Main_Page) is recommended
    - Android: [Winlator](https://github.com/brunodev85/winlator) is recommended.
- **CPU:**
    - Intel Atom CPU N455 (1.66GHz)
    - AMD ???
- **GPU with support for DirectX 11 or OpenGL 2.0:**
    - Intel Graphics Media Accelerator 3150 (256MB)
- **Memory:**
    - 1GB RAM
- **Storage:**
    - 2 GiB required

> [!WARNING]
> **THE ENGINE MAY NOT WORK IN WINDOWS 11. Runs on Version 24H2**

## Roadmap
This is a general view of what you can expect in next releases. This roadmap is constantly updated and can be modified in the future. If you want to offer help, it will be great for progressing with this engine!

**v1.5 (Next Update)**
------------

- Ranking al completar o perder en Modos Arcade, Survival, etc:
![Rank Results](https://github.com/CableDorado2/Ikemen-Plus-Ultra/assets/18058378/05f3306c-ab76-4de1-8935-679b83612df1)

- Durante el arcade, la forma en que está programada el here comes a new challenger hace uso de setCom(2, 0) en el menú de pausa causa que la IA se quede en nivel 0, pero es porque el jugador 2 recibe por unos instantes el control para poner pausa y que se vea la pantalla del challenger.

- Los combates de intermisiones dejan de funcionar si se juega en team mode.

- Implementar los parametros: music<roudnno>, musicfinal, musiclife, musicvictory en select.def.

- Leer archivos movelist.dat dentro de los chars.

**v1.6**
------------

- 3er tipo de visualización de stages estilo “chart”, (lógica basada en el char select) al ser activado debe cargarse desde una función diferente a la normal para evitar conflictos, asímismo debe usar los portrait (9000,0) para mostrar los íconos: https://www.youtube.com/watch?v=FHwlSkCkQ50
[![Alt text](https://static.wikia.nocookie.net/streetfighter/images/d/d6/SF%C3%97TK_Cosmic_Elevator_select.jpg/revision/latest?cb=20150201185002&path-prefix=es)](https://youtu.be/FHwlSkCkQ50)

- Preset team o Path Select para el arcade a lo kof 2002, Street Fighter 3 Third Strike o Arcana Heart 3 (definir en el select.def los equipos que aparecerán en el modo arcade cuando juegues contra la cpu turns o simul y que antes del order select te permita escoger contra cuál team luchar, lo mismo para el single basado en SF3).

- Crear un archivo para definir los nombres de los teams para el arcade, de modo que este nombre reemplace al del team leader en la vs screen si están definidos.

- Crear una copia del randomselect llamada randomteamselect que permita insertar la selección de teams aleatorios en select.def a lo kof2002um.

- Implementar los parametros: ordersurvival, hidden, slot en select.def

- Añadir al menú de perfil, una entrada para crear o editar equipos predefinidos que puedas elegir en el Character Select al jugar en Simul o Turns como la opción Customize Team en KOF XIII.
"Reserve Unit" de Ultimate Marvel vs Capcom 3:
![20250822233724_1](https://github.com/user-attachments/assets/a9241ef6-f0dc-4de4-9c54-93bcd7161974)
Saved Team en Dragon Ball Fighterz:
![20251118211345_1](https://github.com/user-attachments/assets/b042b089-8be3-4282-bff9-b903bc0082b7)
![20251118211534_1](https://github.com/user-attachments/assets/d741b360-2073-41f2-813f-a25696912f5c)


- En tournament cuando 2 jugadores humanos tienen el mismo control ejemplo p1 y p1, podría incluir un side select para que uno de los 2 se convierta en p2 y así evitar que se controlen como espejo al tener el mismo player asignado.

- Añadir una entrada de nombre para cada char escogido para que sea reconocido en el torneo (en caso de que se repita) y ese name que aparezca en lifebar durante el match.

- Opción para jugar el Modo Torneo en formato Eliminación Doble.

- Al jugar en team mode o coop el abyss, cada ranura de custom item se va a aplicar a cada jugador incrementando el nivel de estrategia sobre qué personaje usará X item.

- Integrar un sistema de diálogo en los matches siguiendo la lógica usada para la selección de reward del abyss mode.

- Añadir opción para mostrar la Victory Screen al final de la pelea mientras todos los personajes y los datos del escenario aún están cargados. (Garantizar el acceso para coincidir con los datos relacionados que a menudo son verificados por winscreens como WinKO, Life, etc. Para los Victory Quotes).

- Como lo anterior pero para la pantalla Continue.

- Al acceder a menús donde hay que introducir datos con teclado como el vault, netplay port o ip en online. Si el motor reconoce que estás usando gamepad, mostrar una pantalla con un teclado que permita introducir letras y números usando un cursor, en lugar de usar el teclado.

- Añadir sistema de decisiones al Modo Visual Novel.

- Incluir en training la opción de Damage Display (verificar que su inclusión no afecta al bonus de caltwalk). Probar programarlo desde match.lua.

- Implementar en character select, un parametro para ocultar columnas (offsetcolumns) como lo hace el offsetrows.

- Tag system como un 4to Team Mode. (Info sobre el tag integrado al ikemen plus original): https://mugenguild.com/forum/topics/ikemen-plus-181972.100.html.

**v1.7**
------------

- Probar mod de smash de forma global en match.cns: https://youtu.be/B4b4N16zigA?t=49

- Co-Op para el Versus Mode.

- Implementar parametros de transiciones entre stages (round<num>def).

- AttachedChars en Stages: https://youtu.be/90D57uQIGiY?t=8

- Agregar soporte para Localcoord en cada char, stage y fight.def.

- Agregar Lifebars, Face Portraits y Names para el modo simul cuando se juega de 3P_Simul y 4P_Simul como lo hace Ikemen GO.

- Agregar un snd y sprite al obtener perfect, first attack, etc. (fight.ssz).

- Probar cargar un commonfx en fight.def para almacenar los sprites del input display y damage display, sin que entren en conflicto con los que quieran portear su fightfx de Mugen.

- Crear un trigger para tener control sobre la animación de Round/Fight! para poder desactivarlos en bonus games o demo mode por ejemplo.

- Crear un trigger para activar o desactivar las transiciones por cada round. Al desactivarlas, el inicio de cada nuevo round sería como X-Men COTA o Mortal Kombat.

- Añadir función para crear loops en la función playBGM().

- Cambiar el drawPortrait por una funcion que cargue (así como lo hace con las sprites animation del char select en lugar de leer el airPath que lea el sffPath), probar eso en loader.lua y usar en char select una función parecida a f_drawCharAnim.

- Al configurar el Gamepad/Joystick del jugador 2 garantizar que no pierda el control después de asignar un botón.

- Lograr que los estados en reposo cuando se tiene cualquier mando conectado sean "101" en lugar de "-9" u otro valor (función getInputID en system-script.ssz). Así mismo en la asignación de botones, evitar que se asigne el propio valor de reposo.

- Agregar opción para configurar los controles de batalla en char select (Preferiblemente VS Mode y Tournament) excepto en online.

- Configurar controles de batalla desde el menú de pausa en plena partida.

- Detección al reconectar un mando.

**v1.8**
------------

- Soporte para Fntv2 y True Type Font (TTF).

- Soporte para cargar archivos PNG o PCX externos en lugar de usar siempre el formato SFF usando la función IMG_Load del SDL2.

- Soporte para imágenes RGB/32bits y Shaders.

- Integrar una librería que permita capturar y guardar videos en formato .avi (como algunos emuladores), para ser reproducidos con el reproductor de video en Gallery Mode.

- Soporte para modelos 3D integrando glTF?

- Mejorar Rendimiento del engine, actualizando el sdlplugin.

**v1.9**
------------

- Hacer realidad las funciones del menú Netplay Settings.

- En sala de espera para Host del online, incluir una opción de acceder al training y esperar mientras juegas.

- Jugar hasta un máximo de 4 jugadores en multiplayer local y online.

---------------------
v2.0 (Final Release)
---------------------

- Añadir Rollback Netcode.

- Ordenar código y simplificar lo necesario.

- Portear el Engine a Linux, MacOS, Android y iOS.

## Tutorials
**Basic:**
- *Coming Soon!*

**Advanced:**
- *Coming Soon!*

## Resources
Here you can find content to install and play on Ikemen.
- [Mugen Free For All](https://mugenfreeforall.com)
- [Mugen Fighters Guild](https://mugenguild.com/forum/)
- [Infinity Mugen Team](https://www.infinitymugenteam.com)
- [MUGEN ARCHIVE](https://mugenarchive.com/forums/downloads.php)
- [Gamebanana](https://gamebanana.com/games/5694)
- [Mugen Multiverse](https://mugenmultiverse.forumotion.com)

## Tools
Here you can find some recommended tools that will help you in development of your projects using this engine.
- [Fighter Factory](http://fighterfactory.virtualltek.com/) (A general purpose M.U.G.E.N content/asset Editor)
- [Radmin VPN](https://www.radmin-vpn.com/) (For Netplay)
- Visual C++ 2010 Express (IDE to edit and compile engine Source Code)
- [4GB Patch](https://ntcore.com/4gb-patch/) (To avoid Runtime Error when load heavy sff files)
- [SDL2 Gamepad Tool](https://generalarcade.com/gamepadtool/) (A simple GUI tool to create/modify gamepad mappings)
- [ReShade](https://reshade.me/) (Post-processing injector for games)
- [Notepad++](https://notepad-plus-plus.org/) (Script Editor)
- [GIMP](https://www.gimp.org/) (Image Editor)
- [Audacity](https://www.audacityteam.org/) (Audio Editor)
- [Mp3Tag](https://www.mp3tag.de/en/) (A music tag editor)

## Engine Manual
S-SIZE is the programing core language used. It documentation is here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/wiki
- To understand or modify the .lua scripts, you will need knowledge of the LUA programming language. There is the official manual from the version of Lua that uses this engine: https://www.lua.org/manual/5.2/

- For create characters and stages, you have to use the official MUGEN Elecbyte Documentation: http://www.elecbyte.com/mugendocs-11b1/mugen.html

## FAQ

## Is this the latest official version of the I.K.E.M.E.N. Engine?
**No**, this is a modified and in-development version of an older version of the original engine, specifically the I.K.E.M.E.N. Plus 0.3 version. The latest version is known as I.K.E.M.E.N. GO and is active by other developers (many of whom contributed to the plus version which this modification is based on).

## Why are you updating an older version?
Because it doesn't require only OpenGL to run (when I searched for this engine, the only version that worked for me was the Plus version because it uses software rendering as an alternative to OpenGL), which is the same as using DirectX if you're coming from Mugen.

## Where can I find system.def and mugen.cfg in I.K.E.M.E.N. Plus Ultra?
The loading of assets and main functions is located in the script folder, in the files:
screenpack.lua
common.lua
main.lua

While the configuration definition is located in options.lua and the saved data is shared in the directories:
save/data_sav.lua
save/config.ssz

I am working on a way to generate a Lua script called screenpack.lua that contains a conversion of all the necessary variables used in a system.def file, combining them with those of a base Lua script that will contain the "screenpack vars" of new features. This way, the resulting Lua file contains the exact positions and assets as loaded in M.U.G.E.N, but can also serve as a new space for customizing the screenpack in I.K.E.M.EN. and this file would only be generated the first time the engine is opened and the system.def is detected.

This is because the beauty of manipulating all the elements lies in the Lua programing language, and trying to literally transfer a copy of these would, in a sense, limit the user's ability to implement quick new engine features and with less dependency. In this case, users would have to implement their new features in both Lua and the hypothetical copy of "system.def", like I.K.E.M.E.N. GO does.

In fact, if you're attentive or familiar with how this engine works, this job already happen when using and porting functions to Lua instead of using core ssz language itself. Because the latter is where the base functions are actually created and has direct communication with the libraries used by the engine, using a syntax similar to C++.

## How can I port my M.U.G.E.N screenpack to I.K.E.M.E.N. Plus Ultra?
First, consider trying I.K.E.M.E.N. GO, which has system.def and greater compatibility with M.U.G.E.N resources.

However, if it didn't work for you, or you still want to use this alternative, You'll need to adapt all assets from system.def and/or derived assets so that the engine can first read them (for now, they must be 8-bit indexed sprites or images, or the equivalent of saving the sprite.sff file in Fighter Factory in M.U.G.E.N. 1.0 format). Then, declare their location in Lua (preferably screenpack.lua) and then call them with a drawing function like animPosDraw so that the element finally appears in the function/screen/menu where you're programming.

Within all the scripts, there are many examples of ways you can import resources. It's recommended to start by gradually replacing the groups or indexes contained in the sprite.sff files to understand how they work and then finally be able to integrate your own.

The only exception to this rule of using Lua to porting content from M.U.G.E.N is select.def (where characters and stages are added) and fight.def (where, like M.U.G.E.N, you can add health bars and other elements that are displayed during the fight).

## Are there tutorials on how to create functions or edit the I.K.E.M.E.N. Plus Ultra Screenpack?
There are tutorials about basic screenpack editing for the non-Ultra version, shared years ago by the user TheFclass97: https://www.youtube.com/playlist?list=PLUJEkERU43iJNxU59n0qELKSUrFTsb4zh

They can be a good place to start understanding the engine. However, because the location of several functions has changed in this Plus Ultra version, it is recommended to wait until the engine is more consistent (expected to reach this state in v1.8) before offering documentation or a guide on how to use it.

This is because with each update, the methods for doing certain things are changed or improved, and if something is explained in its current state, it will most likely be simpler or very different in the next version, rendering the guide "obsolete."

## Where can I add rows and columns in I.K.E.M.E.N. Plus Ultra?
In the options menu, System Settings-Character Select Settings, you can change the number of columns and rows, as well as customize the position and size of cells.

## Can I run this engine on Android or Linux?
Yes, for Linux it uses Wine and for Android it uses Box86. Both programs can be considered Windows application emulators designed for those operating systems. Native executables for Linux and possibly macOS are planned, but only time will tell...

## Do you have a Website or Discord server?
I.K.E.M.E.N. Plus Ultra still does not have an official website. If you need help, you can find support from developers and contributors for this engine in the official Ikemen Discord Server: https://discord.gg/KV5EPnMuA7

Please link to this github repo when directing anyone to the project.

> [!CAUTION]
> Official Downloads/Updates are posted in our [Releases](https://github.com/CableDorado2/Ikemen-Plus-Ultra/releases) page.
> Any build found outside of this site may be outdated or be a misrepresentation (Always keep track of publication dates).

## About All IKEMEN Versions
**S-SIZE Project** is an original programming language project done by **Suehiro** with C++, it has sound, ascii, and basics implemented. its abbreviation is SSZ.

>**I**tsu made mo **K**ansei shinai **E**ien ni **M**ikansei **EN**gine

**I.K.E.M.E.N.** (retroactively referred to as S-SIZE IKEMEN or Vanilla). Is the **First Version** of I.K.E.M.E.N. Engine that works like a M.U.G.E.N Clone using a compiled SSZ Project as interpreter, adding it suport for Lua language, SDL, OpenGL, Ogg Vorbis and other things. All used is opensource so **Suehiro** adapted the libraries to the project.
This I.K.E.M.E.N. Software is an expansion of his original SSZ code.

**I.K.E.M.E.N. Plus** is an unofficial update/expansion project worked by **K4thos** (not made by Suehiro) of the Vanilla version, using the lua language above implemented to extend the capabilities of the basics in main engine.

**I.K.E.M.E.N. Plus Ultra** is an unofficial large scale update of the previous version maintained by **CD2** in association with **Strong FS**. It contains new features and engine improvements inspired from: Ikemen GO, Commercial Fighting Games and Touhou: Gensokyo Reloaded Fangame.

**I.K.E.M.E.N. GO** is the official latest version of the engine. The original creator **Suehiro** abandoned his own source code in favour of rewriting the engine in Google's Go language (hence the name). This version it is under **active development by various developers** and is for people who want their game to follow what M.U.G.E.N does but with universal extra features/fixes.

**I.K.E.M.E.N. GO Plus** presented by **K4thos** was made to test some functions meanwhile the original is updated using the mentioned GO version. GO Plus is what I.K.E.M.E.N. Plus was to Vanilla, but over time GO Plus and GO merged into the same thing.

## References
>- Suehiro's Main Page:
>https://osdn.net/users/supersuehiro/
>
>- S-SIZE Project Source Code:
>https://osdn.net/projects/ssz/
>
>- B.I.J.I.N RandomSelect's Build Source Code:
>https://code.google.com/archive/p/random-tac/
>
>- I.K.E.M.E.N. SSZ Source Code:
>https://osdn.net/users/supersuehiro/pf/ikemen/wiki/FrontPage
>
>- I.K.E.M.E.N. SSZ Google Code Archive:
>https://code.google.com/archive/p/ikemen/
>
>- I.K.E.M.E.N. Plus (What this project is based on) Source Code:
>https://github.com/acdgames/Ikemen-Plus
>
>- I.K.E.M.E.N. Plus Ultra Linux Fork:
>https://github.com/Ahmed-Dzair-Dev/Ikemen-Plus-Ultra-Linux
>
>- I.K.E.M.E.N. GO Plus Source Code:
>https://github.com/K4thos/Ikemen-GO-Plus
>
>- Latest I.K.E.M.E.N. Engine (I.K.E.M.E.N. GO) Source Code:
>https://github.com/ikemen-engine/Ikemen-GO
>
>- MUGEN Database Wiki:
>https://mugen.fandom.com/wiki/Ikemen#2

## License
The code is under the MIT Licence.
Non-code assets are under CC-BY 3.0.
Check [License.txt](License.txt) for more details.
