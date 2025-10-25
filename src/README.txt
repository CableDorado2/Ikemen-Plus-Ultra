Here you can find the Source Code (headers, scripts and libraries) necessary to Open/Modify and Compile the files inside "lib" and "executable" folder for this engine in Visual Studio.

This has been tested on:
- Microsoft Visual Studio 2010 - Version 10.0.30319.1 RTMRel
- Microsoft .NET Framework - Versión 4.8.03761 RTMRel
(During installation, select the "Visual C++ Express" option)

Now, after install Visual C++ 2010 Express, follow the next steps to configure properly your compiler:

1- DON'T MOVE or DELETE ANY FILE inside "d/lib" folder (unless you know what you're doing), because they are carefully ordered to be automatically recognized by the visual c++ project files.

2- Copy and Paste "d" folder in your C:/ directory.

3- Now you can compile in Visual Studio.

---------------------------------
How to compile a library (dll) that this project uses:

0- For this example, we are going to compile the sdlplugin.dll, a vital engine library that provides graphics rendering capabilities through the use of SDL.

1- Open sdlplugin.sln file located in "src/lib/alpha/sdlplugin" directory.

2- Wait for all files to be loaded.

3- At the top of the Visual Studio window, there is a part where it says "Debug" change it to "Release" (next to it there is a green play button). You will need to make sure to do this the first time you open any .sln project.

4- After check that you are in "RELEASE" mode click on the green button or press F7 shortcut and your dll file (in this case the sdlplugin.dll file) will begin to compile (WARNING by default the output path has been configured to replace the current file that is in use on the engine so, before to compile is recommended make a backup of the sdlplugin.dll file from "Ikemen Plus Ultra/lib/alpha/dll" directory).

- If you get the Error:
" 'LINK : fatal error LNK1123: failure during conversion to COFF: file invalid or corrupt' "

while you are trying to compile the ssize executable or mesdialog dll (It probably has to do with they uses a .RC file.), you need to rename the file "cvtres.exe" to anything. For example "cvtres-old.exe". This file is located in Microsoft Visual Studio folder (C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin). More information about that in: https://stackoverflow.com/questions/10888391/error-link-fatal-error-lnk1123-failure-during-conversion-to-coff-file-inval