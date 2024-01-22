---------------------------------------------------------------------
CapWMV

A .NET sample application using the WM ASF Writer filter to create
an wmv file
  
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

This sample uses IConfigAsfWriter::ConfigureFilterUsingProfileGuid to configure the writer.  This method is DEPRECATED by Microsoft.  The reason they did this is that the number of configuration options grew too large, and creating a separate guid for all the permutations wasn't practical.

The new method is using IConfigAsfWriter::ConfigureFilterUsingProfile.  However, that method requires IWMProfile, which in turn requires IWMStreamConfig, which requires...  Rather than duplicate all the "WindowsMedia" interfaces in a "DirectShow" library, if you want to use the new approach, use the WindowsMediaLib.

However, if you MUST use guids, you can find them defined in %windir%\WMSysPr9.prx