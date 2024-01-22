/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

The Generic Sample Source Filter - A way to implement a source filter in c#

What it does/Why you might want it:
==================================
There are a number of ways you can modify frames as they go down the graph (see DxLogo or
DmoFlip).  However, until now there wasn't a way to GENERATE frames.  This filter allows 
you to be the source of samples for the graph.  And it doesn't require those samples 
to be video.


Why I wrote this filter:
=======================

(If you don't care why I wrote this filter, skip down to "How to use this filter")

The reason I wrote this filter was to overcome one of the remaining restrictions to using c#
to do DirectShow programming.  When we released version 1.0 of this library, you could build 
and run graphs, but only using existing filters.  It wasn't until version 1.2 that we added
support for writing DMOs in c#.  DMOs are essentially a light-weight filter.  Using the DMO
Wrapper Filter, you could write your own filters and add them to the graph (check out the
DmoFlip and DmoSplit samples).

However, the DMO Wrapper filter has limitations:

"It does not support DMOs with zero inputs, multiple inputs, or zero outputs. 
(It does support DMOs with one input and multiple outputs.)"

These are the limitations I'm working to overcome.  With that, c# can be used to write the 
majority of the filters that you are likely to need:

1) The easiest part of this to overcome was the part about zero outputs.  I'm not quite sure
why this limitation is there.  DMOWF doesn't seem to have any problem having an output pin with
nothing connected to it.  Given this, you should be able to create an output pin, and just reject 
all attempts to connect to it.  It ain't pretty, but it should work fine.  See the existing DMO 
samples for how to deal with what DMOWF does when nothing is connected to the output pin.

2) Zero inputs was a little tougher.  That's what this filter is designed to do.  Zero inputs means
that the filter only does outputs, which is essentially the definition of a source filter.  This source
filter is given its MediaType by the application.  It also calls the application to populate each of the
samples to send down the graph.

It isn't a perfect solution.  Specifically, this filter doesn't support multiple output pins (although
you could have this filter output a single stream which is split downstream by a DMO that you write).  It
also doesn't allow you to add support for other interfaces.  If you need your source filter to support 
IQualityControl, IPinFlowControl or some such, you will need to do some c++ coding.  However, my (limited)
DS experience suggests those needs are relatively uncommon.

3) Multiple inputs - Yeah, this one.  Well, I don't have a solution to this one just now.  If there is 
enough demand, I might revisit this, but I don't expect to see it.

You might ask why you can't just write filters the same way they do in c++.  There are several answers to this,
but the core issue is that c++ uses a large, complicated, inter-related library of routines called the BaseClasses.
That library isn't a COM object, it's a set of c++ class & routines that get linked directly into the c++ application.
Converting this to managed code is a non-trivial effort.  While it may be possible, it's a huge effort.  Not just in 
coding, but in testing.  The BaseClasses have been available in source form for many years.  Any problems have been
shaken out by generations of c++ coders.  Unless and until we see that there is enough demand for this by people who 
are willing to commit their own time and effort to make it happen, it's not going to happen.  Unless someone else does 
it.

Finally, c# is not necessarily a perfect environment for creating filters.  As Alessandro once 
pointed out to me over in microsoft.public.win32.programmer.directx.video:

"CPU-intensive tasks or large scale ones, like video 
encoders/decoders and effects, HD stuff or multiple streams 
processors, sometimes can barely run on fast machines even 
when written in highly optimized native code, so you can not 
afford the luxury of managed code."

And he is correct.  c# is many things, some good, some bad.  However, it does not generate 
the fastest possible code.  So if you are writing the next generation MPEG encoder/decoder, perhaps
c# isn't your best bet.  It should go without saying (but I'm going to say it anyway), that you should
always use the right tool for the job.  If performance is king, it's time to consider c++.


How to use this filter:
======================

Before you can use the filter for the first time, you must register it with COM.  Copy the file to where you want to install
it and run "RegSvr32 GSSF.ax".  A pre-built copy of the filter is included.

This is a filter like any other filter.  It has a CLSID (6F7BCF72-D0C2-4449-BE0E-B12F580D056D) and can be loaded like any
other COM object.  See BuildGraph.cs for an example of how to create an instance of this class and add it to the graph.  However,
don't expect to see anything unusual.  You might consider copying PushClasses.cs (or its contents) into your project since 
it has the class/interface definitions for this filter.

After you have added the filter to the graph, you will need to configure it.  To start, you must tell it the MediaType it 
is going to support (AMMediaType).  There are three methods that you can use to do this.  You can use any ONE of them:

   int SetMediaTypeFromBitmap(BitmapInfoHeader bmi, long lFPS);
   int SetMediaType([MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt);
   int SetMediaTypeEx([MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt, int lBufferSize);

If you are going to be doing video, and you are getting your video from files, consider using SetMediaTypeFromBitmap.  Parameter1
is a BitmapInfoHeader that describes the video images.  Parameter 2 is the FramesPerSecond at which you will be providing frames.
The rest of the members of the AMMediaType struct are populated with reasonable values.

If that is too limited for you (for example if you want finer control over the subtype), consider using SetMediaType.  Note
that this form still requires the FormatType to be VideoInfoHeader.

For maximum flexibility, you can use SetMediaTypeEx (for example if you are doing sound or need to support VideoInfoHeader2).  
The second parameter is the buffer size for the samples you will be sending.

After you have used ONE (and only one) of the methods above to set the media type, you will need to set the callback method.  

   int SetBitmapCB(IGenericSampleCB pfn);

The IGenericSampleCB interface only has 1 method:

   int SampleCallback(IMediaSample pSample);
		
Each time the c++ FillBuffer method is called by the BaseClasses, it will turn around and call your callback routine and provide
the IMediaSample that the BaseClasses sent to get populated.  The callback routine is solely responsible for populating all
necessary members of that class.

A few things to know:
====================

- You MUST MUST MUST release the IMediaSample before returning from the callback routine.  Otherwise the graph will hang after
about 2 samples.

- ALL SAMPLES SENT DOWN THE FILTERGRAPH MUST HAVE THE SAME ATTRIBUTES!  When you provide the AMMediaType, you specify information
about the samples (including width/height/pixeldepth, etc).  All samples must meet those definitions (which is why you can only
call the SetMediaType* methods once).  When other filters connect to this filter, they make assumptions and allocate memory based 
on the information in the AMMediaType.  That information must remain constant, or those other filters will misbehave (this isn't 
100% true, but if you know the exception, you know the implications).

- Signaling end of stream: When you have no more samples to send to the graph, return 1 (S_FALSE) from your callback.  You can
also return any HRESULT error you like, which will terminate the graph with an error.

- Building the filter: The source to the filter is included.  However, you will need to have the base class libraries.  MS ships
the code to the libraries, but does not include the actual LIB files, so you need to build them first.  Then update this project
to point to them.  A pre-built release version of the filter is included (GSSF.ax).  Make sure you  run "RegSvr32 GSSF.ax" before
you use it.

- To uninstall the filter, run "regsvr32 /u gssf.ax".

- The code in the cpp file is pretty clean.  It is based on the PushSource sample from the DXSDK, but there isn't much left of the
original sample code (mostly class and file names).  If you are comfortable at all with c++ code, this really isn't so bad to read.  
The main file of interest is PushSourceBitmap.cpp which is only ~350 (well-commented) lines.  I have changed the CLSID, so there is 
no conflict with the original sample.

- The code that shows how to use the sample (the Renderer project) shows bitmaps.  It has two different ways to generate bitmaps.
One reads a collection of jpeg files (not included) in a specific directory.  The other way just creates random color bitmaps.  
Remember, the Generic Sample Source Filter doesn't HAVE to generate video images.  You could do sounds, streams, whatever data
you like.  I just used video because it's easy.

- This filter isn't very useful in GraphEdt.  Remember, the MediaType comes from the application.  GraphEdt doesn't supply
any way to support this, so the filter won't allow anything to connect to its output pin (although in theory I suppose I could
do some sort of property page).  Plus, what would it use for the callback?
