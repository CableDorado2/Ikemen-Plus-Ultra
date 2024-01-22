---------------------------------------------------------------------
DxScan

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

A sample application scanning a media file looking for black frames
 
To call it, you basically need:

   Capture cam;

   cam = new Capture(@"C:\foo.mpg");
   cam.Start();
    
   cam.m_Count is the number of frames
   cam.m_Blacks is how many black frames

Most of the work is done in ISampleGrabberCB.BufferCB.  See the comments 
there.  Also, the algorithm used to scan for black frames isn't as efficient
as it could be.  However, the samples gives you an idea of how this could be
done.