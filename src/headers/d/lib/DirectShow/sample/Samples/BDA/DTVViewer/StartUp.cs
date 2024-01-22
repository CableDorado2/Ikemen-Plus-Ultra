/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Windows.Forms;

namespace DirectShowLib.Sample
{
	public sealed class StartUp
	{
    [STAThread]
    static void Main() 
    {
      Application.EnableVisualStyles();
      Application.DoEvents();

      using(MainForm form = new MainForm())
      {
        Application.Run(form);
      }
    }
  }
}
