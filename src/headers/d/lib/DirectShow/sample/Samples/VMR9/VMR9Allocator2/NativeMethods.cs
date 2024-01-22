/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace DirectShowLib.Sample
{
  [System.Security.SuppressUnmanagedCodeSecurity]
  internal sealed class NativeMethods
  {
    [DllImport("user32.dll")]
    public static extern int InvalidateRect(
      IntPtr hwnd,
      IntPtr rect,
      int erase
      );
  }
}
