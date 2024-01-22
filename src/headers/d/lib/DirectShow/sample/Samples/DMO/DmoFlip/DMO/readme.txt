DMOFlip - A sample DMO that flips video on either the x or y axis (or both).

VISTA NOTE!  The debug build of the DMO attempts to create a log file at c:\.  In Vista,
this doesn't work.  Either do a release build, or change the location of the logfile to a
directory where you have create/write access.

Also in Vista, the regasm call probably won't run as part of the build (due again to admin
rights issues).  Remove the command from the build events window and run it in a cmd window
that was started with Run as Administrator.

The DMO in this directory is based on the abstract class contained in IMediaObjectImpl.cs.  
The IMediaObjectImpl class is intended to be completely generic, and can be used to create 
other DMOs.  See the readme in the parent directory for descriptions of the steps.

DMOFlip is designed to work with the DMO Wrapper Filter, meaning it can be added to DirectShow 
graphs.  You can find it in GraphEdit under "DMO Video Effects", and the FormDMO sample shows
how to call it programmatically.

The DMOFlip sample takes RGB24 or RGB32 video, and (optionally) flips it.  The flipping mode 
is controlled by the DMOFlip parameter, and can be set using either IMediaParams::SetParam 
or IMediaParams::AddEnvelope.  Valid values for FlipMode:

    FlipMode:
        None = 0,
        FlipY = 1,
        FlipX = 2,
        FlipY + FlipX = 3

Note that some of the cases in the DoFlip routine would benefit greatly (performance-wise) from 
using unsafe code.  I haven't done so in order to keep the sample simple.  However, if you are 
interested, the code might look like this:

// Flip along the X axis
case FlipMode.FlipX:
    // For each row
    for (int x=0; x < m_Height; x++)
    {
        // Calculate the read/write positions
        int s = (x * m_Stride);
        int src = s;
        int dst = (m_Stride - BPP) + s;

        byte* ps = (byte*)(src + pbInData.ToInt32());
        byte* pd = (byte*)(dst + pbOutData.ToInt32());

        // For each pixel in the row
        for (int y=0; y < m_Width; y ++)
        {
            if (BPP == 4)
            {
                *((int *)pd) = *((int*)(ps));
                ps += 4;
                pd -= 4;
            }
            else
            {
                *pd = *ps;
                *((short *)(pd + 1)) = *((short *)(ps + 1));
                ps += 3;
                pd -= 3;
            }
        }
    }
    break;

// Flip along both the X & Y axis
case FlipMode.FlipY | FlipMode.FlipX:

    // For each row
    for (int x=0; x < m_Height; x++)
    {
        // Calculate the read/write positions
        int src = (x * m_Stride);
        int dst = (m_Stride - BPP) + (cbInData - ((x+1) * m_Stride));

        byte* ps = (byte*)(src + pbInData.ToInt32());
        byte* pd = (byte*)(dst + pbOutData.ToInt32());

        // For each pixel in the row
        for (int y=0; y < m_Width; y ++)
        {
            if (BPP == 4)
            {
                *((int *)pd) = *((int*)(ps));
                ps += 4;
                pd -= 4;
            }
            else
            {
                *pd = *ps;
                *((short *)(pd + 1)) = *((short *)(ps + 1));
                ps += 3;
                pd -= 3;
            }
        }
    }
    break;
