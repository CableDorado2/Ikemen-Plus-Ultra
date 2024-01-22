/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Runtime.InteropServices;

using DirectShowLib;

namespace DirectShowLib.Sample
{
	public class MainForm : System.Windows.Forms.Form
	{
    private System.Windows.Forms.MenuItem menuItem5;
    private System.Windows.Forms.MainMenu mainMenu;
    private System.Windows.Forms.MenuItem menuFile;
    private System.Windows.Forms.MenuItem menuFilePlayFile;
    private System.Windows.Forms.MenuItem menuFileCloseFile;
    private System.Windows.Forms.MenuItem menuFileExit;
    private System.Windows.Forms.MenuItem menuHelp;
    private System.Windows.Forms.MenuItem menuHelpAbout;

    private System.Windows.Forms.OpenFileDialog openFileDialog;

    private System.ComponentModel.Container components = null;

    private IGraphBuilder graph = null;
    private IBaseFilter filter = null;
    private IMediaControl mediaControl = null;
    private Allocator allocator = null;

    private IntPtr userId = new IntPtr(unchecked((int)0xACDCACDC));

		public MainForm()
		{
			InitializeComponent();
		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Code généré par le Concepteur Windows Form
		/// <summary>
		/// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
		/// le contenu de cette méthode avec l'éditeur de code.
		/// </summary>
		private void InitializeComponent()
		{
      System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(MainForm));
      this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
      this.mainMenu = new System.Windows.Forms.MainMenu();
      this.menuFile = new System.Windows.Forms.MenuItem();
      this.menuFilePlayFile = new System.Windows.Forms.MenuItem();
      this.menuFileCloseFile = new System.Windows.Forms.MenuItem();
      this.menuItem5 = new System.Windows.Forms.MenuItem();
      this.menuFileExit = new System.Windows.Forms.MenuItem();
      this.menuHelp = new System.Windows.Forms.MenuItem();
      this.menuHelpAbout = new System.Windows.Forms.MenuItem();
      // 
      // openFileDialog
      // 
      this.openFileDialog.Filter = "Video Files (.ASF, .AVI, .MPG, .MPEG, .VOB, .QT, .WMV)|*.ASF;*.AVI;*.MPG;*.MPEG;*" +
        ".VOB;*.QT;*.WMV|All Files (*.*)|*.*";
      this.openFileDialog.Title = "Select a video file to play...";
      // 
      // mainMenu
      // 
      this.mainMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                             this.menuFile,
                                                                             this.menuHelp});
      // 
      // menuFile
      // 
      this.menuFile.Index = 0;
      this.menuFile.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                             this.menuFilePlayFile,
                                                                             this.menuFileCloseFile,
                                                                             this.menuItem5,
                                                                             this.menuFileExit});
      this.menuFile.Text = "&File";
      // 
      // menuFilePlayFile
      // 
      this.menuFilePlayFile.Index = 0;
      this.menuFilePlayFile.Text = "&Play File...";
      this.menuFilePlayFile.Click += new System.EventHandler(this.menuFilePlayFile_Click);
      // 
      // menuFileCloseFile
      // 
      this.menuFileCloseFile.Index = 1;
      this.menuFileCloseFile.Text = "&Close File";
      this.menuFileCloseFile.Click += new System.EventHandler(this.menuFileCloseFile_Click);
      // 
      // menuItem5
      // 
      this.menuItem5.Index = 2;
      this.menuItem5.Text = "-";
      // 
      // menuFileExit
      // 
      this.menuFileExit.Index = 3;
      this.menuFileExit.Text = "E&xit";
      this.menuFileExit.Click += new System.EventHandler(this.menuFileExit_Click);
      // 
      // menuHelp
      // 
      this.menuHelp.Index = 1;
      this.menuHelp.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                             this.menuHelpAbout});
      this.menuHelp.Text = "&Help";
      // 
      // menuHelpAbout
      // 
      this.menuHelpAbout.Index = 0;
      this.menuHelpAbout.Text = "&About VMR9Allocator..";
      this.menuHelpAbout.Click += new System.EventHandler(this.menuHelpAbout_Click);
      // 
      // MainForm
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.BackColor = System.Drawing.Color.White;
      this.ClientSize = new System.Drawing.Size(592, 466);
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.Menu = this.mainMenu;
      this.Name = "MainForm";
      this.Text = "Plug-in Allocator-Presenter for VMR 9";
      this.Closing += new System.ComponentModel.CancelEventHandler(this.MainForm_Closing);

    }
		#endregion

		[STAThread]
		static void Main() 
		{
      using(MainForm form1 = new MainForm())
      {
        Application.Run(form1);
      }
		}

    private string GetMoviePath()
    {
      if (openFileDialog.ShowDialog(this) == DialogResult.OK)
      {
        return openFileDialog.FileName;
      }
      else
        return string.Empty;
    }

    private void CloseGraph()
    {
      FilterState state;

      if (mediaControl != null)
      {
        do
        {
          mediaControl.Stop();
          mediaControl.GetState(0, out state);
        } while (state != FilterState.Stopped);

        mediaControl = null;
      }

      if (allocator != null)
      {
        allocator.Dispose();
        allocator = null;
      }

      if (filter != null)
      {
        Marshal.ReleaseComObject(filter);
        filter = null;
      }


      if (graph != null)
      {
        RemoveAllFilters();

        Marshal.ReleaseComObject(graph);
        graph = null;
      }
    }

    public void RemoveAllFilters()
    {
      int hr = 0;
      IEnumFilters enumFilters;
      ArrayList filtersArray = new ArrayList();

      hr = graph.EnumFilters(out enumFilters);
      DsError.ThrowExceptionForHR(hr);

      IBaseFilter[] filters = new IBaseFilter[1];

      while(enumFilters.Next(filters.Length, filters, IntPtr.Zero) == 0)
      {
        filtersArray.Add(filters[0]);
      }

      foreach(IBaseFilter filter in filtersArray)
      {
        hr = graph.RemoveFilter(filter);
        while (Marshal.ReleaseComObject(filter) > 0);
      }
    }

    private void StartGraph()
    {
      int hr = 0;

      CloseGraph();

      string path = GetMoviePath();
      if (path == string.Empty)
        return;

      try
      {
        graph = (IGraphBuilder) new FilterGraph();
        filter = (IBaseFilter) new VideoMixingRenderer9();

        IVMRFilterConfig9 filterConfig = (IVMRFilterConfig9) filter;
      
        hr = filterConfig.SetRenderingMode(VMR9Mode.Renderless);
        DsError.ThrowExceptionForHR(hr);

        hr = filterConfig.SetNumberOfStreams(2);
        DsError.ThrowExceptionForHR(hr);

        SetAllocatorPresenter();

        hr = graph.AddFilter(filter, "Video Mixing Renderer 9");
        DsError.ThrowExceptionForHR(hr);

        hr = graph.RenderFile(path, null);
        DsError.ThrowExceptionForHR(hr);

        mediaControl = (IMediaControl) graph;

        hr = mediaControl.Run();
        DsError.ThrowExceptionForHR(hr);
      }
      catch
      {
      }
    }

    private void SetAllocatorPresenter()
    {
      int hr = 0;

      IVMRSurfaceAllocatorNotify9 vmrSurfAllocNotify = (IVMRSurfaceAllocatorNotify9) filter;

      try
      {
        allocator = new Allocator(this);

        hr = vmrSurfAllocNotify.AdviseSurfaceAllocator(userId, allocator);
        DsError.ThrowExceptionForHR(hr);

        hr = allocator.AdviseNotify(vmrSurfAllocNotify);
        DsError.ThrowExceptionForHR(hr);
      }
      catch
      {
        allocator = null;
        throw;
      }
    }

    private void menuFilePlayFile_Click(object sender, System.EventArgs e)
    {
      StartGraph();
    }

    private void menuFileCloseFile_Click(object sender, System.EventArgs e)
    {
      CloseGraph();
      this.Invalidate();
    }

    private void menuFileExit_Click(object sender, System.EventArgs e)
    {
      this.Close();
    }

    private void menuHelpAbout_Click(object sender, System.EventArgs e)
    {
      string title = "About VMR9 Allocator Sample";
      string text = "DirectShow.Net VMR9 Allocator Sample";

      AboutBox.Show(title, text);
    }

    private void MainForm_Closing(object sender, System.ComponentModel.CancelEventArgs e)
    {
      CloseGraph();
    }
	}
}
