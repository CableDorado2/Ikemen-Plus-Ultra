DMOSplit - A sample DMO that turns stereo sound into two mono streams

VISTA NOTE!  The debug build of the DMO attempts to create a log file at c:\.  In Vista,
this doesn't work.  Either do a release build, or change the location of the logfile to a
directory where you have create/write access.

Also in Vista, the regasm call probably won't run as part of the build (due again to admin
rights issues).  Remove the command from the build events window and run it in a cmd window
that was started with Run as Administrator.

The DMO in this directory is based on the abstract class contained in IMediaObjectImpl.cs.  
The IMediaObjectImpl class is intended to be completely generic, and can be used to create 
other DMOs.  See the readme in the parent directory for descriptions of the steps.

DMOSplit is designed to work with the DMO Wrapper Filter, meaning it can be added to DirectShow 
graphs.  You can find it in GraphEdit under "DMO Audio Effects", and the FormDMO sample shows
how to call it programmatically.

Note that while the DoSplit routine might benefit (performance-wise) from using unsafe code, 
I haven't done so in order to keep the sample simple.  This is a sample, not production code.
