using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Text.RegularExpressions;

using Microsoft.Win32;

using DirectShowLib;

namespace DirectShowLib.Samples
{
  /// <summary>
  /// The BlackListManager class is an implementation of the IAMGraphBuilderCallback interface.
  /// </summary>
  /// <remarks>
  /// Loosly based on the The March Hare's sample: http://tmhare.mvps.org/downloads/GraphBuilderCallback.zip
  /// </remarks>
  [ComVisible(true)]
  public class BlackListManager : IAMGraphBuilderCallback
  {
    const int S_OK = 0;
    const int E_FAIL = unchecked((int)0x80004005);

    private List<Guid> blackList;

    /// <summary>
    /// Create an instance of the BlackListManager
    /// </summary>
    /// <param name="graphBuilder">The Filter Graph to register on.</param>
    public BlackListManager(IGraphBuilder graphBuilder)
    {
      if (graphBuilder == null)
        throw new ArgumentNullException("graphBuilder");

      IObjectWithSite ows = (IObjectWithSite)graphBuilder;
      
      int hr = ows.SetSite(this);
      DsError.ThrowExceptionForHR(hr);

      this.blackList = new List<Guid>();
    }

    /// <summary>
    /// Add a Filter CLSID to black list during the graph building.
    /// </summary>
    /// <param name="clsid">The CLSID of the filter to black list.</param>
    public void AddBlackListedFilter(Guid clsid)
    {
      this.blackList.Add(clsid);
    }

    /// <summary>
    /// This method is for internal purpose. Don't call it directly.
    /// </summary>
    /// <param name="filter"></param>
    /// <returns></returns>
    public int CreatedFilter(IBaseFilter filter)
    {
      // The rejection of the blacklisted filter have already been made in the SelectedFilter method.
      // So we do nothing here.
      return S_OK;
    }

    /// <summary>
    /// This method is for internal purpose. Don't call it directly.
    /// </summary>
    /// <param name="moniker"></param>
    /// <returns></returns>
    public int SelectedFilter(IMoniker moniker)
    {
      if (moniker == null)
        throw new ArgumentNullException("moniker");

      int retval = S_OK;

      string monikerDisplayName = null;
      Guid filterClsid;

      // Get the moniker's display name.
      // DirectShow filter have this form: @device:sw:FilterCategory\CLSID
      moniker.GetDisplayName(null, null, out monikerDisplayName);

      Debug.WriteLine(string.Format("\r\nBlackListManager.SelectedFilter:\r\nMoniker: {0}", monikerDisplayName));

      // Did the display name normally composed ?
      int i = monikerDisplayName.LastIndexOf('\\');
      if (i != -1)
      {
        // Yes, tring to get the CLSID
        if (GuidTryParse(monikerDisplayName.Substring(i + 1), out filterClsid))
        {
          // Display informations about this filter
          this.DisplayDebugInformation(moniker, filterClsid);

          // Test if the filter is black-listed
          if (this.blackList.Contains(filterClsid))
          {
            Debug.WriteLine("WARNING: This filter is black-listed! Rejecting it.");

            // The filter is black listed. Rejecting it.
            retval = E_FAIL;
          }
        }
      }

      return retval;
    }

    /// <summary>
    /// Helper method to parse GUID from strings
    /// </summary>
    private static bool GuidTryParse(string s, out Guid result)
    {
      result = Guid.Empty;

      string guidMatchPattern = "^[A-Fa-f0-9]{32}$|" +
        "^({|\\()?[A-Fa-f0-9]{8}-([A-Fa-f0-9]{4}-){3}[A-Fa-f0-9]{12}(}|\\))?$|" +
        "^({)?[0xA-Fa-f0-9]{3,10}(, {0,1}[0xA-Fa-f0-9]{3,6}){2}, {0,1}({)([0xA-Fa-f0-9]{3,4}, {0,1}){7}[0xA-Fa-f0-9]{3,4}(}})$";

      if (string.IsNullOrEmpty(s) || !(new Regex(guidMatchPattern)).IsMatch(s))
        return false;

      result = new Guid(s);
      return true;
    } 

    /// <summary>
    /// Display the DLL that host the filter and a Friendly name.
    /// </summary>
    [Conditional("DEBUG")]
    private void DisplayDebugInformation(IMoniker moniker, Guid filterClsid)
    {
      IPropertyBag propertyBag = null;

      try
      {
        string registryPath = string.Format(@"HKEY_CLASSES_ROOT\CLSID\{0}\InprocServer32", filterClsid.ToString("B"));
        string filterLocation = (string)Registry.GetValue(registryPath, string.Empty, string.Empty);

        object o;
        Guid IID_IPropertyBag = typeof(IPropertyBag).GUID;

        moniker.BindToStorage(null, null, ref IID_IPropertyBag, out o);
        propertyBag = (IPropertyBag)o;

        int hr = propertyBag.Read("FriendlyName", out o, null);
        Marshal.ThrowExceptionForHR(hr);

        string friendlyName = o.ToString();

        Debug.WriteLine(string.Format("Localtion: {0}\r\nFriendly Name: {1}", filterLocation, friendlyName));
      }
      catch { }
      finally
      {
        if (propertyBag != null)
          Marshal.ReleaseComObject(propertyBag);
      }
    }


  }
}
