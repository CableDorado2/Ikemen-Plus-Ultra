/************************************************************************

DirectShowLib - Provide access to DirectShow interfaces via .NET
Copyright (C) 2005
http://sourceforge.net/projects/directshownet/

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

**************************************************************************/

This sample illustrate how to use the IAMGraphBuilderCallback interface to 
reject some filters during the graph creation. You can adapt this sample for 
your uses if some filters are known to break your application.

This sample is loosly based on the The March Hare's sample: 
http://tmhare.mvps.org/downloads/GraphBuilderCallback.zip

This sample blacklist the ffdshow audio and video filters. This filters are 
the best thing and the worst thing in DirectShow. Best, because they allow
reading a vast variety of media files. Worst, because there developpers never
implemented the MERIT correctly so that other filters have no chances to be 
choiced by the runtime even when they are better. This is probably one of the 
reason why MS added the IAMPluginControl in Windows 7, but that's another 
story. Some reading:
http://alax.info/blog/398
http://alax.info/blog/719
