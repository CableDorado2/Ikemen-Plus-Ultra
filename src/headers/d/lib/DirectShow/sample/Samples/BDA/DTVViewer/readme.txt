DTVViewer - A basic Digital TV (BDA) viewer sample (version 1.2)

This sample demonstrates how to use BDA to display Digital TV into a Windows 
Form.

This application asks the user for tuning parameters. You have to know most of
them to have a working Tune Request.

DVB-T parameters are directly dependent on the emiter to which your roof 
antenna is pointing. Each country's broadcasting DVB-T TVs have a website with
that informations. Worst case, http://www.dvb.org/ can be a good start...

DVB-S parameters depend on the satellite pointed to by your dish antenna. 
Websites like http://www.lyngsat.com/ or http://en.kingofsat.net/ can be really
useful!

Files in this project :

StartUp.cs : A StartUp class with the application main entry point. Windows XP
enhanced UI is activated here.

MainForm.cs : The application main form. Nothing DirectShow specific, just 
plain .Net stuff. This form uses the BDAGraphBuilder class to drive the 
DirectShow graph and do the tuning through a class implementing 
ITuningSelector.

ITuningSelector.cs : An interface to vitualize the tuning process. In this 
application, tuning parameters are requested from the user but this task could 
easily be replaced by data coming from a DB, an XML file or whatever.

DVBSTuning.cs & DVBTTuning.cs : Two Windows Forms designed to ask the user the
tuning parameters like the Carrier Frequency, etc. They also implement the 
ITuningSelector interface (see later). With this architecture, it's easy to add
support to ATSC or DVB-C networks.

BDAGraphBuilder.cs : This is here the real Magic is! This class builds the BDA
graph and tunes it with Tune Requests provided by DVBSTuning or DVBTTuning 
forms.

About BDA driver models :

A Digital TV hardware broadly provide 3 main functions :
	1) Tuner : filters the particular frequency that carries the transport 
	stream.
	2) Demodulator : translates the analog signal into a digital bit stream.
	3) Capture : moves the data into host memory.

The BDA driver model allow IHV to provide drivers that physicaly appear in 
GraphEdit in three flavor :
	1) The all-in-one filter model : The three functions are grouped in a 
	single filter. This filter can be connected directly between the Network 
	Provider and the MPEG-2 Demultiplexor. USB devices usually support this
	model...
	2) The two filters model : The driver provide 2 filters. The first combine
	the Tuner and the Demodulator functions and the second is for the Capture 
	function. You need to connect the two filters together to be able to build
	a working chain between the Network Provider and the MPEG-2 Demultiplexor. 
	This is the most commun driver model. Almost all PCI hardware drivers are 
	built using this model.
	3) The three filters model : The driver provide 3 filters, one for each 
	functions. You need to connect the three filters together to be able to 
	build a working chain between the Network Provider and the MPEG-2 
	Demultiplexor. I never see this model in real life but it is technicaly 
	possible...

The version (1.1) had been upgraded to support the three models (hope so)...

In this new version, I have modified the ConnectFilters method (from the 
BDAGraphBuilder.cs file) to handle the new behaviour of the Windows Seven's 
MPEG-2 Demux (see comments in the source code). This sample should also handle 
HDTV with the MS's audio and video decoders.
