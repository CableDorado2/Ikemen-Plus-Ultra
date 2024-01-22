/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Windows.Forms;
using System.Threading;

namespace DirectShowLib.Sample
{
  public class StartUp
  {
    public static string filename;
    public static Configuration config;

    [STAThread]
    static void Main() 
    {
      DialogResult result;

      Application.EnableVisualStyles();

      using (ConfigForm form = new ConfigForm())
      {
        result = form.ShowDialog();
        config = form.config;
      }

      if (result == DialogResult.OK)
      {
        OpenFileDialog openDialog = new OpenFileDialog();

        if (openDialog.ShowDialog() == DialogResult.OK)
        {
          filename = openDialog.FileName;

          Thread initThread = new Thread(new ThreadStart(StartUp.ApplicationLaunch));
#if USING_NET20
          initThread.SetApartmentState(ApartmentState.MTA);
#else
          initThread.ApartmentState = ApartmentState.MTA;
#endif
          initThread.Start();
        }
      }
    }

    static void ApplicationLaunch()
    {
      Application.DoEvents();

      using (MainForm form = new MainForm(config))
      {
        form.Show();

        form.InitializeGraphics();
        form.InitVMR9(StartUp.filename);
        form.Focus();
        Application.Run(form);
      }
    }
  }
}
