rule Ransomware_Example
{
    meta:
        description = "Example rule for detecting ransomware-like strings"
        author = "YourName"
        date = "2025-11-06"
        tags = "ransomware"

    strings:
        $s1 = "Please send" nocase
        $s2 = "decrypt" nocase
        $s3 = "Contact us at" nocase
        $h1 = { 52 61 6E 73 6F 6D }  /* ascii hex for 'Ransom' (example) */

    condition:
        (any of ($s*)) or ($h1)
}
