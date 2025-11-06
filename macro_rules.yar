rule Macro_Malicious_Example
{
    meta:
        description = "Detects suspicious VBA macro keywords"
        author = "YourName"
        date = "2025-11-06"
        tags = "macro,doc"

    strings:
        $vba1 = "CreateObject" nocase
        $vba2 = "Shell(" nocase
        $vba3 = "AutoOpen" nocase
    condition:
        any of them
}
