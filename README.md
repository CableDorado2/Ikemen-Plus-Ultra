# I.K.E.M.E.N PLUS ULTRA
*Ikemen Plus Ultra* is an updated version of the **OLD** [**Ikemen Plus**](https://github.com/acdgames/Ikemen-Plus). The engine was made by [***Suehiro***](https://osdn.net/users/supersuehiro/) under [**S-SIZE Project**](https://osdn.net/projects/ssz/), improved by [***K4thos***](https://www.youtube.com/@k4thos313) and currently developing by [***CD2***](https://www.youtube.com/@CableDorado2), [***Strong FS***](https://www.youtube.com/@StrongFS) and some features developed by [***PlasmoidThunder***](https://www.youtube.com/@PlasmoidThunder).

- If you are looking for the latest or current Ikemen Engine version, is called [**Ikemen GO**](https://github.com/ikemen-engine/Ikemen-GO).

- Consider this Ikemen Plus Ultra branch as an **Alternative** in case that Ikemen GO doesn't work for you.

- This engine can be used to **Create Advanced MUGENS** or **Fighting Games**, which can be run on Low resources PC, without a graphics card (Because can use DirectX Render).

- The current version is a public development release for testing purposes, may contain bugs and incomplete features that we hope will be finished in *the final release*.

- Help and cooperation are appreciated.

## Minimum System Requirements
- **System:** Windows XP SP3 - 32 Bits **(MAY NOT WORK IN WINDOWS 11)**.
- **Proccessor:** Intel(R) Atom(TM) CPU N455 1.66GHz
- **Memory:** 1GB RAM
- **Graphics:** Intel(R) Graphics Media Accelerator 3150 - 256MB
- **OpenGL:** 2.0 but also, runs with DirectX

## Operating System Compatibility
| OS | Runs | Internal Dir Opening |
| --- | --- | --- |
| Windows | Native | Yes |
| Linux | [Wine](https://wiki.winehq.org/Main_Page) | No |
| MacOS | ? | ? |
| Android | [Winlator](https://github.com/brunodev85/winlator) | ? |

## Download
Lastest version can be found here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/releases
![v1 3](https://github.com/CableDorado2/Ikemen-Plus-Ultra/assets/18058378/3eee08af-8687-49f9-85b3-d1b43c7f750b)

## Table of Contents

>[About All IKEMEN Versions](#about-all-ikemen-versions)
>
>[Games Made in Ikemen Plus Ultra](#games-made-in-ikemen-plus-ultra)
>
>[Roadmap](#roadmap)
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

## About All IKEMEN Versions
**S-SIZE Project** is an original programming language project done by **Suehiro** with C++, it has sound, ascii, and basics implemented. its abbreviation is SSZ.

**IKEMEN** (retroactively referred to as S-SIZE IKEMEN or Vanilla). Is the **First Version** of Ikemen Engine that works like a Mugen Clone using a compiled SSZ Project as interpreter, adding it suport for Lua language, SDL, OpenGL, Ogg Vorbis and other things. All used is opensource so **Suehiro** adapted the libraries to the project.
This Ikemen is an expansion of his original SSZ code.

**IKEMEN Plus** is an unofficial update/expansion project worked by **K4thos** (not made by Suehiro) of the Vanilla version, using the lua language above implemented to extend the capabilities of the basics in main engine.

**IKEMEN Plus Ultra** is an unofficial large scale update of the previous version that contains new features and engine improvements inspired from Touhou: Gensokyo Reloaded, Ikemen GO and Commercial Fighting Games. This branch is maintained by **CD2** with help of **Strong FS**.

**IKEMEN GO** is the official latest version of the engine. The original creator **Suehiro** abandoned his own source code in favour of rewriting the engine in Google's Go language (hence the name). This version it is under **active development by various developers** and is for people who want their game to follow what MUGEN does but with universal extra features/fixes.

**IKEMEN GO Plus** presented by **K4thos** was made to test some functions meanwhile the original is updated using the mentioned GO version. GO Plus is what IKEMEN Plus was to Vanilla, but over time GO Plus and GO merged into the same thing.

## Projects Made in Ikemen Plus Ultra
- *MUGENGERS: THE OROCHI'S ORIGIN*
- *ULTIMATE SMASHBOX*

## Roadmap
This is a general view of what you can expect in next releases. This roadmap is constantly updated and can be modified in the future, but you should expect all these features. If you want to offer help, it will be great for progressing with this engine!

**v1.5 (Next Update)**
------------

- Agregar opción de Team Duplicates para que si vas a elegir un personaje repetido, se salte la casilla si está activada.

- Crear una copia del randomselect llamada randomteamselect que permita insertar la selección de teams aleatorios en select.def a lo kof2002um.

- Implementar los parametros: music<roudnno>, musicfinal, musiclife, musicvictory en select.def.

- Los combates de intermisiones dejan de funcionar si se juega en team mode.

- Arreglar preview de random chars que no coincide con el char al usar la visualización por sprites.

- En tournament cuando 2 jugadores humanos tienen el mismo control ejemplo p1 y p1, podría incluir un side select para que uno de los 2 se convierta en p2 y así evitar que se controlen como espejo al tener el mismo player asignado.

- Añadir una entrada de nombre para cada char escogido para que sea reconocido en el torneo (en caso de que se repita) y ese name que aparezca en lifebar durante el match.

- Sistema de puntos.

- Ranking al completar o perder en Modos Arcade, Survival, etc.

![Rank Results](https://github.com/CableDorado2/Ikemen-Plus-Ultra/assets/18058378/05f3306c-ab76-4de1-8935-679b83612df1)

- Durante el arcade, la forma en que está programada el here comes a new challenger hace uso de setCom(2, 0) en el menú de pausa causa que la IA se quede en nivel 0, pero es porque el jugador 2 recibe por unos instantes el control para poner pausa y que se vea la pantalla del challenger.

- Agregar soporte para Localcoord en cada char, stage y fight.def.

- Agregar Lifebars, Face Portraits y Names para el modo simul cuando se juega de 3P_Simul y 4P_Simul como lo hace Ikemen GO.

- Reprogramar el reproductor de video (especialmente para que admita más formatos y permita operar usando las funciones del SDL para controlar el volumen, teclas para saltar el video, etc)

**v1.6**
------------

- 3er tipo de visualización de stages estilo “chart”, (lógica basada en el char select) al ser activado debe cargarse desde una función diferente a la normal para evitar conflictos, asímismo debe usar los portrait (9000,0) para mostrar los íconos: https://www.youtube.com/watch?v=FHwlSkCkQ50
[![Alt text](https://static.wikia.nocookie.net/streetfighter/images/d/d6/SF%C3%97TK_Cosmic_Elevator_select.jpg/revision/latest?cb=20150201185002&path-prefix=es)](https://youtu.be/FHwlSkCkQ50)

- Preset team o Path Select para el arcade a lo kof 2002, Street Fighter 3 Third Strike o Arcana Heart 3 (definir en el select.def los equipos que aparecerán en el modo arcade cuando juegues contra la cpu turns o simul y que antes del order select te permita escoger contra cuál team luchar, lo mismo para el single basado en SF3)

- Implementar los parametros: ordersurvival, hidden, slot en select.def

- Cambiar el drawPortrait por una funcion que cargue (así como lo hace con las sprites animation del char select en lugar de leer el airPath que lea el sffPath), probar eso en loader.lua y usar en char select una función parecida a f_drawCharAnim.

- Probar cargar un commonfx en fight.def para almacenar los sprites del input display y damage display, sin que entren en conflicto con los que quieran portear su fightfx de Mugen.

- Integrar la función de bgm.loops.

- Implementar en character select, un parametro para ocultar columnas (offsetcolumns) como lo hace el offsetrows.

- Tag system como un 4to Team Mode. (Info sobre el tag integrado al ikemen plus original): https://mugenguild.com/forum/topics/ikemen-plus-181972.100.html

- Leer archivos movelist.dat dentro de los chars.

- Crear un trigger para tener control sobre la animación de Round/Fight! para poder desactivarlos en bonus games o demo mode por ejemplo.

- Crear un trigger para activar o desactivar las transiciones por cada round. Al desactivarlas, el inicio de cada nuevo round sería como X-Men COTA o Mortal Kombat.

- Al acceder a menús donde hay que introducir datos con teclado como el vault, netplay port o ip en online. Si el motor reconoce que estás usando gamepad, mostrar una pantalla con un teclado que permita introducir letras y números usando un cursor, en lugar de usar el teclado.

- Crear una función como setDebugScript pero que permita soportar todas las funciones de script.ssz (debug.lua por alguna razón no lo hace) y ejecutarse durante toda la batalla o al menos al final de la partida. Para implementar las siguientes características:

  - Win Screen que se muestra al final de la pelea mientras todos los personajes y los datos del escenario aún están cargados (por lo que podríamos usar el fondo del escenario y los datos de animación de los personajes).

  - Como lo anterior pero para la pantalla Continuar

  - Ambas características se han implementado en el código del paquete de pantalla actual, pero la solución actual tiene un alto rendimiento (aumenta el tiempo de carga cuando se inicia el ejecutable) y no es perfecta (no hay acceso para coincidir con los datos relacionados que a menudo son verificados por winscreens como WinKO, Life, etc.)

- Al configurar el Gamepad/Joystick del jugador 2 garantizar que no pierda el control después de asignar un botón.

- Lograr que los estados en reposo cuando se tiene cualquier mando conectado sean "101" en lugar de "-9" u otro valor (función getInputID en system-script.ssz). Así mismo en la asignación de botones, evitar que se asigne el propio valor de reposo.

- Agregar opción para configurar los controles de batalla en char select (Preferiblemente VS Mode y Tournament) excepto en online.

- Configurar controles de batalla desde el menú de pausa en plena partida.

- Detección al reconectar un mando.

**v1.7**
------------

- Incluir pregunta para guardar o no los replays online.

- Co-Op para el Versus Mode.

- Revisar código del Damage Display para que no afecte al bonus de caltwalk ni cause que algunos chars tengan un clon por un helper faltante (Probablemente sea las variables y estados que usa).

- AttachedChars en Stages: https://youtu.be/90D57uQIGiY?t=8

- Agregar un snd y sprite al obtener perfect, first attack, etc. (fight.ssz).

- Implementar parametros de transiciones entre stages (round<num>def).

- Ver cómo se podría integrar un sistema de diálogo en los matches.

- Buscar una forma de forzar que los datos SFF cargados utilicen una paleta personalizada, ya sea a través de un archivo ACT externo o en el caso de SFFv2, que se almacenen directamente en el archivo.

**v1.8**
------------

- Soporte para Fntv2 y True Type Font (TTF).

- Soporte para imágenes RGB/32bits y Shaders.

- Soporte para cargar archivos PNG o PCX externos en lugar de usar siempre el formato SFF usando la función IMG_Load del SDL2.

- Soporte para modelos 3D integrando glTF.

- Integrar una librería que permita capturar videos en formato .avi como los emuladores y estos se guardarán para ser observados en ¿local replays?.

- Mejorar Rendimiento del engine, actualizando el SDL2.dll.

**v1.9**
------------

- Hacer realidad las funciones del menú Netplay Settings.

- En sala de espera para Host del online, incluir una opción de acceder al training y esperar mientras juegas.

- El tiempo para los eventos, debe sincronizarse con un servidor de internet, de lo contrario bloquear los eventos.

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
Here you can find content to build your projects or just for play on Ikemen.
- [Mugen Free For All](https://mugenfreeforall.com)
- [Mugen Fighters Guild](https://mugenguild.com/forum/)
- [Infinity Mugen Team](https://www.infinitymugenteam.com)
- [MUGEN ARCHIVE](https://mugenarchive.com/forums/downloads.php)
- [Gamebanana](https://gamebanana.com/games/5694)
- [Mugen Multiverse](https://mugenmultiverse.forumotion.com)

## Tools
Here you can find some tools that help you in development of your projects (Some missed tools are included in the main Ikemen Plus Ultra folder called "tools").
- [Fighter Factory](http://fighterfactory.virtualltek.com/) (A Powerfull Mugen editor)
- [Notepad++](https://notepad-plus-plus.org/) (Script editor)
- [4GB Patch](https://ntcore.com/?page_id=371) (To avoid Runtime Error when load heavy sff files)
- [Mp3Tag](https://www.mp3tag.de/en/) (A music tag editor)
- [Radmin VPN](https://www.radmin-vpn.com/) (For Online Netplay)
- Visual C++ 2010 Express (IDE to edit and compile Source Code)

## Engine Manual
S-SIZE is the programing core language used. It documentation is here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/wiki
- To understand or modify the .lua scripts, you will need knowledge of the LUA programming language. There is the official manual from the version of Lua that uses this engine: https://www.lua.org/manual/5.2/

- For create characters and stages, you have to use the official MUGEN Elecbyte Documentation: http://www.elecbyte.com/mugendocs-11b1/mugen.html

## Discord Support
If you need help, you can find support from developers and contributors for this engine in the official Ikemen Discord Server (**They normally answer questions about Ikemen GO**, so if you are going to ask about something for Ikemen Plus Ultra, **keep in mind that those who use this version can be counted on the fingers of ONE hand**): https://discord.gg/KV5EPnMuA7

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
>- Original Ikemen SSZ Source Code:
>https://osdn.net/users/supersuehiro/pf/ikemen/wiki/FrontPage
>
>- Ikemen Plus (What this project is based on) Source Code:
>https://github.com/acdgames/Ikemen-Plus
>
>- Ikemen Go Plus Source Code:
>https://github.com/K4thos/Ikemen-GO-Plus
>
>- Lastest Ikemen Engine (Ikemen Go) Source Code:
>https://github.com/ikemen-engine/Ikemen-GO

## License
The code is under the MIT Licence.
Non-code assets are under CC-BY 3.0.
Check [License.txt](docs/Licenses/I.K.E.M.E.N.txt) for more details.
