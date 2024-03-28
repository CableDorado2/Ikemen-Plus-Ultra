# I.K.E.M.E.N PLUS ULTRA (I.K.E.M.E.N SSZ)
*Ikemen Plus Ultra* is an update version of the **(CLASSIC/OLD) I.K.E.M.E.N PLUS** uploaded by ***acdgames***. This engine was made by ***Suehiro*** under **S-SIZE** language, improved by ***acdgames*** and currently reworked by ***CD2*** and ***Strong FS***. **(If you are looking for the latest or current Ikemen Engine version, is called Ikemen GO)**.

- Consider this version of Ikemen engine an **alternative** in case Ikemen GO doesn't work for you.

- This engine can be used to **create advanced MUGENS** or **Fighting Games**, which can be run on potato PC, without a graphics card (Runs under DirectX Render).

- The current version is a public development release for testing purposes, may contain bugs and incomplete features that we hope will be finished in the final release.

- Help and cooperation are appreciated.

## Minimum System Requirements
- **System:** Windows XP SP3 - 32 Bits (Yeah it works in WinXP)
- **Proccessor:** Intel(R) Atom(TM) CPU N455 1.66GHz
- **Memory:** 1GB RAM
- **Graphics:** Intel(R) Graphics Media Accelerator 3150 - 256MB
- **OpenGL:** Is not need, runs with DirectX 11

## Download
Lastest Version Here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/releases
![v1 3](https://github.com/CableDorado2/Ikemen-Plus-Ultra/assets/18058378/3eee08af-8687-49f9-85b3-d1b43c7f750b)

## Games Made in Ikemen Plus Ultra
- *MUGENGERS: THE OROCHI'S ORIGIN*
- *ULTIMATE SMASHBOX*

## Table of Contents

>[Meaning of All IKEMEN Versions](#meaning-of-all-ikemen-Versions)
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

## Meaning of All IKEMEN Versions
In the words of one most prominent contributors and developers for Ikemen Plus *(PlasmoidThunder):*

**IKEMEN** (retroactively referred to as S-SIZE IKEMEN or Vanilla). Is the First version of the engine.

**IKEMEN Plus** is an unofficial update of the Vanilla version. Is for people who want to mess with the engine beyond modification of Lua files.
It's a quick option to test changes and uses his own S-SIZE (SSZ programing language) which is similar to the C language.

**IKEMEN Plus Ultra** is an unofficial modify/update of the previous version using the same programing language (S-SIZE and Lua) with new features
inspired from Ikemen Go and Commercial Fighting Games.

**IKEMEN GO** is the official latest version of the engine. The original creator (SUEHIRO) abandoned Vanilla in favour of rewriting the engine in 
Google's Go language (hence the name). This version is for people who want their game to follow what MUGEN does but with extra features/fixes. 
Modifying the engine code is beyond most people due to the specific build environment and necessity to compile changes to an executable each time.

**IKEMEN GO Plus** is to GO what IKEMEN Plus was to Vanilla, but over time GO Plus and GO merged into the same thing.

## Default Controls
| Action | Keyboard P1 | Keyboard P2 | Gamepad *(Supported from v1.2 onwards)* |
| --- | --- | --- | --- |
| ↑ | Up Arrow | KP_5 | -3 |
| ↓ | Down Arrow | KP_2 | -4 |
| ← | Left Arrow | KP_1 | -1 |
| → | Right Arrow | KP_3 | -2 |
| A | A | U | 0 |
| B | S | I | 1 |
| C | D | O | 4 |
| X | Z | J | 2 |
| Y | X | L | 3 |
| Z | C | L | 5 |
| **Taunt**/Start | Enter | KP_0 | 9 |
| **Pause**/Resume | P | M | 7 |
| UI Confirm | Enter |  |  |
| UI Back | Esc |  |  |

## TODO List
CD2: Plans for future updates, they are in Spanish, because this is how I understand my ideas (If you can translate them, understand and offer help, will be great for progressing with this engine!):

**v1.4 (Next Update)**
------------

- Tower Mode: https://youtu.be/GAoGLx411Sk?t=3
[![Alt text](https://cdn.videogamesblogger.com/wp-content/uploads/2011/05/mortal-kombat-2011-tower-challenge-guide-screenshot.jpg)](https://youtu.be/GAoGLx411Sk?t=3)

- Cambiar de personaje y stage como lo hace las músicas en training pause.

- La pantalla Demo después del title screen, se debe poder saltar con cualquier tecla antes asignada para jugar.

- Demo Mode deja de funcionar tras usar 1 vez el menú de pausa.

- Arreglar que cuando tienes muchos slots programados en select.lua y 1 personaje cargado en select.def, que no se repita el mismo personaje sino que salga como empty.

**v1.5**
------------

- Probar la logica de tabla para galeria donde cuando llegue al límite combine la lógica de visualización del selector de arcos con el selector de chapters del story mode. Al pulsar hacia abajo debería correr ciertos espacios.

- Implementar handicaps tipo kof13 para el versus mode (no estarán disponibles en online ranked match).

- Agregar opción para configurar los controles de la pelea en char select (Preferiblemente VS Mode y Tournament) excepto en online.

- Agregar opción de Team Duplicates para que si vas a elegir un personaje repetido, se salte la casilla si está activada.

- Co-Op para el Versus Mode.

- Revisar código del Damage Display para que no afecte al bonus de caltwalk ni cause que algunos chars tengan un clon por un helper faltante (Probablemente sea las variables y estados que usa).

- Crear una copia del randomselect llamada randomteamselect que permita insertar la selección de teams aleatorios en select.def a lo kof2002um.

- Implementar los parametros: ordersurvival, hidden, slot y mejorar unlock en select.def

- Que no se ponga punto al empezar a escribir el netplay port y que no se copien en clipboard comillas para el username en opciones.

- Sistema de puntos basado en el Add004.

- Ranking al completar o perder en Modo Arcade.

![Rank Results](https://github.com/CableDorado2/Ikemen-Plus-Ultra/assets/18058378/05f3306c-ab76-4de1-8935-679b83612df1)

- Tournament Mode: https://youtu.be/pjYavslQ0tE?t=3
[![Alt text](https://i.postimg.cc/c4MHqfxv/1560.jpg)](https://youtu.be/7yghLOb1-Gw?t=57)

- Agregar más opciones para el Dummy de Training.

- Cambiar el drawPortrait por una funcion que cargue (así como lo hace con las sprites animation del char select en lugar de leer el airPath que lea el sffPath), probar eso en start.lua y usar en char select una función parecida a f_drawCharAnim.

- Arreglar preview de random chars que no coincida con el char de sprite.

- Agregar Lifebars, Face Portraits y Names para el modo simul cuando se juega de 3P_Simul y 4P_Simul como lo hace Ikemen GO.

- Agregar soporte para Localcoord en cada char y fight.def.

- Probar cargar un commonfx en fight.def para almacenar los sprites del input display y damage display, sin que entren en conflicto con los que quieran portear su fightfx de Mugen.

**v1.6**
------------

- 3er tipo de visualización de stages estilo “chart”, (lógica basada en el char select) al ser activado debe cargarse desde una función diferente a la normal para evitar conflictos, asímismo debe usar los portrait (9000,0) para mostrar los íconos: https://www.youtube.com/watch?v=FHwlSkCkQ50
[![Alt text](https://static.wikia.nocookie.net/streetfighter/images/d/d6/SF%C3%97TK_Cosmic_Elevator_select.jpg/revision/latest?cb=20150201185002&path-prefix=es)](https://youtu.be/FHwlSkCkQ50)

- Legion Mode: https://youtu.be/k1VH6Bv0sas?t=24
[![Alt text](https://m.media-amazon.com/images/I/61bjcbXa+SL.jpg)](https://youtu.be/k1VH6Bv0sas?t=24)

- Integrar la función de bgm.loops.

- Agregar un sistema de "clasificación". Un sistema que almacena información sobre cada personaje particular, y en base a un determinado número de victorias y derrotas, estos ascienden o desciendende rango. Algo así como Bronce, Plata, Oro, Diamante. Y ese rango alcanzado se muestra como una medalla en la misma selección de personaje cuando se coloca sobre el personaje.

- Tag system como un 4to Team Mode. (Info sobre el tag integrado al ikemen plus original): https://mugenguild.com/forum/topics/ikemen-plus-181972.100.html

- Leer archivos movelist.dat dentro de los chars.

- Agregar soporte para reconocer a un 2do Gamepad.

- Al presionar el botón de minimizar/ALT+tab mientras se reproduce un video, al volver el video no se podrá saltar con start e incluso no se podrá cerrar el motor hasta que termine el video.

- El audio del motor debe poder sincronizarse al reproductor de video.

- Crear una función como setDebugScript pero que permita soportar todas las funciones de script.ssz (debug.lua por alguna razón no lo hace) y ejecutarse durante toda la batalla o al menos al final de la partida. Para implementar las siguientes características:

  - Win Screen que se muestra al final de la pelea mientras todos los personajes y los datos del escenario aún están cargados (por lo que podríamos usar el fondo del escenario y los datos de animación de los personajes).

  - Como lo anterior pero para la pantalla Continuar

  - Ambas características se han implementado en el código del paquete de pantalla actual, pero la solución actual tiene un alto rendimiento (aumenta el tiempo de carga cuando se inicia el ejecutable) y no es perfecta (no hay acceso para coincidir con los datos relacionados que a menudo son verificados por winscreens como WinKO, Life, etc.)

**v1.7**
------------

- AttachedChars en Stages: https://youtu.be/90D57uQIGiY?t=8

- Agregar un snd y sprite al obtener perfect, first attack, etc. (fight.ssz).

- Implementar los parametros: music<roudnno>, musicfinal, musiclife, musicvictory en select.def.

- Implementar parametros de transiciones entre stages (round<num>def).

- Al usar data.stage hacer que se puedan reconocer los nombres almacenados en t_stageDef, usando mayusculas y minusculas en lugar de solo minusculas. Ejemplo data.stage = {t_stageDef["stages/**S**akura.def"]} en lugar de data.stage = {t_stageDef["stages/**s**akura.def"]}

- Incluir pregunta para guardar o no los replays online.

- Ver cómo se podría integrar un sistema de diálogo en los matches.

- Notificación al desbloquear logros durante el match + Pantalla de Logros.
![Logros](https://github.com/CableDorado2/Ikemen-Plus-Ultra/assets/18058378/0d62fef2-a96c-4197-b1cb-cc39e72a23a5)

- Buscar una forma de forzar que los datos SFF cargados utilicen una paleta personalizada, ya sea a través de un archivo ACT externo o en el caso de SFFv2, que se almacenen directamente en el archivo.

- Adventure Mode, combinando elementos de:
  - Abyss Mode (BBCF): https://youtu.be/5UI_nFAORnE?t=281
  - Libra of Souls (SoulcaliburVI): https://youtu.be/y3qDzqoeygw?t=381
[![Alt text](https://i.postimg.cc/SRqT8xK0/Adventure-Mode-Concept.png)](https://youtu.be/y82f2VexwHc?t=11596)

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

- Jugar hasta un máximo de 4 jugadores en multiplayer local y online.

- Hacer realidad las funciones del menú Netplay Settings.

- En sala de espera para Host del online, incluir una opción de acceder al training y esperar mientras juegas.

- El tiempo para los eventos, debe sincronizarse con un servidor de internet, de lo contrario bloquear los eventos.

---------------------
v2.0 (Final Release)
---------------------

- Añadir Rollback Netcode.

- Ordenar código y simplificar lo necesario.

- Traducir los textos de menús a Español y Japonés, para habilitar la carga de scripts de acuerdo al idioma en las opciones de Screenpack.

- Portear el Engine a Linux, MacOS, Android y iOS.

## Tutorials
**Basic:**
- How to Add Chars, Stages, Songs and Edit Rows and Columns for Roster: [https://youtu.be/f0OA_4Ml7yE](https://www.youtube.com/watch?v=f0OA_4Ml7yE)
[![Alt text](https://i.ytimg.com/vi/f0OA_4Ml7yE/maxresdefault.jpg)](https://www.youtube.com/watch?v=f0OA_4Ml7yE)

- *Coming Soon!*

**Advanced:**
- *Coming Soon!*


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
- Resource Tuner (Windows executable editor): http://www.restuner.com/
- 4GB Patch (To avoid Runtime Error when load heavy sff files): https://ntcore.com/?page_id=371
- Visual C++ 2010 Express (IDE to open Source Code)
- Mp3Tag (A music tag editor): https://www.mp3tag.de/en/
- Radmin VPN (For Online Netplay): https://www.radmin-vpn.com/

## Engine Manual
S-SIZE is the programing core language used. It documentation is here: https://github.com/CableDorado2/Ikemen-Plus-Ultra/wiki
- To understand or modify the .lua scripts, you will need knowledge of the LUA programming language. There you have the official Lua Manual: https://www.lua.org/manual/5.2/
- For create characters and stages, there you have the official MUGEN Elecbyte Documentation here: http://www.elecbyte.com/mugendocs-11b1/mugen.html

## Discord Support
If you need help, you can find support from developers and contributors for this engine in the official Ikemen Discord Server (**They normally answer questions about Ikemen GO**, so if you are going to ask about something for Ikemen Plus Ultra, **keep in mind that those who use this version can be counted on the fingers of the hands**): https://discord.gg/KV5EPnMuA7

## References
>- Original Repository Source Code:
>https://osdn.net/users/supersuehiro/pf/ikemen/wiki/FrontPage
>
>- Original Ikemen Plus Source Code:
>https://github.com/acdgames/Ikemen-Plus
>
>- Lastest Ikemen Engine (Ikemen Go) Source Code:
>https://github.com/ikemen-engine/Ikemen-GO

## License
The code is under the MIT Licence.
Non-code assets are under CC-BY 3.0.
Check [License.txt](License.txt) for more details.
