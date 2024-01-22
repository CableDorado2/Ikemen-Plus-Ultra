This sample shows how to work with the dvr-ms files created when working with SBE.
It enhances the first DvrmsCutter by allowing the copy multiple segments of the source instead of just one. 
Handy to remove advertisements from your favorite tv series...

The main program is just a consumer of the SBECutter2 class that can be reuse in any other programs

The sample consist in a command line utility that has the following options:

Usage : DvrMsCutter.exe Source Destination Segment1 Segment2 ... SegmentN

Source : must be an existing dvr-ms file
Destination : the result dvr-ms file (warning : overwritten if already exist)
Segment : the start and the end of a segment in this format : hh:mm:ss-hh:mm:ss

The sample only work with .Net 2.0 but can easily adapted to an older framework version.
