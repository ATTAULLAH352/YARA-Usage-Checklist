rule PowerShell_Obfuscated
{
    meta:
        description = "Detects likely obfuscated PowerShell commands"
        author = "YourName"
        date = "2025-11-06"
        tags = "powershell,obfuscation"

    strings:
        $b64 = "FromBase64String" nocase
        $iex  = "Invoke-Expression" nocase
        $wc   = "System.Net.WebClient" nocase
    condition:
        2 of ($b64, $iex, $wc)
}
