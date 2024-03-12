Here you can find The Headers. Files and libraries necessary to Open, Modify and Compile the files inside "lib" and "executable" folder for this engine in Visual Studio.

This has been tested on:
- Microsoft Visual Studio 2010 - Version 10.0.30319.1 RTMRel
- Microsoft .NET Framework - Versión 4.8.03761 RTMRel
(During installation, select the "Visual C++ Express" option)

Now, after install Visual C++ 2010 Express, follow the next steps to configure properly your compiler:

0- DON'T MOVE or DELETE ANY FILE inside "d/lib" folder, becase they are carefully ordered.

1- Copy and Paste "d" folder in your C:/ directory.

2- Copy and Paste "v7.0A, v7.1 and v10.0A" folders in: "C:/Program Files (x86)/Microsoft SDKs/Windows/".

3- If you see that you already have those folders (v7.0A, v7.1 and v10.0A), DON'T USE the method of replacing them, it IS BETTER delete them, copy and paste this new ones.

4- Now you can compile in Visual Studio. For example, open sdlplugin.sln file located in "src/lib/alpha/sdlplugin" directory.

5- Wait for all files to be loaded and at the top of the window/program, there is a part where it says "Release", next to it there is a green play button, click on it or press F7 shortcut and the sdlplugin.dll file will begin to compile (WARNING the output path has been configured to replace the current file that is in use on the engine so, before to compile is recommended make a copy of the sdlplugin.dll file from "Ikemen Plus Ultra/lib/alpha/dll" directory).

6- To compile the ssize executable, you need to rename the file "cvtres.exe" located in Microsoft Visual Studio folder (C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin) to avoid Error 'LINK : fatal error LNK1123: failure during conversion to COFF: file invalid or corrupt'. More information about that in: https://stackoverflow.com/questions/10888391/error-link-fatal-error-lnk1123-failure-during-conversion-to-coff-file-inval