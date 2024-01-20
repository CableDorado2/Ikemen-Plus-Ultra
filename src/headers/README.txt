Here you can find The Headers. Files and libraries necessary to Open, Modify and Compile the files inside "alpha" folder for this engine in Visual Studio.

This has been tested on:
- Microsoft Visual Studio 2010 - Version 10.0.30319.1 RTMRel
- Microsoft .NET Framework - Versión 4.8.03761 RTMRel
(During installation, select the "Visual C++ Express" option)

Now, after install Visual C++ 2010 Express, follow the next steps to configure properly your compiler:

0- DON'T MOVE or DELETE ANY FILE inside "d/lib" folder, becase they are carefully ordered.

1- Copy and Paste "d" folder in your C:/ directory.

2- Copy and Paste "v7.0A, v7.1 and v10.0A" folders in: "C:/Program Files (x86)/Microsoft SDKs/Windows/".

3- If you see that you already have those folders (v7.0A, v7.1 and v10.0A), DON'T USE the method of replacing them, it IS BETTER delete them, copy and paste this new ones.

4- Now you can compile in Visual Studio. For example, open sdlplugin.sln file located in "Ikemen Plus Ultra/src/alpha/sdlplugin" directory.

5- Wait for all files to be loaded and at the top of the window/program, there is a part where it says "Release", next to it there is a green play button, click on it or press F7 shortcut and the sdlplugin.dll file will begin to compile.

6- Is recommended that you delete or make a copy of the sdlplugin.dll file from "Ikemen Plus Ultra/lib/alpha/dll" directory, so you can see that the new file was generated in that directory.