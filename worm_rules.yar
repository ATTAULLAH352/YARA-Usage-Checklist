rule Worm_Sample_Example
{
    meta:
        description = "Detects worm-like behaviour strings"
        author = "YourName"
        date = "2025-11-06"
        tags = "worm"

    strings:
        $cmd = "email_send(" ascii
        $prop = "mass_email" nocase
    condition:
        any of them
}
