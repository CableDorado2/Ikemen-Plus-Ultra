---------------------------------------------------------------------
DxSnap

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

Use DirectShow to take snapshots from the Still pin of a capture 
device.  Note the MS encourages you to use WIA for this, but if 
you want to do in with DirectShow and C#, here's how. 

Note that this sample will only work with devices that output uncompressed
video as RBG24.  This will include most webcams, but probably zero tv tuners.