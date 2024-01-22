/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration.Install;
using System.Configuration;
using System.ServiceProcess;

namespace WebCamService
{
	/// <summary>
	/// The service must be installed before it can execute. 
	/// Services are installed with "installutil.exe" and uninstalled with "installutil.exe /u" with the service executable as the last parameter.
	/// For example, "installutil.exe D:\projects\webcam\webcamservice\obj\debug\webcamservice.exe" will install the service to the Services Manager.
	/// </summary>
	[RunInstaller(true)]
	public class WebCamInstaller: Installer
	{
		private ServiceInstaller serviceInstaller;
		private ServiceProcessInstaller processInstaller;

		public WebCamInstaller()
		{
			// Instantiate installers for process and services.
			processInstaller = new ServiceProcessInstaller();
			serviceInstaller = new ServiceInstaller();

			// The services run under the system account.
			processInstaller.Account = ServiceAccount.LocalSystem;

			// The services are started automatically.
			serviceInstaller.StartType = ServiceStartMode.Automatic;

			// ServiceName must equal those on ServiceBase derived classes.            
			serviceInstaller.ServiceName = "WebCamService";

			// displayed in list
			serviceInstaller.DisplayName = "WebCamService";

			// Add installers to collection. Order is not important.
			Installers.Add(serviceInstaller);
			Installers.Add(processInstaller);
		}
	}
}
