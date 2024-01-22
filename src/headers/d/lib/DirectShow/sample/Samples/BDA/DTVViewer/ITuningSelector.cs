/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;

using DirectShowLib;
using DirectShowLib.BDA;

namespace DirectShowLib.Sample
{
	public interface ITuningSelector
	{
    ITuningSpace TuningSpace {get;}
    ITuneRequest TuneRequest {get;}

    bool TuneSelect();
	}
}
