The DESCombine can be used to combine multiple audio and video files, or specific sections
of those files into a single output.  For example, you can take seconds 5-9 of videofile1.avi
combine them with seconds 2-7 of videofile2.mpg, and output them to foo.avi.  Similarly with
audio files.  Note that this is only a small subset of what can be done with DES.

A sample showing how the library can be used from VB is included in the DesCombineVB directory.

When using the sample program, if you want to use both the video and audio from a file, you
should add the same file as both the video and audio file (when using the lib, just call 
AddAVFile).  If you add audio from different files, note that the library doesn't make
any effort to make sure that a given audio clip and a video clip are the same length.
If you have a 5 second audio and a 14 second audio clip playing under two 8 second video 
clips, the second audio clip will start playing as soon as the first audio clip is comlete.
Also, since the audio in this example is longer than the video (19 > 16), you would have 3
seconds of audio with black video.

Here are some step-by-step instructions of how the library might be used.  You should
also check out DESCombine.chm.

Step 1:

Construct the class.  The constructor has parameters for setting the Frames per Second, 
BitCount, and Height & Width of the output file.

Step 2:

Add the files with AddAVFile, AddVideoFile or AddAudioFile.  In addition to the name, you
can specify the start/stop points within the file.

Step 3:

Choose one of the RenderTo* options.  Parameters are used to configure whichever 
rendering option you choose (see the specific rendering option).  Callback pointers 
can be passed to any of these functions.

Step 4:

Start the rendering with StartRendering()

Misc:

There are other functions that may be useful: Cancel(), GetXML(), and Dispose().  Note 
that Dispose should not be called within a Form.Dispose method.  See the method for details.

Events:

FileCompleted - Called when a file has finished processing.  Note that for RenderToWindow, 
sometimes frames get dropped, which can result missed events.

Completed - Called at the end of processing - contains final event code (Complete, UserAbort, 
Disk space problems, etc.

