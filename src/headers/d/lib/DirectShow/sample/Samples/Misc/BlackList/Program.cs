using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace DirectShowLib.Samples
{
  class Program
  {
    [STAThread]
    static void Main(string[] args)
    {
      string filename;

      using (OpenFileDialog dialog = new OpenFileDialog())
      {
        dialog.Filter = "Audio Files(*.wav;*.mp3;*.wma)|*.wav;*.mp3;*.wma|Video Files(*.avi;*.wmv)|*.avi;*.wmv|All files (*.*)|*.*";

        if (dialog.ShowDialog() != DialogResult.OK)
          return;

        filename = dialog.FileName;
      }

      using (SimplePlayer player = new SimplePlayer(filename))
      {
        player.Play();

        Console.WriteLine("Press Enter to exit this program");
        Console.ReadLine();
      }
    }
  }
}
